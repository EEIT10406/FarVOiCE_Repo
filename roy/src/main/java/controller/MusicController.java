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

import com.google.gson.Gson;

import model.bean.MemberBean;
import model.bean.MusicBean;
import model.service.MemberLikeMusicService;
import model.service.MusicService;

@Controller
public class MusicController {
	@Autowired
	private MusicService musicService;
	@Autowired
	private MemberLikeMusicService memberLikeMusicService;

	// 上傳音樂
	@RequestMapping("/login-signUp-upload/uploadMusic")
	public String upLoadMUsic(MusicBean bean, Model model, @RequestParam("musicFile") MultipartFile musicFile,
			@RequestParam("imageFile") MultipartFile imageFile, HttpSession session) {
		String musicPath = "";
		String imagePath = "";
		
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);

		if (bean.getMusic_name().trim().equals("")) {
			errors.put("emptyValue", "請輸入歌曲名稱");
		}

		if (errors != null && !errors.isEmpty()) {
			return "/login-signUp-upload/upload.jsp";
		}

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
			// 使用者上傳的所有沒被下架的歌
			List<MusicBean> musicBean = musicService.findMusicByUser(username);

			// 找出該使用者喜歡哪些音樂,回傳音樂id
			List<Integer> memberLikeMusics = memberLikeMusicService.memberLikeMusics(username);
			boolean flag = true;
			if (musicBean != null) {
				List<Map<String, String>> musics = new LinkedList<Map<String, String>>();
				for (MusicBean bean : musicBean) {
					Map<String, String> jsonMap = new HashMap<>();
					if (memberLikeMusics != null) {
						for (Integer likeMusics : memberLikeMusics) {
							if (bean.getMusic_id() == likeMusics) {
								jsonMap.put("memberLikeMusic", "/roy/img/love.png");
								flag = false;
								break;
							}
						}
					}
					if (flag) {
						jsonMap.put("memberLikeMusic", "/roy/img/emptyLove.png");
					}
					jsonMap.put("music_id", String.valueOf(bean.getMusic_id()));
					jsonMap.put("music_name", bean.getMusic_name());
					jsonMap.put("music_Image", bean.getMusic_Image());
					jsonMap.put("music_likeCount", String.valueOf(bean.getMusic_likeCount()));
					musics.add(jsonMap);
					flag = true;
				}
				return JSONValue.toJSONString(musics);
			}
		}
		return "";
	}

	// 讀取somebody的音樂
	@RequestMapping(value = "/personalPage/readSomebodyMusic", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String readSomebodyMusic(String username, HttpSession session) {
		if (username != null && username.trim() != "") {
			// somebody上傳的所有沒被下架的歌
			List<MusicBean> musicBean = musicService.findMusicByUser(username);

			MemberBean memberBean = (MemberBean) session.getAttribute("user");
			List<Integer> memberLikeMusics = null;
			if (memberBean != null) {
				// 找出該使用者喜歡哪些音樂,回傳音樂id
				memberLikeMusics = memberLikeMusicService.memberLikeMusics(memberBean.getMember_username());
			}

			boolean flag = true;
			if (musicBean != null) {
				List<Map<String, String>> musics = new LinkedList<Map<String, String>>();
				for (MusicBean bean : musicBean) {
					Map<String, String> jsonMap = new HashMap<>();
					if (memberLikeMusics != null) {
						for (Integer likeMusics : memberLikeMusics) {
							if (bean.getMusic_id() == likeMusics) {
								jsonMap.put("memberLikeMusic", "/roy/img/love.png");
								flag = false;
								break;
							}
						}
					}
					if (flag) {
						jsonMap.put("memberLikeMusic", "/roy/img/emptyLove.png");
					}
					jsonMap.put("music_id", String.valueOf(bean.getMusic_id()));
					jsonMap.put("music_name", bean.getMusic_name());
					jsonMap.put("music_Image", bean.getMusic_Image());
					jsonMap.put("music_likeCount", String.valueOf(bean.getMusic_likeCount()));
					musics.add(jsonMap);
					flag = true;
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
	public String deleteMusic(Integer music_id) {
		boolean result = musicService.deleteMusic(music_id);
		if (result) {
			return "刪除成功";
		} else {
			return "刪除失敗";
		}
	}

	// 找音樂用音樂id
	@RequestMapping(value = "/musicPage/findMusicById")
	public String findMusicByMusicId(String musicId, Model model) {
		MusicBean musicBean = musicService.findAvailableMusic(Integer.valueOf(musicId));
		if (musicBean != null) {
			model.addAttribute("musicPageBean", musicBean);
			model.addAttribute("nickname", musicService.usernameToNickname(musicBean.getMember_username()));
			return "/musicPage/musicPage.jsp";
		} else {
			return "";
		}
	}

	// 依類型搜尋音樂
	@RequestMapping(value = "/rankTop10/findMusicByType", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String findMusicByType(String type, HttpSession session, Model model) {
		List<MusicBean> topTen = null;
		if (type.equals("")) {
			topTen = musicService.rankTopTenByAllType();
		} else if(type.equals("time")) {
			System.out.println("sdsdsdsd");
			topTen = musicService.rankIn7Day();
			System.out.println(topTen);
		}else {
			topTen = musicService.rankTopTenByType(type);
		}
		
		MemberBean memberBean = (MemberBean) session.getAttribute("user");
		List<Integer> memberLikeMusics = null;
		if (memberBean != null) {
			// 找出該使用者喜歡哪些音樂,回傳音樂id
			memberLikeMusics = memberLikeMusicService.memberLikeMusics(memberBean.getMember_username());
		}
		boolean flag = true;
		if (topTen != null) {
			List<Map<String, String>> musics = new LinkedList<Map<String, String>>();
			for (MusicBean bean : topTen) {
				Map<String, String> jsonMap = new HashMap<>();
				if (memberLikeMusics != null) {
					for (Integer likeMusics : memberLikeMusics) {
						if (bean.getMusic_id() == likeMusics) {
							jsonMap.put("memberLikeMusic", "/roy/img/love.png");
							flag = false;
							break;
						}
					}
				}
				if (flag) {
					jsonMap.put("memberLikeMusic", "/roy/img/emptyLove.png");
				}
				jsonMap.put("music_id", String.valueOf(bean.getMusic_id()));
				jsonMap.put("music_Image", bean.getMusic_Image());
				jsonMap.put("music_name", bean.getMusic_name());
				jsonMap.put("music_likeCount", String.valueOf(bean.getMusic_likeCount()));
				jsonMap.put("nickname", musicService.usernameToNickname(bean.getMember_username()));
				jsonMap.put("music_uploadTime", String.valueOf(bean.getMusic_uploadTime()).substring(0, 10));
				musics.add(jsonMap);
				flag = true;
			}
			return JSONValue.toJSONString(musics);
		}
		return null;
	}

}
