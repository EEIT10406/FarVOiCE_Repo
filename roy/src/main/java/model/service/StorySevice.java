package model.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.MusicBean;
import model.bean.StoryBean;
import model.dao.MusicDAO;
import model.dao.StoryDAO;
import model.hibernate.HibernateUtil;

@Service
@Transactional
public class StorySevice {
	@Autowired
	private StoryDAO storyDAO;
	@Autowired
	private MusicDAO musicDAO;
	
	//用mvc之後需要註解以下東西
//	public StorySevice(StoryDAO storyDAO,MusicDAO musicDAO) {
//		super();
//		this.storyDAO = storyDAO;
//		this.musicDAO = musicDAO;
//	}
//	public StorySevice(MusicDAO musicDAO) {
//		super();
//		
//		this.musicDAO = musicDAO;
//	}
	public static void main(String[] args) {
//		HibernateUtil.getSessionfactory().getCurrentSession().beginTransaction();
//		StorySevice storySevice = new StorySevice(new StoryDAO(HibernateUtil.getSessionfactory()), new MusicDAO(HibernateUtil.getSessionfactory()));
//		
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
//		List<StoryBean> aaa =storySevice.testtttttttttttttttffff(bean1.getMember_username());
//		for(StoryBean bean2:aaa) {
//			System.out.println("service"+bean2);
//		}

		
		//test findAllHistorybyusername
//		storySevice.findAllHistorybyusername("Peter");
//		
		
		//test五筆版
//		List<MusicBean> aaa = storySevice.findStoryByUsernameMax5("Peter");
//		for(MusicBean bean2:aaa) {
//			System.out.println("service"+bean2);
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
	
	public List<StoryBean> showStoryByusername(String user) {
		List<StoryBean> result = null;
		if(user!=null) {	
			result = storyDAO.findStoryByUsername(user);
//			System.out.println("StorySevice"+result);
		}
		return result;
	}
	
	//給使用者name，回傳使用者的記錄的所有musicBean (全部紀錄正確版)
//	public List<MusicBean> findAllHistorybyusername(String user) {
//		List<StoryBean> result = storyDAO.findStoryByUsername(user);
//		List<MusicBean> MusicBeanresult = new ArrayList<>(); 
//		MusicBean mm = null;
//		if(user!=null) {	
//			for(StoryBean bean2:result) {
//				 mm =musicDAO.findByPrimaryKey(bean2.getMusic_id());			
//				 MusicBeanresult.add(mm);
//			}		
//		}
//		return MusicBeanresult;
//	}
//	
	//給使用者name，回傳使用者的記錄的所有musicBean (五筆版)
		public List<MusicBean> findStoryByUsernameMax5(String user) {
			List<StoryBean> result = storyDAO.findStoryByUsernameMax5(user);
			List<MusicBean> MusicBeanresult = new ArrayList<>(); 
			MusicBean mm = null;
			if(user!=null) {	
				for(StoryBean bean2:result) {
					 mm =musicDAO.findByPrimaryKey(bean2.getMusic_id());			
					 MusicBeanresult.add(mm);
				}		
			}
			return MusicBeanresult;
		}
	
	
	
}
