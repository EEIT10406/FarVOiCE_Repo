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

import model.bean.MemberLikeMusicBean;
import model.bean.primarykey.MemberLikeMusicId;
import model.hibernate.HibernateUtil;

public class MemberLikeMusicDAO {
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
		MemberLikeMusicDAO memberLikeMusicDAO = new MemberLikeMusicDAO();
		memberLikeMusicDAO.setSession(session);
//		//findByPk
//		MemberLikeMusicId memberLikeMusicId = new MemberLikeMusicId();
//		memberLikeMusicId.setMember_username("Peter");
//		memberLikeMusicId.setMusic_id(1);
//		MemberLikeMusicBean bean0 = memberLikeMusicDAO.findByPrimaryKey(memberLikeMusicId);
//		System.out.println(bean0);		
//		
//		//findAll
//		List<MemberLikeMusicBean> beans = memberLikeMusicDAO.findAll();
//		for(MemberLikeMusicBean bean1:beans) {
//			System.out.println(bean1);
//		}
		
//		//create
//		MemberLikeMusicBean bean2 = new MemberLikeMusicBean();
//		MemberLikeMusicId createMemberLikeMusicId = new MemberLikeMusicId();
//		createMemberLikeMusicId.setMember_username("Peter");
//		createMemberLikeMusicId.setMusic_id(2);
//		java.util.Date date = java.sql.Date.valueOf("2019-01-03");
//		bean2.setMemberLikeMusic_time(date);
//		bean2.setId(createMemberLikeMusicId);
//		MemberLikeMusicBean beanResult = memberLikeMusicDAO.create(bean2);
//		System.out.println(beanResult);
		
//		//update 不給修改
//		MemberLikeMusicBean bean3 = new MemberLikeMusicBean();
//		int updateInt = 3;
//		bean3.setFunding_id(updateInt);
//		bean3.setMember_username("Marry");
//		memberLikeMusicDAO.update(bean3);
//		MemberLikeMusicBean updateTempBean = memberLikeMusicDAO.findByPrimaryKey(updateInt);
//		System.out.println(updateTempBean);
		
//		//remove
		MemberLikeMusicId removeMemberLikeMusicId = new MemberLikeMusicId();
		removeMemberLikeMusicId.setMember_username("Peter");
		removeMemberLikeMusicId.setMusic_id(2);
		boolean  remove = memberLikeMusicDAO.remove(removeMemberLikeMusicId);
		System.out.println(remove);
		
		
		
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
	
	public MemberLikeMusicBean findByPrimaryKey(MemberLikeMusicId memberLikeMusicId) {
		//0103 OK
		return this.getSession().get(MemberLikeMusicBean.class, memberLikeMusicId);
	}
	public List<MemberLikeMusicBean> findAll() {
		//0103 OK
		return this.getSession().createQuery("from MemberLikeMusicBean", MemberLikeMusicBean.class)
				.setMaxResults(50)
				.list();
	}
	public MemberLikeMusicBean create(MemberLikeMusicBean bean) {
		//0103 OK
		if(bean!=null) {
			MemberLikeMusicBean result = this.getSession().get(MemberLikeMusicBean.class, bean.getId());
			if(result==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}
	
//	public void update(MemberLikeMusicBean bean) {
//		
//		getSession().clear();
//		getSession().update(bean);
//	}
	
	public boolean remove(MemberLikeMusicId memberLikeMusicId) {
		//0103 OK
		MemberLikeMusicBean result = this.getSession().get(MemberLikeMusicBean.class, memberLikeMusicId);
		if(result!=null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}
}
