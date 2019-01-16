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

import model.bean.ListMusicBean;
import model.bean.MemberBean;
import model.bean.MusicBean;
import model.bean.PlaylistBean;
import model.bean.primarykey.ListMusicId;
import model.service.ListMusicService;
import model.service.MusicService;
import model.service.PlayListService;

@Controller
public class ListMusicController {
	@Autowired
	private ListMusicService listMusicService;
	@Autowired
	private MusicService musicService;
	@Autowired
	private PlayListService playListService;

	// 讀歌單內的音樂
	@RequestMapping(value = "/list/readPlayListMusic", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String readPlayListMusic(ListMusicId listMusicId, Integer playListId, MusicBean musicBean,MemberBean memberBean) {
		if (playListId != null) {
			listMusicId.setPlaylist_id(playListId);
			List<Integer> musicIds = listMusicService.findByPlayListId(listMusicId);
			List<Map<String, String>> musics = new LinkedList<Map<String, String>>();
			
			if (musicIds != null) {
				for (Integer musicId : musicIds) {
					musicBean = musicService.findMusic(musicId);
					if (musicBean != null) {
						Map<String, String> jsonMap = new HashMap<>();
						jsonMap.put("music_id", String.valueOf(musicBean.getMusic_id()));
						jsonMap.put("music_Image", musicBean.getMusic_Image());
						if(musicBean.getMusic_unavailable()==true) {
							jsonMap.put("music_name", musicBean.getMusic_name()+"<br>(該歌曲已下架)");
						}else {
							jsonMap.put("music_name", musicBean.getMusic_name());
						}
						jsonMap.put("nickname", musicService.usernameToNickname(musicBean.getMember_username()));
						jsonMap.put("music_uploadTime",String.valueOf(musicBean.getMusic_uploadTime()).substring(0, 10));
						musics.add(jsonMap);
					}
				}
				return JSONValue.toJSONString(musics);
			}
		}
		return "";
	}

//刪歌單裡的音樂
	@RequestMapping(value = "/list/deletePlayListMusic", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String deletePlayListMusic(ListMusicId listMusicId, Integer music_id, Integer playlist_id,
			ListMusicBean bean) {
		listMusicId.setPlaylist_id(playlist_id);
		boolean deleteListMusic = listMusicService.deleteMusicFromList(listMusicId, music_id);
		if (deleteListMusic == true) {
			bean.setId(listMusicId);
			listMusicService.reduceMusicCount(bean);
			return "刪除成功";
		} else {
			return "刪除失敗";
		}
	}

	// 把音樂加入想要的歌單
	@RequestMapping(value = "/list/addMusicToPlayList", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String addMusicToPlayList(String musicId,String playListId,ListMusicId listMusicId,ListMusicBean bean) {
		listMusicId.setPlaylist_id(Integer.valueOf(playListId));
		listMusicId.setMusic_id(Integer.valueOf(musicId));
		bean.setId(listMusicId);
		ListMusicBean listMusicBean = listMusicService.addMusicToPlayList(bean);
		if (listMusicBean !=null) {
			listMusicService.addMusicCount(listMusicBean);
			return "新增成功";
		} else {
			return "該首歌已在歌單中";
		}
	}
	
	
	
	// 讀歌單內的音樂
		@RequestMapping(value = "/personalPage/locateToPlayList")
		public String locateToPlayList(HttpSession session,String playListId,ListMusicId listMusicId,Model model) {
			PlaylistBean playListBean=playListService.getPlayListBean(Integer.valueOf(playListId));
			listMusicId.setPlaylist_id(Integer.valueOf(playListId));
			
			List<Integer> musicIds=listMusicService.findByPlayListId(listMusicId);
			
			List<MusicBean>musicBeans=new LinkedList<>();
			
			for(Integer musicId:musicIds) {
				MusicBean musicBean=musicService.findMusic(musicId);
				String nickname=musicService.usernameToNickname(musicBean.getMember_username()); 
				//把memberName設為nickname的名字
				musicBean.setMember_username(nickname);
				
				if(musicBean.getMusic_unavailable()==true) {
					String unavailableMusicName= musicBean.getMusic_name()+" (該歌曲已下架)";
					musicBean.setMusic_name(unavailableMusicName);
				}
				musicBeans.add(musicBean);
			}
				
			model.addAttribute("playListBean", playListBean);
			model.addAttribute("musicBeans", musicBeans);
			
			return "/list/ListPage.jsp";
		}

}
