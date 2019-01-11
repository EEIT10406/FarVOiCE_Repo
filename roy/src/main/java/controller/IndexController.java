package controller;

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
		List<MusicBean> top5 = musicService.findAllTimePlayCountTop5Music();
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String json = gson.toJson(top5);
		System.out.println(json);
		return json;
	}
}
