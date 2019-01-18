package model.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.PostBean;
import model.dao.PostDAO;
import model.hibernate.HibernateUtil;

@Service
public class ShareMusicService{
	
	public static void main(String[] args) {
//		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
//		Session session = sessionFactory.openSession();
//		Transaction tx = session.beginTransaction();
//		PostDAO postDAO = new PostDAO();
//		postDAO.setSession(session);
//		
//		
//		ShareMusicService sms = new ShareMusicService();
//		PostBean bean= new PostBean();
//		bean.setPost_idS(53);
//		bean.setMember_username("Peter");
//		bean.setPost_content("讓我為你唱情歌");
//		java.util.Date date =java.sql.Date.valueOf("2019-01-03");
//		bean.setPost_time(date);
//		bean.setPost_privacy(true);
//		
//		sms.setPostDao(postDAO);
//		System.out.println(sms.insertShareMessage(bean));
//		
//		
//		tx.commit();
//		session.close();
//		HibernateUtil.closeSessionFactory();
//		
		
	}
	
	
	@Autowired
	private PostDAO postDao;
//	public PostDAO getPostDao() {
//		return postDao;
//	}
//	public void setPostDao(PostDAO postDao) {
//		this.postDao = postDao;
//	}
	
	
	//新增一筆post紀錄
	@Transactional
	public PostBean insertShareMessage(PostBean bean) {
		PostBean result = null;
		if(bean!=null) {
			result = postDao.create(bean);
		}
		return result;
	}
	

}

	

