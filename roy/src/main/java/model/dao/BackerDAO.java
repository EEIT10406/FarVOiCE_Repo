package model.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.bean.BackerBean;
import model.hibernate.HibernateUtil;

public class BackerDAO {
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
		BackerDAO backerDAO = new BackerDAO();
		backerDAO.setSession(session);
		//findByPk
//		BackerBean bean0 = backerDAO.findByPrimaryKey(1);
//		System.out.println(bean0);		
//		
		//findAll
		List<BackerBean> beans = backerDAO.findAll();
		for(BackerBean bean1:beans) {
			System.out.println(bean1);
		}
		
		//create
//		BackerBean bean2 = new BackerBean();
//		bean2.setBacker_id(3);
//		bean2.setMember_username("Peter");
//		java.util.Date date = java.sql.Date.valueOf("2019-04-12");
//		bean2.setBacker_time(date);
//		bean2.setBacker_address("林森北路喔喔喔");
//		bean2.setReward_id(1);
//		BackerBean beanResult = backerDAO.create(bean2);
//		System.out.println(beanResult);
		
		//update
		BackerBean bean3 = new BackerBean();
		int updateInt = 3;
		bean3.setBacker_id(updateInt);
		bean3.setBacker_address("讓我為你唱情鴿456");
		backerDAO.update(bean3);
		BackerBean updateTempBean = backerDAO.findByPrimaryKey(updateInt);
		System.out.println(updateTempBean);
		//remove
		boolean  remove = backerDAO.remove(3);
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
	
	public BackerBean findByPrimaryKey(Integer backer_id) {
		//0103 OK
		return this.getSession().get(BackerBean.class, backer_id);
	}
	public List<BackerBean> findAll() {
		//0103 OK
		return this.getSession().createQuery("from BackerBean", BackerBean.class)
				.setMaxResults(50)
				.list();
	}
	public BackerBean create(BackerBean bean) {
		//0103 OK
		if(bean!=null) {
			BackerBean result = this.getSession().get(BackerBean.class, bean.getBacker_id());
			if(result==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}
	
	public void update(BackerBean bean) {
		//0103OK
		getSession().clear();
		getSession().update(bean);
	}
	
	public boolean remove(Integer backer_id) {
		//0103 OK
		BackerBean result = this.getSession().get(BackerBean.class, backer_id);
		if(result!=null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}
}
