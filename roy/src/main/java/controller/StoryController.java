package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.bean.MusicBean;
import model.bean.PostBean;
import model.bean.StoryBean;
import model.service.StorySevice;

@Controller
public class StoryController {
	@Autowired
	private StorySevice storySevice;
	@RequestMapping(path= {"/personalPage/showAllHistoryFromHstory.controller"},produces= "text/plain;charset=UTF-8")
	@ResponseBody
	public String showAllHistoryByUsername(Model model,HttpSession session,String user) {
		//show這個人的文章
				List<MusicBean> historys = storySevice.findStoryByUsernameMax5(user);
				System.out.println("historys"+historys);
				//用gson包成json送回前端
				Gson gson = new Gson();
				String jsonList = gson.toJson(historys);
//				System.out.println("json的"+jsonList);
				return jsonList;
	} 	
}
