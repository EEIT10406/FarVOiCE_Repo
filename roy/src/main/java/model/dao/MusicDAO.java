package model.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.MusicBean;
import model.hibernate.HibernateUtil;

@Repository
public class MusicDAO {
	//Spring MVC
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
//		MusicDAO musicDAO = new MusicDAO();
//		musicDAO.setSession(session);
		//findByPk
//		MusicBean bean0 = musicDAO.findByPrimaryKey(1);
//		System.out.println(bean0);		
		
		//findAll
//		List<MusicBean> beans = musicDAO.findAll();
//		for(MusicBean bean1:beans) {
//			System.out.println(bean1);
//		}
		
		//create
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
		//update
//		MusicBean bean3 = new MusicBean();
//		bean3.setMusic_id(6);
//		bean3.setMusic_name("666唱情歌");
//		musicDAO.update(bean3);
//		MusicBean updateTempBean = musicDAO.findByPrimaryKey(6);
//		System.out.println(updateTempBean);
		
		//remove
//		boolean  remove = musicDAO.remove(6);
//		System.out.println(remove);
		
		
		
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
	
	public MusicBean findByPrimaryKey(Integer music_id) {
		//0103 OK
		return this.getSession().get(MusicBean.class, music_id);
	}
	public List<MusicBean> findAll() {
		//0103 OK
		return this.getSession().createQuery("from MusicBean", MusicBean.class)
				.setMaxResults(50)
				.list();
	}
	public MusicBean create(MusicBean bean) {
		//0103 OK
				this.getSession().save(bean);
				return bean;
	
	}
	
	public void update(MusicBean bean) {
	//0103 OK
		getSession().update(bean);
	}
	
	public boolean remove(Integer music_id) {
	//0103 OK
		MusicBean result = this.getSession().get(MusicBean.class, music_id);
		if(result!=null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}
}
