package model.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.PlaylistBean;
import model.dao.PlaylistDAO;
@Service
@Transactional
public class PlayListService {
	@Autowired
	private PlaylistDAO playlistDao;
	@Autowired
	private ServletContext application;
	
	//新增歌單到資料庫ok
	public PlaylistBean createPlayList(PlaylistBean bean){
		if (bean != null) {
			return playlistDao.create(bean);
		} else {
			return null;
		}
	}
	
	//刪除歌單到資料庫ok
		public boolean deletePlayList(Integer playListId){
			if (playListId != null) {
				return playlistDao.remove(playListId);
			} else {
				return false;
			}
		}

	// 給上傳的圖片檔一個儲存路徑
	public String imageFilePath(byte[] file) throws IOException {
		String imageFilePath = application.getRealPath("/list/uploadImage/") + System.currentTimeMillis()
				+ ".jpg";
		FileOutputStream out = new FileOutputStream(imageFilePath);
		out.write(file);
		out.close();
		return imageFilePath.substring(imageFilePath.indexOf("uploadImage"));
	}
	
	//載入該使用者所有歌單
	public List<PlaylistBean> loadPlayList(String member_username) {
		if(member_username!=null && member_username.trim()!="") {
			List<PlaylistBean> beans = playlistDao.findByUsername(member_username);
			if(beans!=null) {
				return beans;
			}
		}
		return null;
	}
}
