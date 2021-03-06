package model.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.bean.MusicBean;
import model.bean.PostBean;
import model.hibernate.HibernateUtil;

@Repository
public class MusicDAO {
	// Spring MVC
	@Autowired
	private SessionFactory sessionFactory;

//	public void setSessionFactory(SessionFactory sessionFactory) {
//		this.sessionFactory = sessionFactory;
//	}
//	public MusicDAO(SessionFactory sessionFactory) {
//		this.sessionFactory = sessionFactory;
//	}
	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}

	public static void main(String... args) throws IOException, Exception, SQLException {

//		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
//		Session session = sessionFactory.openSession();
//		Transaction tx = session.beginTransaction();
//		MusicDAO musicDAO = new MusicDAO();
//		musicDAO.setSession(session);

		// findByUser
//		List<MusicBean> beans=musicDAO.findAllByUser("Jack");
//		for(MusicBean bean1:beans) {
//			System.out.println(bean1);
//		}
//		
//		findByPk
//		MusicBean bean0 = musicDAO.findByPrimaryKey(6);
//		System.out.println(bean0);		

		// findAll
//		List<MusicBean> beans = musicDAO.findAll();
//		for(MusicBean bean1:beans) {
//			System.out.println(bean1);
//		}

		// create

//		MusicBean bean2 = new MusicBean();
//		File fileIn = new File("D:\\音樂\\4MINUTE-Crazy.mp3");
//		int length = (int)fileIn.length();
//		byte[] fileInByteArray = new byte[length];
//		Blob blob = null;
//		FileInputStream fis = new FileInputStream(fileIn);
//		fis.read(fileInByteArray);
//		blob = new SerialBlob(fileInByteArray);
//		fis.close();
//		bean2.setMusic_music(blob);
//		MusicBean beanResult = musicDAO.create(bean2);
//		System.out.println(beanResult);
//		

		// update
//		Date date = new Date();
//		MusicBean bean3 = new MusicBean();
//		bean3.setMusic_id(6);

//		bean3.setMusic_name("666唱情歌");
//		bean3.setMember_username("NewAnderson");
//		bean3.setMusic_music(null);
//		bean3.setMusic_caption("抱歉我妹亂上傳大家別誤會");
//		bean3.setMusic_uploadTime(date);
//		bean3.setMusic_playCount(25);
//		bean3.setMusic_styleName("jazz");
//		bean3.setMusic_lyric("我在全國睡著了");
//		bean3.setMusic_likeCount(100);
//		bean3.setMusic_Image(null);
//		bean3.setMusic_ban(null);
//		bean3.setMusic_unavailable(null);
//		
//		musicDAO.update(bean3);
//		MusicBean updateTempBean = musicDAO.findByPrimaryKey(6);
//		System.out.println("updateTempBean"+updateTempBean);
//		
		// remove
//		boolean  remove = musicDAO.remove(6);
//		System.out.println(remove);
//		System.out.println(musicDAO.findAllTimePlayCountTop5Music());
//		
//		
//		tx.commit();
//		session.close();
//		HibernateUtil.closeSessionFactory();
	}

//	private Session session;
//	public void setSession(Session session) {
//		this.session = session;
//	}
//
//	public Session getSession() {
//		return session;
//	}

	// 條件放searchString
	public List<MusicBean> search(String searchString) {
		return this.getSession().createQuery("from MusicBean where" + searchString, MusicBean.class).setMaxResults(50)
				.list();
	}

	// 找七天內點閱率高的音樂
	public List<MusicBean> findAllByTime() {
		// 0107 OK
		return this.getSession().createQuery(
				"from MusicBean WHERE DATEDIFF(day, DATEADD(day, -7, GETDATE()), music_uploadTime) > 0 and music_unavailable = 0 order by music_playCount desc",
				MusicBean.class).list();

	}

	// 找七天內最多讚的音樂
	public List<MusicBean> findAllByLike() {
		// 0107 OK
		return this.getSession().createQuery(
				"from MusicBean WHERE DATEDIFF(day, DATEADD(day, -7, GETDATE()), music_uploadTime) > 0 and music_unavailable = 0 order by music_likeCount desc",
				MusicBean.class).list();

	}

	// 找該使用者上傳的所有音樂且該音樂沒被下架
	public List<MusicBean> findAllByUser(String member_username) {
		// 0107 OK
		return this.getSession()
				.createQuery("from MusicBean where member_username='" + member_username + "'and music_unavailable = 0",
						MusicBean.class)
				.list();
	}

	public MusicBean findByPrimaryKey(Integer music_id) {
		// 0103 OK
		return this.getSession().get(MusicBean.class, music_id);
	}

	public List<MusicBean> findAll() {
		// 0103 OK
		return this.getSession().createQuery("from MusicBean", MusicBean.class).setMaxResults(50).list();
	}

	public MusicBean create(MusicBean bean) {
		// 0103 OK
		bean.setMusic_unavailable(false);
		bean.setMusic_likeCount(0);
		bean.setMusic_playCount(0);
		this.getSession().save(bean);
		return bean;
	}

	public void update(MusicBean bean) {
		// 0108 OK
		MusicBean originalBean = findByPrimaryKey(bean.getMusic_id());
		originalBean.setMusic_ban(bean.getMusic_ban());
		originalBean.setMusic_unavailable(bean.getMusic_unavailable());
		originalBean.setMusic_likeCount(bean.getMusic_likeCount());
		originalBean.setMusic_playCount(bean.getMusic_playCount());
		this.getSession().update(originalBean);
	}

	public void editMusic(MusicBean bean) {
		this.getSession().update(bean);
	}

	public boolean remove(Integer music_id) {
		// 0108 OK
		MusicBean originalBean = findByPrimaryKey(music_id);
		originalBean.setMusic_unavailable(true);
		return true;
	}

	// 找出所有時間總點閱率最高的五筆音樂
	public List<MusicBean> findAllTimePlayCountTop5Music() {
		// 0111 OK
		String hql = "from MusicBean Order By music_playCount Desc";
		Query<MusicBean> query = this.getSession().createQuery(hql);
		query.setMaxResults(5);
		List<MusicBean> musicList = query.list();
		return musicList;
	}

	// 找出所有時間總點閱率最高的十筆音樂
	public List<MusicBean> findAllTimePlayCountTop10Music() {
		String hql = "from MusicBean where music_unavailable=false Order By music_playCount Desc";
		Query<MusicBean> query = this.getSession().createQuery(hql);
		query.setMaxResults(10);
		List<MusicBean> musicList = query.list();
		return musicList;
	}

}
