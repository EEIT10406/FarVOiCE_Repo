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

import model.Bean.MusicBean;
import model.hibernate.HibernateUtil;

public class MusicDAO {
	//Spring MVC
//	private SessionFactory sessionFactory;
//	public void setSessionFactory(SessionFactory sessionFactory) {
//		this.sessionFactory = sessionFactory;
//	}
//	public Session getSession() {
//	return this.sessionFactory.getCurrentSession();
//}
	
	
	public static void main(String... args) throws IOException, Exception, SQLException {
		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		MusicDAO musicDAO = new MusicDAO();
		musicDAO.setSession(session);
		//findByPk
//		MusicBean bean0 = musicDAO.findByPrimaryKey(1);
//		System.out.println(bean0);		
//		
		//findAll
		List<MusicBean> beans = musicDAO.findAll();
		for(MusicBean bean1:beans) {
			System.out.println(bean1);
		}
		
		//create
//		MusicBean bean2 = new MusicBean();
//		bean2.setMusic_id(6);
//		MusicBean beanResult = musicDAO.create(bean2);
//		System.out.println(beanResult);
		
		//update
//		MusicBean bean3 = new MusicBean();
//		bean3.setMember_username("roy");
//		bean3.setMember_password("456update");
//		bean3.setMember_nickname("資海喔咿咿");
//		musicDAO.update(bean3);
		
		//remove
//		boolean  remove = musicDAO.remove("Roy");
//		System.out.println(remove);
		
		
		
		tx.commit();
		session.close();
		HibernateUtil.closeSessionFactory();
	}
	
	private Session session;
	public void setSession(Session session) {
		this.session = session;
	}

	public Session getSession() {
		return session;
	}
	
	public MusicBean findByPrimaryKey(Integer music_id) {
		//0102 OK
		return this.getSession().get(MusicBean.class, music_id);
	}
	public List<MusicBean> findAll() {
		//0102 OK
		return this.getSession().createQuery("from MusicBean", MusicBean.class)
				.setMaxResults(50)
				.list();
	}
	public MusicBean create(MusicBean bean) {
	
		if(bean!=null) {
			MusicBean result = this.getSession().get(MusicBean.class, bean.getMusic_id());
			if(result==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}
	
	public void update(MusicBean bean) {
	
		getSession().update(bean);
	}
	
	public boolean remove(String member_username) {
	
		MusicBean result = this.getSession().get(MusicBean.class, member_username);
		if(result!=null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}
}
