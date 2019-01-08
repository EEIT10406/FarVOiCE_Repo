package model.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.FollowBean;
import model.bean.primarykey.FollowId;
import model.hibernate.HibernateUtil;
@Repository
public class FollowDAO {
	//Spring MVC
	@Autowired
	private SessionFactory sessionFactory;
	public FollowDAO(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}
	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}
	
	
	public static void main(String... args) throws IOException, Exception, SQLException {
		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
//		FollowDAO followDAO = new FollowDAO();
//		followDAO.setSession(session);
		//findByPk
//		FollowId followId = new FollowId();
//		followId.setMember_usernameS("Peter");
//		followId.setMember_usernameM("Jack");
//		FollowBean bean0 = followDAO.findByPrimaryKey(followId);
//		System.out.println(bean0);		
		
		//findAll
//		List<FollowBean> beans = followDAO.findAll();
//		for(FollowBean bean1:beans) {
//			System.out.println(bean1);
//		}
		
		//create
//		FollowBean bean2 = new FollowBean();
//		FollowId createFollowId = new FollowId();
//		createFollowId.setMember_usernameS("Marry");
//		createFollowId.setMember_usernameM("Peter");
//		java.util.Date date = java.sql.Date.valueOf("2019-04-12");
//		bean2.setId(createFollowId);
//		bean2.setFollow_time(date);
//		FollowBean beanResult = followDAO.create(bean2);
//		System.out.println(beanResult);
		
		//update
//		FollowBean bean3 = new FollowBean();
//		FollowId updateFollowId = new FollowId();
//		updateFollowId.setMember_usernameS("Marry");
//		updateFollowId.setMember_usernameM("Peter");
//		bean3.setId(updateFollowId);
//		java.util.Date date = java.sql.Date.valueOf("2019-04-25");
//		bean3.setFollow_time(date);
//		followDAO.update(bean3);
//		FollowBean updateTempBean = followDAO.findByPrimaryKey(updateFollowId);
//		System.out.println(updateTempBean);
		
		//remove
//		FollowId removeFollowId = new FollowId();
//		removeFollowId.setMember_usernameS("Marry");
//		removeFollowId.setMember_usernameM("Peter");
//		
//		boolean  remove = followDAO.remove(removeFollowId);
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
	
	public FollowBean findByPrimaryKey(FollowId followId) {
		//0103 OK
		return this.getSession().get(FollowBean.class, followId);
	}
	public List<FollowBean> findAll() {
		//0103 OK
		return this.getSession().createQuery("from FollowBean", FollowBean.class)
				.setMaxResults(50)
				.list();
	}
	public FollowBean create(FollowBean bean) {
		//0103 OK
		if(bean!=null) {
			FollowBean result = this.getSession().get(FollowBean.class, bean.getId());
			if(result==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}
	
	public void update(FollowBean bean) {
		//0103 OK
		getSession().clear();
		getSession().update(bean);
	}
	
	public boolean remove(FollowId followId) {
		//0103 OK
		FollowBean result = this.getSession().get(FollowBean.class, followId);
		if(result!=null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}
}
