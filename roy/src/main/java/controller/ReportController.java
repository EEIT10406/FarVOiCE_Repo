package controller;

import java.util.Date;
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
import model.bean.MusicBean;
import model.bean.PlaylistBean;
import model.bean.ReportBean;
import model.bean.StoryBean;
import model.bean.primarykey.ListMusicId;
import model.service.ListMusicService;
import model.service.MemberLikeMusicService;
import model.service.MemberService;
import model.service.MusicService;
import model.service.PlayListService;
import model.service.ReportService;
import model.service.StoryService;

@Controller
public class ReportController {

	@Autowired
	ReportService reportService;
	@Autowired
	MusicService musicService;
	@Autowired
	MemberLikeMusicService memberLikeMusicService;
	@Autowired
	ListMusicService listMusicService;
	@Autowired
	PlayListService playListService;
	@Autowired
	MemberService memberService;
	@Autowired
	StoryService storyService;

	//查檢舉
	@RequestMapping(value = "**/report.get")
	public String get(Model model, Integer report_id) {
		model.addAttribute("reportBean", reportService.findByPrimaryKey(report_id));
		return "testSpring2";
	}
	//
		@RequestMapping(value = "**/report.update")
		public String update(Model model, ReportBean reportBean) {
			System.out.println(reportBean.getReport_time());
			model.addAttribute("reportBean", reportService.update(reportBean));
			return "testSpring2";
		}

	//檢舉
	@RequestMapping(value = "**/report.create",produces="text/html;charset=utf-8")
	@ResponseBody
	public String put(Model model,HttpSession session,String music_id,String member_username) {
		MemberBean memberBean = (MemberBean)session.getAttribute("user");
		if(reportService.findByMember_username(memberBean.getMember_username(),music_id).isEmpty()) {
			ReportBean reportBean = new ReportBean();
			reportBean.setMember_usernameReportS(memberBean.getMember_username());
			reportBean.setMember_usernameReportM(member_username);
			reportBean.setMusic_idReportM(Integer.parseInt(music_id));
			reportBean.setReport_time(new java.sql.Date(new Date().getTime()));
			if(reportService.create(reportBean)!=null) {
				return "檢舉成功";
			}else {
				return "沒檢舉";
			}
		}
		return "已檢舉";
	}

	@RequestMapping(value = "**/report.searchMusic", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String searchMusic(Model model,HttpSession session,String type,String searchString,String before,String sort) {
		List<Integer> likeList = null;
		try {
			String member_username = ((MemberBean)session.getAttribute("user")).getMember_username();
			likeList = memberLikeMusicService.memberLikeMusics(member_username);
		} catch (Exception e) {
			e.printStackTrace();
		}
		LinkedList<HashMap<String,String>> l1 = new LinkedList<HashMap<String,String>>();
		for (MusicBean bean:musicService.search(type,searchString,before,sort)) {
			 HashMap<String,String>  m1 = new HashMap<String,String>();
			 if(likeList!=null&&likeList.contains(bean.getMusic_id())) {
					 m1.put("memberLikeMusic", "/roy/img/love.png");
			 } else {
				 m1.put("memberLikeMusic", "/roy/img/emptyLove.png");
			 }
			 m1.put("Music_name",bean.getMusic_name());
			 m1.put("Music_id",""+bean.getMusic_id());
			 m1.put("Member_username",""+bean.getMember_username());
			 m1.put("Music_music",""+bean.getMusic_music());
			 m1.put("Music_Image",bean.getMusic_Image());
			 m1.put("Music_id",""+bean.getMusic_id());
			 m1.put("Music_likeCount",""+bean.getMusic_likeCount());
			 m1.put("Member_nickname",""+
					 memberService.getMemberBeanForSomebodyPersonalPage(bean.getMember_username()).getMember_nickname());
			 l1.add(m1);
		 }
		return JSONValue.toJSONString(l1);
	}
	
	@RequestMapping(value = "**/report.searchPlaylistMusic", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String searchPlaylistMusic(Model model,String playlist_id) {
		ListMusicId listMusicId = new ListMusicId();
		listMusicId.setPlaylist_id(Integer.valueOf(playlist_id));
		List<Integer> musicIds=listMusicService.findByPlayListId(listMusicId);
		LinkedList<HashMap<String,String>> l1 = new LinkedList<HashMap<String,String>>();
		for(Integer music_id : musicIds)
		{
			MusicBean bean = musicService.findMusic(music_id);
			HashMap<String,String>  m1 = new HashMap<String,String>();       
			 m1.put("Music_name",bean.getMusic_name());
			 m1.put("Member_username",bean.getMember_username());
			 m1.put("Music_music",bean.getMusic_music());
			 m1.put("Music_Image",bean.getMusic_Image());
			 l1.add(m1);
		}
		return JSONValue.toJSONString(l1);
	}
	
	@RequestMapping(value="**/report.readPlayList",produces= "text/plain;charset=UTF-8")
	@ResponseBody
	public String readPlayList(String sort) {
			List<PlaylistBean> beans = playListService.loadAllPlayList(sort);
			if (beans != null) {
				List<Map<String,String>> playLists = new LinkedList<Map<String,String>>();
				for(PlaylistBean bean:beans) {
					Map<String, String> jsonMap = new HashMap<>();
					jsonMap.put("playlist_id", String.valueOf(bean.getPlaylist_id()));
					jsonMap.put("playlist_image", bean.getPlaylist_image());
					jsonMap.put("playlist_name", bean.getPlaylist_name());
					jsonMap.put("playlist_privacy", String.valueOf(bean.getPlaylist_privacy()));
					jsonMap.put("playlist_musicCount", String.valueOf(bean.getPlaylist_musicCount()));
					if(bean.getPlaylist_privacy()==true) {
						jsonMap.put("showPlaylist_privacy", "(不公開)");
					}else {
						jsonMap.put("showPlaylist_privacy", "");
					}
					playLists.add(jsonMap);
				}
				return JSONValue.toJSONString(playLists);
			}
		return "";
	}
	
	@RequestMapping(value = "**/report.addMusic_playCount")
	public void addMusic_playCount(Model model,String music_id,String member_username,StoryBean storyBean) {
		MusicBean musicBean = musicService.findMusic(Integer.parseInt(music_id));
		musicBean.setMusic_playCount(musicBean.getMusic_playCount()+1);
		musicService.updateMusic(musicBean);
		System.out.println(member_username);
		if(member_username!=null&&!"".equals(member_username.trim())) {
			storyBean.setMusic_id(Integer.parseInt(music_id));
			storyBean.setMember_username(member_username);
			storyBean.setStory_time(new java.sql.Date(new Date().getTime()));
			storyService.create(storyBean);
		}
	}
	
	@RequestMapping(value = "**/report.searchLists", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String searchLists(Model model,String sort) {
		System.out.println(sort);
		return JSONValue.toJSONString(musicService.search("","","",""));
	}
	
}
