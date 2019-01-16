package controller;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import model.bean.MusicBean;
import model.service.MusicService;

@Controller
public class IndexController {
	@Autowired
	MusicService musicService;
	@RequestMapping(path="/homePage/indexFindAllTimePlayCountTop5Music.controller",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String findAllTimePlayCountTop5Music() {
		System.out.println("findAllTimePlayCountTop5Music");
		List<MusicBean> top5 = musicService.findAllTimePlayCountTop5Music();
		Iterator<MusicBean> top5Ite = top5.iterator();
		//帳號轉暱稱
		while(top5Ite.hasNext()) {
			MusicBean temp = top5Ite.next();
			temp.setMember_username(musicService.usernameToNickname(temp.getMember_username()));
		}
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String json = gson.toJson(top5);
		System.out.println(json);
		return json;
	}
}
