package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import model.bean.MusicBean;
import model.bean.StoryBean;
import model.service.StorySevice;

@Controller
public class StoryController {
	@Autowired
	private StorySevice storySevice;
	//歷史紀錄只有音樂版
//	@RequestMapping(path= {"/personalPage/showAllHistoryTimeFromHstory.controller"},produces= "text/plain;charset=UTF-8")
//	@ResponseBody
//	public String showAllHistoryTimeByUsername(Model model,HttpSession session,String user) {
//		
//				List<StoryBean> historysTime = storySevice.showStoryByusername(user);
//				// 用gson包成json送回前端
//				Gson gson =  new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
//				String jsonList = gson.toJson(historysTime);
//				System.out.println("historysTime的jsonList"+jsonList);
//				return jsonList;
//	} 
	
	@RequestMapping(path= {"/personalPage/showAllHistoryTimeFromHstory.controller"},produces= "text/plain;charset=UTF-8")
	@ResponseBody
	public String showAllHistoryTimeByUsernameFromPeter(Model model,HttpSession session,String user) {
		//--------最後版
		List<Object[]> history = storySevice.StoryController(user);
		for(Object[] temp:history) {
			for(int i=0;i<temp.length;i++) {
				System.out.print(temp[i]+",");
			}
			System.out.println("");
		}
		Gson gsonPeter = new Gson();
		String jsonListPeter = gsonPeter.toJson(history);
		System.out.println("History Json ----");
		System.out.println(jsonListPeter);
		System.out.println("--------------");
		return jsonListPeter;

	} 
	

}
