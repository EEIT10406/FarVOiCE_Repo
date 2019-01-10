package model.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.net.URL;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

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
	
	public MusicDAO getMusicDao() {
		return musicDao;
	}

	public void setMusicDao(MusicDAO musicDao) {
		this.musicDao = musicDao;
	}
	
	//查by類型,時間,名稱
	public LinkedList<HashMap<String, String>> search(String type,String searchString,String before) {
		searchString = " music_name like '%"+searchString+"%'";
		if(type!=null&&(!"".equals(type.trim()))) {
			searchString=searchString+"and music_styleName in ("+type+")";
		}
		if(before!=null&&(!"".equals(before.trim()))) {
			searchString=searchString+"and music_uploadTime > DATEADD(DAY, -"+before+", GETDATE ( ))";
		}
		LinkedList<HashMap<String,String>> l1 = new LinkedList<HashMap<String,String>>();
		 for (MusicBean bean:musicDao.search(searchString)) {
			 HashMap<String,String>  m1 = new HashMap<String,String>();       
			 m1.put("Music_name",bean.getMusic_name());
			 m1.put("Music_id",""+bean.getMusic_id());
			 m1.put("Member_username",""+bean.getMember_username());
			 m1.put("Music_music",""+bean.getMusic_music());
			 m1.put("Music_Image",bean.getMusic_Image());
			 l1.add(m1);
		 }
		return l1;
	}
	
	//更新音樂
	public void updateMusic(MusicBean bean) {
		if(bean!=null) {
		 musicDao.update(bean);
		}
	}
	
	// 找該使用者上傳的所有音樂
	public List<MusicBean> findMusicByUser(String member_username) {
		if(member_username!=null) {
			return musicDao.findAllByUser(member_username);
		}
		return null; 
	}
	
	//把音樂從資料庫刪除
	public boolean deleteMusic(Integer musicId) {
		if (musicId != null) {
			return musicDao.remove(musicId);
		} else {
			return false;
		}
	}
	

	// 上傳音樂
	public MusicBean uploadMusic(MusicBean bean) {
		if (bean != null) {
			return musicDao.create(bean);
		} else {
			return null;
		}
	}
	
	// 抓音樂
		public MusicBean findMusic(Integer music_id) {
			if(music_id!=null) {
				MusicBean musicBean=musicDao.findByPrimaryKey(music_id);
				if(musicBean!=null) {
					return musicBean;
				}
			}
			return null;
		}

	// 給上傳的音檔一個儲存路徑
	public String musicFilePath(byte[] file) throws IOException {
		String musicFilePath = "C:/Roy_FarVoice/music/" + System.currentTimeMillis()+".mp3";
		FileOutputStream out = new FileOutputStream(musicFilePath);
		out.write(file);
		out.close();
		return "/roy/music"+musicFilePath.substring(21);
	}

	// 給上傳的圖片檔一個儲存路徑
	public String imageFilePath(byte[] file) throws IOException {
		String imageFilePath = "C:/Roy_FarVoice/image/music/" + System.currentTimeMillis()+".jpg";
		FileOutputStream out = new FileOutputStream(imageFilePath);
		out.write(file);
		out.close();
		return "/roy/image/music"+imageFilePath.substring(27);
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
