package controller;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.bean.ListMusicBean;
import model.bean.MusicBean;
import model.bean.primarykey.ListMusicId;
import model.service.ListMusicService;
import model.service.MusicService;

@Controller
public class ListMusicController {
	@Autowired
	private ListMusicService listMusicService;
	@Autowired
	private MusicService musicService;

	// 讀歌單內的音樂
	@RequestMapping(value = "/list/readPlayListMusic", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String readPlayListMusic(ListMusicId listMusicId, Integer playListId, MusicBean musicBean) {
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
						jsonMap.put("music_music", musicBean.getMusic_music());
						jsonMap.put("music_name", musicBean.getMusic_name());
						jsonMap.put("member_username", musicBean.getMember_username());
						jsonMap.put("music_uploadTime", String.valueOf(musicBean.getMusic_uploadTime()).substring(0, 10));
						musics.add(jsonMap);
					}
				}
				return JSONValue.toJSONString(musics);
			}
		}
		return "";
	}
	
	
	//刪歌單裡的音樂
			@RequestMapping(value="/list/deletePlayListMusic",produces= "text/plain;charset=UTF-8")
			@ResponseBody
			public String deletePlayListMusic(ListMusicId listMusicId,Integer music_id,Integer playlist_id,ListMusicBean bean) {
				listMusicId.setPlaylist_id(playlist_id);
				boolean deleteListMusic = listMusicService.deleteMusicFromList(listMusicId,music_id);
				if (deleteListMusic==true) {
					bean.setId(listMusicId);
					listMusicService.reduceMusicCount(bean);
					return "刪除成功";
				} else {
					return "刪除失敗";
				}
			}

}