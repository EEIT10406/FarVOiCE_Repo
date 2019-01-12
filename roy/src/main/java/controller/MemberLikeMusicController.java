package controller;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.bean.MemberBean;
import model.bean.MemberLikeMusicBean;
import model.bean.MusicBean;
import model.bean.primarykey.MemberLikeMusicId;
import model.service.MemberLikeMusicService;
import model.service.MusicService;

@Controller
public class MemberLikeMusicController {

	@Autowired
	private MemberLikeMusicService memberLikeMusicService;
	@Autowired
	private MusicService musicService;

	// 使用者對音樂按讚
	@RequestMapping(value = "/personalPage/memberClickLike", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String memberClickLike(String username, String musicId, MemberLikeMusicId memberLikeMusicId,
			MemberLikeMusicBean bean, Model model) {
		memberLikeMusicId.setMember_username(username);
		memberLikeMusicId.setMusic_id(Integer.valueOf(musicId));
		bean.setId(memberLikeMusicId);
		bean.setMemberLikeMusic_time(new java.util.Date());
		MemberLikeMusicBean memberLikeMusicBean = memberLikeMusicService.memberClickLike(bean);
		if (memberLikeMusicBean != null) {
			MusicBean musicBean = musicService.findMusic(Integer.valueOf(musicId));
			int musicLikeCount = musicBean.getMusic_likeCount() + 1;
			if (musicLikeCount >= 0) {
				musicBean.setMusic_likeCount(musicLikeCount);
				musicService.updateMusic(musicBean);
				return String.valueOf(musicLikeCount);
			}
		}
		return "";

	}

	// 使用者對音樂收回讚
	@RequestMapping(value = "/personalPage/memberTakeBackLike", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String memberTakeBackLike(String username, String musicId, MemberLikeMusicId memberLikeMusicId) {
		memberLikeMusicId.setMember_username(username);
		memberLikeMusicId.setMusic_id(Integer.valueOf(musicId));

		boolean result = memberLikeMusicService.memberTakeBackLike(memberLikeMusicId);
		if (result == true) {
			MusicBean musicBean = musicService.findMusic(Integer.valueOf(musicId));
			int musicLikeCount = musicBean.getMusic_likeCount() - 1;
			if (musicLikeCount >= 0) {
				musicBean.setMusic_likeCount(musicLikeCount);
				musicService.updateMusic(musicBean);
				return String.valueOf(musicLikeCount);
			}
		}
		return "";

	}

	// 看使用者對哪些音樂按讚
	@RequestMapping(value = "/personalPage/memberLikeMusic", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String memberLikeMusic(String username) {
		List<Integer> musics = memberLikeMusicService.memberLikeMusics(username);
		List<Map<String, String>> likeMusics = new LinkedList<Map<String, String>>();
		for (Integer likeMusicId : musics) {
			MusicBean musicBean = musicService.findMusic(likeMusicId);
			Map<String, String> jsonMap = new HashMap<>();
			jsonMap.put("music_id", String.valueOf(musicBean.getMusic_id()));
			jsonMap.put("music_Image", musicBean.getMusic_Image());
			jsonMap.put("music_name", musicBean.getMusic_name());
			jsonMap.put("music_likeCount", String.valueOf(musicBean.getMusic_likeCount()));
			likeMusics.add(jsonMap);
		}
		return JSONValue.toJSONString(likeMusics);
	}

	
//看somebody對哪些音樂按讚
	@RequestMapping(value = "/personalPage/somebodyLikeMusic", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String somebodyLikeMusic(String username, HttpSession session) {
		// somebody喜歡的歌
		List<Integer> somebodyMusics = memberLikeMusicService.memberLikeMusics(username);

		MemberBean memberBean = (MemberBean) session.getAttribute("user");
		// 使用者喜歡的歌
		List<Integer> memberLikeMusics = memberLikeMusicService.memberLikeMusics(memberBean.getMember_username());
		if (somebodyMusics != null) {
			List<Map<String, String>> likeMusics = new LinkedList<Map<String, String>>();
			
			boolean flag=true;
			for (Integer somebodyLikes : somebodyMusics) {
				MusicBean musicBean = musicService.findMusic(somebodyLikes);
				Map<String, String> jsonMap = new HashMap<>();
				for (Integer userLikes : memberLikeMusics) {
					if (somebodyLikes == userLikes) {
						jsonMap.put("userLikeMusic", "/roy/img/love.png");
						flag=false;
						break;
					}
				}
				if(flag) {
					jsonMap.put("userLikeMusic", "/roy/img/emptyLove.png");
				}
				jsonMap.put("music_id", String.valueOf(musicBean.getMusic_id()));
				jsonMap.put("music_Image", musicBean.getMusic_Image());
				jsonMap.put("music_name", musicBean.getMusic_name());
				jsonMap.put("music_likeCount", String.valueOf(musicBean.getMusic_likeCount()));
				likeMusics.add(jsonMap);
				flag=true;
				
			}
			return JSONValue.toJSONString(likeMusics);
		}
		return "";
	}

}
