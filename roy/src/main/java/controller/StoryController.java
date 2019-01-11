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
	@RequestMapping(path= {"/personalPage/showAllHistoryFromHstory.controller"},produces= "text/plain;charset=UTF-8")
	@ResponseBody
	public String showAllHistoryByUsername(Model model,HttpSession session,String user) {
		
//				List<Object[]> historys = storySevice.StoryController(user); 
//				String json = JSON.toJSON(historys).toString(); 
//				System.out.println("[StoryController的json] = "+json); 
		
				
				
				
				System.out.println("StoryController的開始");
				List<MusicBean> historysOld = storySevice.findAllHistorybyusername(user);
				// 用gson包成json送回前端
				Gson gson =  new Gson();
				String jsonList = gson.toJson(historysOld);
				System.out.println("json的"+jsonList);
				return jsonList;
	} 
	
	@RequestMapping(path= {"/personalPage/showAllHistoryTimeFromHstory.controller"},produces= "text/plain;charset=UTF-8")
	@ResponseBody
	public String showAllHistoryTimeByUsername(Model model,HttpSession session,String user) {
		
				List<StoryBean> historysTime = storySevice.showStoryByusername(user);
				// 用gson包成json送回前端
				Gson gson =  new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
				String jsonList = gson.toJson(historysTime);
				System.out.println("historysTime的jsonList"+jsonList);
				return jsonList;
	} 
	
	@RequestMapping(path= {"/personalPage/showAllHistoryTimeFromHstory123.controller"},produces= "text/plain;charset=UTF-8")
	@ResponseBody
	public String showAllHistoryTimeByUsernameFromPeter(Model model,HttpSession session,String user) {
		//-------------------------Peter
		List<Object[]> historyPeter = storySevice.StoryController(user);
		for(Object[] temp:historyPeter) {
			for(int i=0;i<temp.length;i++) {
				System.out.print(temp[i]+",");
			}
			System.out.println("");
		}
		Gson gsonPeter = new Gson();
		String jsonListPeter = gsonPeter.toJson(historyPeter);
		System.out.println("Peter Json ----");
		System.out.println(jsonListPeter);
		System.out.println("--------------");
		return jsonListPeter;
		//-----------------------------old
//		List<StoryBean> historysTime = storySevice.showStoryByusername(user);
//		// 用gson包成json送回前端
//		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
//		String jsonList = gson.toJson(historysTime);
//		System.out.println("historysTime的jsonList" + jsonList);
//		return jsonList;
	} 
	
	
}
