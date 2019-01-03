package model.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.bean.MessageBean;
import model.hibernate.HibernateUtil;

public class MessageDAO {
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
		MessageDAO messageDAO = new MessageDAO();
		messageDAO.setSession(session);
		
//		//findByPk
//		MessageBean bean0 = messageDAO.findByPrimaryKey(1);
//		System.out.println(bean0);		
//		
//		//findAll
//		List<MessageBean> beans = messageDAO.findAll();
//		for(MessageBean bean1:beans) {
//			System.out.println(bean1);
//		}
		
//		//create
		MessageBean bean2 = new MessageBean();
		bean2.setMessage_id(4);
		bean2.setMember_usernameSend("Jack");
		bean2.setMember_usernameReceive("Peter");
		bean2.setMessage_content("啊我偏要你拿我怎樣呢?");
		java.util.Date date = java.sql.Date.valueOf("2019-01-03");
		bean2.setMessage_time(date);
		MessageBean beanResult = messageDAO.create(bean2);
		System.out.println(beanResult);
		
//		//update 不給修改
//		MessageBean bean3 = new MessageBean();
//		int updateInt = 3;
//		bean3.setFunding_id(updateInt);
//		bean3.setMember_username("Marry");
//		messageDAO.update(bean3);
//		MessageBean updateTempBean = messageDAO.findByPrimaryKey(updateInt);
//		System.out.println(updateTempBean);
		
//		//remove
		boolean  remove = messageDAO.remove(4);
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
	
	public MessageBean findByPrimaryKey(Integer message_id) {
		//0103 OK
		return this.getSession().get(MessageBean.class, message_id);
	}
	public List<MessageBean> findAll() {
		//0103 OK
		return this.getSession().createQuery("from MessageBean", MessageBean.class)
				.setMaxResults(50)
				.list();
	}
	public MessageBean create(MessageBean bean) {
		//0103 OK
		if(bean!=null) {
			MessageBean result = this.getSession().get(MessageBean.class, bean.getMessage_id());
			if(result==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}
	
//	public void update(MessageBean bean) {
//		
//		getSession().clear();
//		getSession().update(bean);
//	}
	
	public boolean remove(Integer message_id) {
		//0103 OK
		MessageBean result = this.getSession().get(MessageBean.class, message_id);
		if(result!=null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}
}
