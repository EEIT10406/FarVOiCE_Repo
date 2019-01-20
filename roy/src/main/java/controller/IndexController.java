package controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import model.bean.MemberBean;
import model.bean.MemberCommentMusicBean;
import model.bean.MusicBean;
import model.service.MemberCommentMusicService;
import model.service.MemberLikeMusicService;
import model.service.MusicService;

@Controller
public class IndexController {
	@Autowired
	MusicService musicService;
	@Autowired
	private MemberLikeMusicService memberLikeMusicService;
	@Autowired
	private MemberCommentMusicService memberCommentMusicService;

	@RequestMapping(path = "/homePage/indexFindAllTimePlayCountTop5Music.controller", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String findAllTimePlayCountTop5Music() {
		System.out.println("findAllTimePlayCountTop5Music");
		List<MusicBean> top5 = musicService.findAllTimePlayCountTop5Music();
		Iterator<MusicBean> top5Ite = top5.iterator();
		// 帳號轉暱稱
		while (top5Ite.hasNext()) {
			MusicBean temp = top5Ite.next();
			temp.setMember_username(musicService.usernameToNickname(temp.getMember_username()));
		}
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String json = gson.toJson(top5);
		System.out.println(json);
		return json;
	}

	// 首頁大家都喜歡
	@RequestMapping(value = "/homePage/indexLikeMusic", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String indexLikeMusic(HttpSession session) {
		List<MusicBean> topThree = musicService.likeIn7Day();
		MemberBean memberBean = (MemberBean) session.getAttribute("user");
		List<Integer> memberLikeMusics = null;
		if (memberBean != null) {
			// 找出該使用者喜歡哪些音樂,回傳音樂id
			memberLikeMusics = memberLikeMusicService.memberLikeMusics(memberBean.getMember_username());
		}
		boolean flag = true;
		if (topThree != null) {
			List<Map<String, String>> musics = new LinkedList<Map<String, String>>();
			for (MusicBean bean : topThree) {
				Map<String, String> jsonMap = new HashMap<>();
				MemberCommentMusicBean comment = memberCommentMusicService.showLatestCommentFromMusic(bean.getMusic_id());
				if (memberLikeMusics != null) {
					for (Integer likeMusics : memberLikeMusics) {
						if (bean.getMusic_id() == likeMusics) {
							jsonMap.put("memberLikeMusic", "/roy/img/indexClickHeart.png");
							flag = false;
							break;
						}
					}
				}
				if (flag) {
					jsonMap.put("memberLikeMusic", "/roy/img/indexHeart.png");
				}
				if(comment!=null) {
					jsonMap.put("member_profileImage", String.valueOf(comment.getMember_profileImage()));
					jsonMap.put("member_nickname", String.valueOf(comment.getMember_nickname()));
					jsonMap.put("memberCommentMusic_time", String.valueOf(comment.getMemberCommentMusic_time()));
					jsonMap.put("memberCommentMusic_content", String.valueOf(comment.getMemberCommentMusic_content()));
				}
				jsonMap.put("music_id", String.valueOf(bean.getMusic_id()));
				jsonMap.put("music_Image", bean.getMusic_Image());
				jsonMap.put("music_name", bean.getMusic_name());
				jsonMap.put("music_likeCount", String.valueOf(bean.getMusic_likeCount()));
				jsonMap.put("nickname", musicService.usernameToNickname(bean.getMember_username()));
				musics.add(jsonMap);
				flag = true;
			}
			return JSONValue.toJSONString(musics);
		}
		return null;
	}
}
