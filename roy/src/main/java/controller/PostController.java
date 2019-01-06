package controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.bean.MemberBean;
import model.bean.PostBean;
import model.service.PostService;

@Controller
public class PostController {
	@Autowired
	private PostService postService;
	@RequestMapping(path="/personalPage/Post.controller")
	public String post(Model model,PostBean newPostBean,HttpSession session) {
//		post_idS		int		identity	primary key,
//		post_idM		int			REFERENCES Post (post_idS),--發文本人此欄位為null
//		member_username	varchar(30) REFERENCES member (member_username),ok
//		post_content	varchar(800),   ok
//		post_time		datetime,		ok
//		post_privacy	bit,
		if(newPostBean!=null) {
			System.out.println(newPostBean.getPost_content());
			Date now = new Date();
			newPostBean.setPost_time(now);
			MemberBean memberWhoPost = (MemberBean)session.getAttribute("user");
			newPostBean.setMember_username(memberWhoPost.getMember_username());
			System.out.println(newPostBean);
			//model
			PostBean newArticle = postService.postNewArticle(newPostBean);
			return "redirect:/personalPage/personalPage.jsp";
		}
		return "redirect:/personalPage/personalPage.jsp";
	}//,produces="text/html;charset=UTF-8"
	@RequestMapping(path="/personalPage/showArticleFromMember.controller",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String showArticleFromMember(Model model,PostBean newPostBean,HttpSession session,String user) {
		System.out.println(user);
		List<PostBean> posts = postService.showAllArticleFromMember(user);
		for(PostBean beantemp:posts) {
			System.out.println(beantemp);
		}
		Gson gson = new Gson();
		String jsonList = gson.toJson(posts);
		System.out.println(jsonList);
		return jsonList;
	}
	
}
