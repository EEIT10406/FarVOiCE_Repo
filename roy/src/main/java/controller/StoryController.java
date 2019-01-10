package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
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
		
//				List<Object[]> historys = storySevice.tee(user);
				//物件陣列 
//				List<Object[]> historys=new ArrayList<Object[]>(); 
//				String json = JSON.toJSON(historys).toString(); 
//				System.out.println("[StoryController的json]"+json); 
		
				System.out.println("StoryController的開始");
				List<MusicBean> historys = storySevice.findAllHistorybyusername(user);
				// 用gson包成json送回前端
				Gson gson = new Gson();
				String jsonList = gson.toJson(historys);
				System.out.println("json的"+jsonList);
				return jsonList;
	} 
	
	@RequestMapping(path= {"/personalPage/showAllHistoryTimeFromHstory.controller"},produces= "text/plain;charset=UTF-8")
	@ResponseBody
	public String showAllHistoryTimeByUsername(Model model,HttpSession session,String user) {
		
				List<StoryBean> historysTime = storySevice.showStoryByusername(user);
				// 用gson包成json送回前端
				Gson gson = new Gson();
				String jsonList = gson.toJson(historysTime);
				System.out.println("historysTime的jsonList"+jsonList);
				return jsonList;
	} 
	
	
}
