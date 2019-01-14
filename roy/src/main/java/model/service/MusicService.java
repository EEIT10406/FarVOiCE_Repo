package model.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.net.URL;
import java.util.LinkedList;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.MemberBean;
import model.bean.MusicBean;
import model.dao.MemberDAO;
import model.dao.MusicDAO;

@Service
@Transactional
public class MusicService {
	@Autowired
	private MusicDAO musicDao;
	@Autowired
	private MemberDAO memberDAO;

	public MusicDAO getMusicDao() {
		return musicDao;
	}

	public void setMusicDao(MusicDAO musicDao) {
		this.musicDao = musicDao;
	}

	// 查by類型,時間,名稱,SORT by 時間 | 喜歡 | 播放
	public LinkedList<HashMap<String, String>> search(String type, String searchString, String before, String sort) {
		searchString = " music_name like '%" + searchString + "%'";
		if (type != null && (!"".equals(type.trim()))) {
			searchString = searchString + "and music_styleName in (" + type + ")";
		}
		if (before != null && (!"".equals(before.trim()))) {
			searchString = searchString + "and music_uploadTime > DATEADD(DAY, -" + before + ", GETDATE ( ))";
		}
		if (sort != null && (!"".equals(sort.trim()))) {
			searchString = searchString + "ORDER BY " + sort + " desc";
		}
		LinkedList<HashMap<String, String>> l1 = new LinkedList<HashMap<String, String>>();
		for (MusicBean bean : musicDao.search(searchString)) {
			HashMap<String, String> m1 = new HashMap<String, String>();
			m1.put("Music_name", bean.getMusic_name());
			m1.put("Music_id", "" + bean.getMusic_id());
			m1.put("Member_username", "" + bean.getMember_username());
			m1.put("Music_music", "" + bean.getMusic_music());
			m1.put("Music_Image", bean.getMusic_Image());
			m1.put("Music_id", "" + bean.getMusic_id());
			l1.add(m1);
		}
		return l1;
	}

	// 找出所有時間總點閱率最高的五筆音樂
	public List<MusicBean> findAllTimePlayCountTop5Music() {
		return musicDao.findAllTimePlayCountTop5Music();
	}

	// 更新音樂
	public void updateMusic(MusicBean bean) {
		if (bean != null) {
			musicDao.update(bean);
		}
	}

	// 找類型搜尋top10音樂
	public List<MusicBean> rankTopTenByType(String type) {
		if (type != null) {
			List<MusicBean> musics = musicDao.search(" music_stylename='" + type + "' order by music_playcount desc");
			List<MusicBean> topTen = new LinkedList<>();
			int number = 0;
			for (MusicBean ten : musics) {
				if (ten.getMusic_unavailable() == false) {
					topTen.add(ten);
					number++;
				}
				if (number == 10) {
					break;
				}
			}
			return topTen;
		}
		return null;
	}
	
	// 找所有類型音樂top10
		public List<MusicBean> rankTopTenByAllType() {
			return musicDao.findAllTimePlayCountTop10Music();
		}
		
	// 找出十首七天內點閱率最高的音樂
	public List<MusicBean> rankIn7Day() {
		List<MusicBean> musics=musicDao.findAllByTime();
		List<MusicBean> topTen=new LinkedList<>();
		int number=0;
		for(MusicBean music:musics) {
			topTen.add(music);
			number++;
			if(number==10) {
				break;
			}
		}
		return topTen;
	}	
		

	// 找該使用者上傳的所有音樂
	public List<MusicBean> findMusicByUser(String member_username) {
		if (member_username != null) {
			return musicDao.findAllByUser(member_username);
		}
		return null;
	}

	// 把音樂從資料庫刪除
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
		if (music_id != null) {
			MusicBean musicBean = musicDao.findByPrimaryKey(music_id);
			if (musicBean != null) {
				return musicBean;
			}
		}
		return null;
	}

	// 抓沒被下架的音樂
	public MusicBean findAvailableMusic(Integer music_id) {
		if (music_id != null) {
			MusicBean musicBean = musicDao.findByPrimaryKey(music_id);
			if (musicBean.getMusic_unavailable() == false) {
				return musicBean;
			}
		}
		return null;
	}

	// 給上傳的音檔一個儲存路徑
	public String musicFilePath(byte[] file) throws IOException {
		String musicFilePath = "C:/Roy_FarVoice/music/" + System.currentTimeMillis() + ".mp3";
		FileOutputStream out = new FileOutputStream(musicFilePath);
		out.write(file);
		out.close();
		return "/roy/music" + musicFilePath.substring(21);
	}

	// 給上傳的圖片檔一個儲存路徑
	public String imageFilePath(byte[] file) throws IOException {
		String imageFilePath = "C:/Roy_FarVoice/image/music/" + System.currentTimeMillis() + ".jpg";
		FileOutputStream out = new FileOutputStream(imageFilePath);
		out.write(file);
		out.close();
		return "/roy/image/music" + imageFilePath.substring(27);
	}

	// 給username得nickname
	public String usernameToNickname(String username) {
		MemberBean bean = memberDAO.findByPrimaryKey(username);
		return bean.getMember_nickname();
	}

	// 給nickname得username
	public String nicenameToUsername(String username) {
		return memberDAO.nicenameToUsername(username);

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
