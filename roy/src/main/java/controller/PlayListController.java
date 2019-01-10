package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import model.bean.PlaylistBean;
import model.service.PlayListService;

@Controller
public class PlayListController {
	@Autowired
	private PlayListService playListService;

	//建歌單
	@RequestMapping("/list/createPlayList")
	public String createPlayList(PlaylistBean bean, Model model, @RequestParam("imageFile") MultipartFile imageFile,
			String privacy,HttpSession session) {
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);

		if (bean.getPlaylist_name().equals("")) {
			errors.put("emptyValue", "請輸入歌單名稱");
		}

		if (errors != null && !errors.isEmpty()) {
			return "/list/createList.jsp";
		}

		String imagePath = "";
		if (!imageFile.isEmpty()) {
			try {
				byte[] imageByte = imageFile.getBytes();
				imagePath = playListService.imageFilePath(imageByte);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		MemberBean memberBean=(MemberBean)session.getAttribute("user");
        bean.setMember_username(memberBean.getMember_username());
		bean.setPlaylist_image(imagePath);
		bean.setPlaylist_registerTime(new java.util.Date());
		bean.setPlaylist_musicCount(0);

		PlaylistBean createPlayList = playListService.createPlayList(bean);
		if (createPlayList != null) {
			model.addAttribute("result", "新增成功");
			model.addAttribute("playListBean", bean);
			return "/list/createList.jsp";
		} else {
			model.addAttribute("result", "新增失敗");
			return "/list/createList.jsp";
		}
	}

	//讀歌單
	@RequestMapping(value="/list/readPlayList",produces= "text/plain;charset=UTF-8")
	@ResponseBody
	public String readPlayList(String username) {
		if (username != null && username.trim() != "") {
			List<PlaylistBean> beans = playListService.loadPlayList(username);
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
		}
		return "";
	}
		
	//刪歌單
		@RequestMapping(value="/list/deletePlayList",produces= "text/plain;charset=UTF-8")
		@ResponseBody
		public String createPlayList(PlaylistBean bean) {
			boolean deleteList = playListService.deletePlayList(bean.getPlaylist_id());
			if (deleteList) {
				return "刪除成功";
			} else {
				return "刪除失敗";
			}
		}
	
}
