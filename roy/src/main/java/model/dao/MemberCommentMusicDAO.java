package model.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import model.bean.MemberCommentMusicBean;
import model.bean.PostBean;
import model.hibernate.HibernateUtil;
@Repository
public class MemberCommentMusicDAO {
	//Spring MVC
	@Autowired
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public Session getSession() {
	return this.sessionFactory.getCurrentSession();
}
	
	
	public static void main(String... args) throws IOException, Exception, SQLException {
		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
//		MemberCommentMusicDAO memberCommentMusicDAO = new MemberCommentMusicDAO();
//		memberCommentMusicDAO.setSession(session);
//		//findByPk
//		MemberCommentMusicBean bean0 = memberCommentMusicDAO.findByPrimaryKey(1);
//		System.out.println(bean0);		
//		
//		//findAll
//		List<MemberCommentMusicBean> beans = memberCommentMusicDAO.findAll();
//		for(MemberCommentMusicBean bean1:beans) {
//			System.out.println(bean1);
//		}
		
//		//create
//		MemberCommentMusicBean bean2 = new MemberCommentMusicBean();
//		bean2.setMemberCommentMusic_id(4);
//		bean2.setMember_username("Jack");
//		bean2.setMemberCommentMusic_content("阿4乾你p4喔");
//		java.util.Date date = java.sql.Date.valueOf("2019-01-03");
//		bean2.setMemberCommentMusic_time(date);
//		File fileIn = new File("C:/Users/User/Desktop/FarVoice/Cutekirby.jpg");
//		int length = (int)fileIn.length();
//		byte[] fileInByteArray = new byte[length];
//		Blob blob = null;
//		FileInputStream fis = new FileInputStream(fileIn);
//		fis.read(fileInByteArray);
//		blob = new SerialBlob(fileInByteArray);
//		fis.close();
//		bean2.setMemberCommentMusic_image(blob);
//		bean2.setMusic_id(1);
//		MemberCommentMusicBean beanResult = memberCommentMusicDAO.create(bean2);
//		System.out.println(beanResult);
		
//		//update 不給修改
//		MemberCommentMusicBean bean3 = new MemberCommentMusicBean();
//		int updateInt = 3;
//		bean3.setFunding_id(updateInt);
//		bean3.setMember_username("Marry");
//		memberCommentMusicDAO.update(bean3);
//		MemberCommentMusicBean updateTempBean = memberCommentMusicDAO.findByPrimaryKey(updateInt);
//		System.out.println(updateTempBean);
		
//		//remove
//		boolean  remove = memberCommentMusicDAO.remove(4);
//		System.out.println(remove);
		
		
		
		tx.commit();
		session.close();
		HibernateUtil.closeSessionFactory();
	}
	
//	private Session session;
//	public void setSession(Session session) {
//		this.session = session;
//	}
//
//	public Session getSession() {
//		return session;
//	}
	
	public MemberCommentMusicBean findByPrimaryKey(Integer memberCommentMusic_id) {
		//0103 OK
		return this.getSession().get(MemberCommentMusicBean.class, memberCommentMusic_id);
	}
	public List<MemberCommentMusicBean> findAll() {
		//0103 OK
		return this.getSession().createQuery("from MemberCommentMusicBean", MemberCommentMusicBean.class)
				.setMaxResults(50)
				.list();
	}
	public MemberCommentMusicBean create(MemberCommentMusicBean bean) {
		//0103 OK
		if(bean!=null) {this.getSession().save(bean);
		return bean;
		}
		return bean;
	}
	
	public void update(MemberCommentMusicBean bean) {
		
		getSession().clear();
		getSession().update(bean);
	}
	
	public boolean remove(Integer funding_id) {
		//0103 OK
		MemberCommentMusicBean result = this.getSession().get(MemberCommentMusicBean.class, funding_id);
		if(result!=null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}
	//給music_id 抓留言
	public List<MemberCommentMusicBean> showAllCommentFromMusic (Integer music_id){
		String hql = "from MemberCommentMusicBean WHERE music_id=:music_id ";
		Query<MemberCommentMusicBean> query = this.getSession().createQuery(hql);
		query.setParameter("music_id", music_id);
		List<MemberCommentMusicBean> memberCommentMusicBeanList = query.list();
		return memberCommentMusicBeanList;
	}
	
	//給music_id 抓最新的留言
		public List<MemberCommentMusicBean> showLatestCommentFromMusic (Integer music_id){
			String hql = "from MemberCommentMusicBean WHERE music_id=:music_id order by memberCommentMusic_time desc";
			Query<MemberCommentMusicBean> query = this.getSession().createQuery(hql);
			query.setParameter("music_id", music_id);
			List<MemberCommentMusicBean> memberCommentMusicBeanList = query.list();
			return memberCommentMusicBeanList;
		}
}
