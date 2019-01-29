package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.BackerBean;
import model.bean.MemberBean;

@Repository
public class BackerDAO {
	// Spring MVC
//	private SessionFactory sessionFactory;
//	public void setSessionFactory(SessionFactory sessionFactory) {
//		this.sessionFactory = sessionFactory;
//	}
//	public Session getSession() {
//	return this.sessionFactory.getCurrentSession();
//}
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}

//	public static void main(String... args) throws IOException, Exception, SQLException {
//		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
//		Session session = sessionFactory.openSession();
//		Transaction tx = session.beginTransaction();
//		BackerDAO backerDAO = new BackerDAO();
//		backerDAO.setSession(session);
//		//findByPk
////		BackerBean bean0 = backerDAO.findByPrimaryKey(1);
////		System.out.println(bean0);		
////		
//		//findAll
//		List<BackerBean> beans = backerDAO.findAll();
//		for(BackerBean bean1:beans) {
//			System.out.println(bean1);
//		}
//		
//		//create
////		BackerBean bean2 = new BackerBean();
////		bean2.setBacker_id(3);
////		bean2.setMember_username("Peter");
////		java.util.Date date = java.sql.Date.valueOf("2019-04-12");
////		bean2.setBacker_time(date);
////		bean2.setBacker_address("林森北路喔喔喔");
////		bean2.setReward_id(1);
////		BackerBean beanResult = backerDAO.create(bean2);
////		System.out.println(beanResult);
//		
//		//update
//		BackerBean bean3 = new BackerBean();
//		int updateInt = 3;
//		bean3.setBacker_id(updateInt);
//		bean3.setBacker_address("讓我為你唱情鴿456");
//		backerDAO.update(bean3);
//		BackerBean updateTempBean = backerDAO.findByPrimaryKey(updateInt);
//		System.out.println(updateTempBean);
//		//remove
//		boolean  remove = backerDAO.remove(3);
//		System.out.println(remove);
//		
//		
//		
//		tx.commit();
//		session.close();
//		HibernateUtil.closeSessionFactory();
//	}

//	private Session session;
//	public void setSession(Session session) {
//		this.session = session;
//	}
//
//	public Session getSession() {
//		return session;
//	}
//根據使用者抓出所有贊助
	public List<BackerBean> userdonateHistory(String member_username) {
		return this.getSession()
				.createQuery("from BackerBean where member_username='" + member_username + "'", BackerBean.class)
				.list();
	}

//找出贊助過的人
	public List<MemberBean> donateHistory(Integer funding_id) {

		return this.getSession().createQuery(
				"from MemberBean where member_username in (select distinct member_username from BackerBean where funding_id ='"
						+ funding_id + "')",
				MemberBean.class).list();
	}

//根據username找出贊助紀錄
	public List<BackerBean> listBackerBeanByUsername(String member_username) {
		return this.getSession()
				.createQuery(
						"from BackerBean where member_username='" + member_username + "'" + "order by backer_time desc",
						BackerBean.class)
				.list();
	}

//以funding_id找出所有贊助者
	public List<BackerBean> listBackerBeanByFunding_id(Integer funding_id) {
		return this.getSession().createQuery("from BackerBean where funding_id='" + funding_id + "'", BackerBean.class)
				.list();
	}

//以reward_id找出該回饋所有贊助者
	public List<BackerBean> listBackerBeanByReward_id(Integer reward_id) {
		return this.getSession().createQuery("from BackerBean where reward_id='" + reward_id + "'", BackerBean.class)
				.list();
	}

	public BackerBean findByPrimaryKey(Integer backer_id) {
		// 0103 OK
		return this.getSession().get(BackerBean.class, backer_id);
	}

	public List<BackerBean> findAll() {
		// 0103 OK
		return this.getSession().createQuery("from BackerBean", BackerBean.class).setMaxResults(50).list();
	}

//建一筆贊助
	public BackerBean create(BackerBean bean) {
		// 0103 OK
		this.getSession().save(bean);
		return bean;
	}

	public void update(BackerBean bean) {
		// 0103OK
		getSession().clear();
		getSession().update(bean);
	}

	public boolean remove(Integer backer_id) {
		// 0103 OK
		BackerBean result = this.getSession().get(BackerBean.class, backer_id);
		if (result != null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}
}
