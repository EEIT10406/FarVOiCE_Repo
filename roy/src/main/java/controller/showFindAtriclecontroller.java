package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.bean.PostBean;
import model.service.PostService;

@Controller

public class showFindAtriclecontroller {
	@Autowired
	private PostService postService;
	
	@RequestMapping(path="/findArticle/findArticle.controller",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String showAllArticleFromPost(Model model,PostBean newPostBean,
			HttpSession session,String user,String searchString) {
			//show全部的文章
			System.out.println("searchString--->"+searchString);
			List<PostBean> posts = postService.showAllArticleInFindArticle(true);
			//用gson包成json送回前端
			Gson gson = new Gson();
			String jsonList = gson.toJson(posts);
			return jsonList;

		
	}
}
