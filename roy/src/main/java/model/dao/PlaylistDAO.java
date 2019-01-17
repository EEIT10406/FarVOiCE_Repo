package model.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.PlaylistBean;
import model.hibernate.HibernateUtil;
@Repository
public class PlaylistDAO {
	// Spring MVC
	@Autowired
	private SessionFactory sessionFactory;
//	public void setSessionFactory(SessionFactory sessionFactory) {
//		this.sessionFactory = sessionFactory;
//	}
	public Session getSession() {
	return this.sessionFactory.getCurrentSession();
}

	public static void main(String... args) throws IOException, Exception, SQLException {
//		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
//		Session session = sessionFactory.openSession();
//		Transaction tx = session.beginTransaction();
//		PlaylistDAO playlistDAO = new PlaylistDAO();
//		playlistDAO.setSession(session);
		
		//findByUsername
//		List<PlaylistBean> beans=playlistDAO.findByUsername("Peter");
//		for (PlaylistBean bean1 : beans) {
//			System.out.println(bean1);
//		}
		//findByPk
//		PlaylistBean bean0 = playlistDAO.findByPrimaryKey(1);
//		System.out.println(bean0);		
//		
		//findAll
//		List<PlaylistBean> beans = playlistDAO.findAll();
//		for (PlaylistBean bean1 : beans) {
//			System.out.println(bean1);
//		}

		//create
//		PlaylistBean bean2 = new PlaylistBean();
//		bean2.setPlaylist_id(4);
//		bean2.setMember_username("Jack");
//		bean2.setPlaylist_name("Test");
//		java.util.Date date = java.sql.Date.valueOf("2019-01-03");
//		bean2.setPlaylist_registerTime(date);
//		
//		PlaylistBean beanResult = playlistDAO.create(bean2);
//		System.out.println(beanResult);

//		//update 
//		PlaylistBean bean3 = new PlaylistBean();
//		int updateInt = 3;
//		bean3.setPlaylist_name("Test5555");
//		bean3.setPlaylist_id(4);
//		playlistDAO.update(bean3);
//		PlaylistBean updateTempBean = playlistDAO.findByPrimaryKey(updateInt);
//		System.out.println(updateTempBean);

//		//remove
//		boolean remove = playlistDAO.remove(4);
//		System.out.println(remove);
//
//		tx.commit();
//		session.close();
//		HibernateUtil.closeSessionFactory();
	}

//	private Session session;
//
//	public void setSession(Session session) {
//		this.session = session;
//	}
//
//	public Session getSession() {
//		return session;
//	}

	public PlaylistBean findByPrimaryKey(Integer playlist_id) {
		// 0103 OK
		return this.getSession().get(PlaylistBean.class, playlist_id);
	}

	public List<PlaylistBean> findAll(String sort) {
		// 0103 OK
		return this.getSession().createQuery("from PlaylistBean order by "+sort, PlaylistBean.class).setMaxResults(50).list();
	}
	
	//找該使用者的所有歌單資訊
	public List<PlaylistBean> findByUsername(String member_username){
		return  this.getSession().createQuery("from PlaylistBean where member_username = '"+member_username+"'",PlaylistBean.class).list();
	}

	public PlaylistBean create(PlaylistBean bean) {
		// 0103 OK
		this.getSession().save(bean);
		return bean;
	}

	public void update(PlaylistBean bean) {
		// 0103 OK
		getSession().clear();
		getSession().update(bean);
	}

	public boolean remove(Integer playlist_id) {
		// 0103 OK
		PlaylistBean result = this.getSession().get(PlaylistBean.class, playlist_id);
		if (result != null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}
}
