package model.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.bean.RewardBean;
import model.hibernate.HibernateUtil;

public class RewardDAO {
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
		RewardDAO rewardDAO = new RewardDAO();
		rewardDAO.setSession(session);
		
		//findByPk
//		RewardBean bean0 = rewardDAO.findByPrimaryKey(1);
//		System.out.println(bean0);		
		
		//findAll
//		List<RewardBean> beans = rewardDAO.findAll();
//		for(RewardBean bean1:beans) {
//			System.out.println(bean1);
//		}
		
//		//create
//		RewardBean bean2 = new RewardBean();
//		bean2.setReward_id(4);
//		bean2.setFunding_id(2);
//		bean2.setReward_amount(800);
//		java.util.Date date = java.sql.Date.valueOf("2019-01-03");
//		bean2.setReward_estimatedDelivery(date);
//		bean2.setReward_description("保力達一瓶");
//	
//		RewardBean beanResult = rewardDAO.create(bean2);
//		System.out.println(beanResult);
		
//		//update 
		RewardBean bean3 = new RewardBean();
		bean3.setReward_id(4);
		bean3.setFunding_id(2);
		bean3.setReward_amount(8800);
		java.util.Date date = java.sql.Date.valueOf("2019-01-03");
		bean3.setReward_estimatedDelivery(date);
		bean3.setReward_description("保力達一瓶");
		rewardDAO.update(bean3);
		RewardBean updateTempBean = rewardDAO.findByPrimaryKey(4);
		System.out.println(updateTempBean);
		
//		//remove
//		boolean  remove = rewardDAO.remove(4);
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
	
	public RewardBean findByPrimaryKey(Integer reward_id) {
		//0103 OK
		return this.getSession().get(RewardBean.class, reward_id);
	}
	public List<RewardBean> findAll() {
		//0103 OK
		return this.getSession().createQuery("from RewardBean", RewardBean.class)
				.setMaxResults(50)
				.list();
	}
	public RewardBean create(RewardBean bean) {
		//0103 OK
		if(bean!=null) {
			RewardBean result = this.getSession().get(RewardBean.class, bean.getReward_id());
			if(result==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}
	
	public void update(RewardBean bean) {
		//0103 OK
		getSession().clear();
		getSession().update(bean);
	}
	
	public boolean remove(Integer reward_id) {
		//0103 OK
		RewardBean result = this.getSession().get(RewardBean.class, reward_id);
		if(result!=null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}
}
