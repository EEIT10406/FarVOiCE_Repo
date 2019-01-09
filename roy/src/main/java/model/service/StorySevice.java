package model.service;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.StoryBean;
import model.dao.StoryDAO;
import model.hibernate.HibernateUtil;

@Service
@Transactional
public class StorySevice {
	@Autowired
	private StoryDAO storyDAO;
	public StorySevice(StoryDAO storyDAO) {
		super();
		this.storyDAO = storyDAO;
	}
	public static void main(String[] args) {
//		HibernateUtil.getSessionfactory().getCurrentSession().beginTransaction();
//		StorySevice storySevice = new StorySevice(new StoryDAO(HibernateUtil.getSessionfactory()));
		
		//test insertStory
//		Date now = new Date();
//		StoryBean bean2 = new StoryBean();
//		bean2.setMember_username("Jack");
//		bean2.setMusic_id(1);
//		bean2.setStory_time(now);
//		bean2.setStory_id(2);
//		StoryBean beanResult = storySevice.insertStory(bean2);
//		System.out.println("story的"+beanResult);
		
		//test showStory
//		StoryBean bean1 = new StoryBean();
//		bean1.setMember_username("Peter");	
//		List<StoryBean> aaa =storySevice.showStory(bean1);
//		for(StoryBean bean2:aaa) {
//			System.out.println(bean2);
//		}
		
		
//		HibernateUtil.getSessionfactory().getCurrentSession().getTransaction().commit();
//		HibernateUtil.closeSessionFactory();
	}

	public StoryBean insertStory(StoryBean bean) {
		StoryBean result = null;
		if(bean!=null) {
			result = storyDAO.create(bean);
		}
		return result;
	}
	
	public List<StoryBean> showStoryByusername(StoryBean bean) {
		List<StoryBean> result = null;
		if(bean!=null) {	
			result = storyDAO.findStoryByUsername(bean.getMember_username());
			System.out.println(result);
		}
		return result;
	}
	
}
