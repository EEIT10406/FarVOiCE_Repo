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
import model.bean.MemberCommentMusicBean;
import model.bean.PostBean;
import model.service.MemberCommentMusicService;

@Controller
public class MemberCommentMusicController {
	@Autowired
	MemberCommentMusicService memberCommentMusicService;
	
	@RequestMapping(path="/musicPage/showAllCommentFromMusic.controller",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String showAllCommentFromMusic(Model model,HttpSession session,Integer music_id) {
		//show這個音樂的留言
		List<MemberCommentMusicBean> comments = memberCommentMusicService.showAllCommentFromMusic(music_id);
		//用gson包成json送回前端
		Gson gson = new Gson();
		String jsonList = gson.toJson(comments);
		System.out.println(jsonList);
		return jsonList;
		
	}
	@RequestMapping(path="/musicPage/postNewMusicComment.controller")
	public String postNewMusicComment(Integer musicid,Model model,HttpSession session,String MCM_content) {
		//新增音樂留言
		System.out.println("musicid---->"+musicid);
		MemberCommentMusicBean newCommentBean = new MemberCommentMusicBean();
		MemberBean userBean = (MemberBean)session.getAttribute("user");
		newCommentBean.setMember_username(userBean.getMember_username());
		newCommentBean.setMember_nickname(userBean.getMember_nickname());
		newCommentBean.setMember_profileImage(userBean.getMember_profileImage());
		newCommentBean.setMusic_id(musicid);
		newCommentBean.setMemberCommentMusic_content(MCM_content);
		newCommentBean.setMemberCommentMusic_time(new Date());
		memberCommentMusicService.postNewMusicComment(newCommentBean);
		return "/musicPage/musicPage.jsp";

	}
}
