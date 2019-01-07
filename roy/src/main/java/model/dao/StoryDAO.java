package model.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.StoryBean;
import model.hibernate.HibernateUtil;

@Repository
public class StoryDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
	return this.sessionFactory.getCurrentSession();
}
	
	public static void main(String... args) throws IOException, Exception, SQLException {
//		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
//		Session session = sessionFactory.openSession();
//		Transaction tx = session.beginTransaction();
//		StoryDAO storyDAO = new StoryDAO();
//		storyDAO.setSession(session);
		
		//findByPk
//		StoryBean bean0 = storyDAO.findByPrimaryKey(1);
//		System.out.println(bean0);		
//		
//		//findAll
//		List<StoryBean> beans = storyDAO.findAll();
//		for(StoryBean bean1:beans) {
//			System.out.println(bean1);
//		}
		
//		//create
//		StoryBean bean2 = new StoryBean();
//		bean2.setStory_id(4);
//		bean2.setMember_username("Jack");
//		bean2.setMusic_id(1);
//		java.util.Date date = java.sql.Date.valueOf("2019-01-03");
//		StoryBean beanResult = storyDAO.create(bean2);
//		System.out.println(beanResult);
		
//		//update 
//		StoryBean bean3 = new StoryBean();
//		bean3.setStory_id(4);
//		bean3.setMember_username("Jack");
//		bean3.setMusic_id(1);
//		java.util.Date date = java.sql.Date.valueOf("2019-01-03");
//		bean3.setStory_time(date);
//		storyDAO.update(bean3);
//		StoryBean updateTempBean = storyDAO.findByPrimaryKey(4);
//		System.out.println(updateTempBean);
		
//		//remove
//		boolean  remove = storyDAO.remove(4);
//		System.out.println(remove);
//		
//		
//		
//		tx.commit();
//		session.close();
//		HibernateUtil.closeSessionFactory();
	}
	
	public StoryBean findByPrimaryKey(Integer story_id) {
		return this.getSession().get(StoryBean.class, story_id);
	}
	public List<StoryBean> findAll() {
		return this.getSession().createQuery("from StoryBean", StoryBean.class)
				.setMaxResults(50)
				.list();
	}
	public StoryBean create(StoryBean bean) {
//		if(bean!=null) {
//			StoryBean result = this.getSession().get(StoryBean.class, bean.getStory_id());
//			if(result==null) {
//				this.getSession().save(bean);
//				return bean;
//			}
//		}
//		return null;
		this.getSession().save(bean);
		return bean;
	}
	
	public void update(StoryBean bean) {
		getSession().clear();
		getSession().update(bean);
	}
	
	public boolean remove(Integer story_id) {
		StoryBean result = this.getSession().get(StoryBean.class, story_id);
		if(result!=null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}
}
