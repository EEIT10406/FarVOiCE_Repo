package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.bean.MemberCommentMusicBean;
import model.service.MemberCommentMusicService;

@Controller
public class MemberCommentMusicController {
	@Autowired
	MemberCommentMusicService memberCommentMusicService;
	
	@RequestMapping(path="/musicPage/showAllCommentFromMusic.controller",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String showAllCommentFromMusic(Model model,HttpSession session,Integer music_id) {
		//show這個文章的留言
		List<MemberCommentMusicBean> comments = memberCommentMusicService.showAllCommentFromMusic(music_id);
		//用gson包成json送回前端
		Gson gson = new Gson();
		String jsonList = gson.toJson(comments);
		System.out.println(jsonList);
		return jsonList;
		
	}
}
