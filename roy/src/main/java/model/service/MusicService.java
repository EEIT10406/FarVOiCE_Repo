package model.service;

import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.MusicBean;
import model.dao.MusicDAO;

@Service
@Transactional
public class MusicService {
	@Autowired
	private MusicDAO musicDao;
	@Autowired
	private ServletContext application;

	public MusicDAO getMusicDao() {
		return musicDao;
	}

	public void setMusicDao(MusicDAO musicDao) {
		this.musicDao = musicDao;
	}
	
	//把音樂從資料庫刪除
	public boolean deleteMusic(Integer musicId) {
		if (musicId != null) {
			return musicDao.remove(musicId);
		} else {
			return false;
		}
	}
	

	// 新增音樂內容到資料庫ok
	public MusicBean uploadMusic(MusicBean bean) {
		if (bean != null) {
			return musicDao.create(bean);
		} else {
			return null;
		}
	}
	
	// 用musicId抓出音樂內容
		public MusicBean findMusic(Integer music_id) {
			if(music_id!=null) {
				MusicBean musicBean=musicDao.findByPrimaryKey(music_id);
				if(musicBean!=null) {
					return musicBean;
				}
			}
			return null;
		}

	// 給上傳的音檔一個儲存路徑(上傳音檔限制 5000000 byte)
	public String musicFilePath(byte[] file) throws IOException {
		String musicFilePath = application.getRealPath("/login-signUp-upload/uploadMusic/") + System.currentTimeMillis()
				+ ".mp3";
		FileOutputStream out = new FileOutputStream(musicFilePath);
		out.write(file);
		out.close();
		return musicFilePath.substring(musicFilePath.indexOf("uploadMusic"));
	}

	// 給上傳的圖片檔一個儲存路徑
	public String imageFilePath(byte[] file) throws IOException {
		String imageFilePath = application.getRealPath("/login-signUp-upload/uploadImage/") + System.currentTimeMillis()
				+ ".jpg";
		FileOutputStream out = new FileOutputStream(imageFilePath);
		out.write(file);
		out.close();
		return imageFilePath.substring(imageFilePath.indexOf("uploadImage"));
	}

//	public static void main(String[] args) {
//		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
//		Session session = sessionFactory.openSession();
//		Transaction tx = session.beginTransaction();
//		MusicDAO musicDAO = new MusicDAO();
//		musicDAO.setSession(session);
//		
//		MusicService service=new MusicService();
//		
//		service.setMusicDao(musicDAO);
//		MusicBean bean=new MusicBean();
//		bean.setMusic_id(Integer.valueOf(5));
//		System.out.println(service.uploadMusic(bean.getMusic_id(), bean));
//		
//
//		tx.commit();
//		session.close();
//		HibernateUtil.closeSessionFactory();
//
//	}

}