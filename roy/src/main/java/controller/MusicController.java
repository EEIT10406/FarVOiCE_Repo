package controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import model.bean.MemberBean;
import model.bean.MusicBean;
import model.service.MusicService;

@Controller
public class MusicController {
	@Autowired
	private MusicService musicService;

	// 上傳音樂
	@RequestMapping("/login-signUp-upload/uploadMusic")
	public String upLoadMUsic(MusicBean bean, Model model, @RequestParam("musicFile") MultipartFile musicFile,
			@RequestParam("imageFile") MultipartFile imageFile, HttpSession session) {
		String musicPath = "";
		String imagePath = "";
		if (!musicFile.isEmpty()) {
			try {
				byte[] musicByte = musicFile.getBytes();
				musicPath = musicService.musicFilePath(musicByte);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (!imageFile.isEmpty()) {
			try {
				byte[] imageByte = imageFile.getBytes();
				imagePath = musicService.imageFilePath(imageByte);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		MemberBean memberBean = (MemberBean) session.getAttribute("user");
		bean.setMember_username(memberBean.getMember_username());
		bean.setMusic_music(musicPath);
		bean.setMusic_Image(imagePath);
		bean.setMusic_uploadTime(new java.util.Date());

		MusicBean uploadMusicBean = musicService.uploadMusic(bean);
		if (uploadMusicBean != null) {
			model.addAttribute("musicBean", uploadMusicBean);
			model.addAttribute("uploadresult", "發佈成功");
			return "/login-signUp-upload/upload.jsp";
		} else {
			model.addAttribute("uploadresult", "發佈失敗");
			return "/login-signUp-upload/upload.jsp";
		}

	}

	// 讀取使用者的音樂
	@RequestMapping(value = "/personalPage/readMusic", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String readMusic(String username) {
		if (username != null && username.trim() != "") {
			List<MusicBean> musicBean = musicService.findMusicByUser(username);
			if (musicBean != null) {
				List<Map<String, String>> musics = new LinkedList<Map<String, String>>();
				for (MusicBean bean : musicBean) {
					Map<String, String> jsonMap = new HashMap<>();
					jsonMap.put("music_id", String.valueOf(bean.getMusic_id()));
					jsonMap.put("music_name", bean.getMusic_name());
					jsonMap.put("music_Image", bean.getMusic_Image());
					jsonMap.put("music_likeCount", String.valueOf(bean.getMusic_likeCount()));
					musics.add(jsonMap);
				}
				return JSONValue.toJSONString(musics);
			}
		}
		return "";
	}
	
	
	// 讀取使用者上傳的音樂個數(不包括下架音樂)
		@RequestMapping(value = "/personalPage/uploadMusicCount", produces = "text/plain;charset=UTF-8")
		@ResponseBody
		public String uploadMusicCount(String username) {
			if (username != null && username.trim() != "") {
				List<MusicBean> musicBean = musicService.findMusicByUser(username);
				if (musicBean != null) {
					return String.valueOf(musicBean.size());
				}
			}
			return "";
		}
		

	// 刪音樂
	@RequestMapping(value = "/list/deleteMusic", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String deleteMUsic(Integer music_id) {
		boolean result = musicService.deleteMusic(music_id);
		if (result) {
			return "刪除成功";
		} else {
			return "刪除失敗";
		}
	}

}
