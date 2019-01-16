package model.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.MemberBean;
import model.bean.PostBean;
import model.hibernate.HibernateUtil;
@Repository
public class PostDAO {
	//Spring MVC
	@Autowired
	private SessionFactory sessionFactory;
	public PostDAO(SessionFactory sessionfactory) {
		this.sessionFactory = sessionfactory;
	}
	public Session getSession() {
	return this.sessionFactory.getCurrentSession();
	}
	
	public static void main(String... args) throws IOException, Exception, SQLException {
//		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
//		Session session = sessionFactory.openSession();
//		Transaction tx = session.beginTransaction();
//		PostDAO postDAO = new PostDAO();
//		postDAO.setSession(session);
//		
//		//findByPk
//		PostBean bean0 = postDAO.findByPrimaryKey(1);
//		System.out.println(bean0);		
//		
//		//findAll
//		List<PostBean> beans = postDAO.findAll();
//		for(PostBean bean1:beans) {
//			System.out.println(bean1);
//		}
//		findArticleFromMember
//		List<PostBean> posts = postDAO.findArticleFromMember("Peter");
//		for(PostBean beantemp:posts) {
//			System.out.println(beantemp);
//		}
//		//create
//		PostBean bean2 = new PostBean();
//		bean2.setPost_idS(5);
//		bean2.setMember_username("Jack");
//		bean2.setPost_content("幹哪媽我最終二");
//		java.util.Date date = java.sql.Date.valueOf("2019-01-03");
//		bean2.setPost_time(date);
//		bean2.setPost_privacy(true);
//		PostBean beanResult = postDAO.create(bean2);
//		System.out.println(beanResult);
		
//		//update 
//		PostBean bean3 = new PostBean();
//		bean3.setPost_idS(4);
//		bean3.setMember_username("Jack");
//		bean3.setPost_content("幹哪媽我最終二4444444444");
//		java.util.Date date = java.sql.Date.valueOf("2019-01-03");
//		bean3.setPost_time(date);
//		bean3.setPost_privacy(true);
//		postDAO.update(bean3);
//		PostBean updateTempBean = postDAO.findByPrimaryKey(4);
//		System.out.println(updateTempBean);
		
//		//remove
//		boolean  remove = postDAO.remove(5);
//		System.out.println(remove);
		
		
		
//		tx.commit();
//		session.close();
//		HibernateUtil.closeSessionFactory();
	}
	
	//if you need to test
	
//	private Session session;
//	public void setSession(Session session) {
//		this.session = session;
//	}
//
//	public Session getSession() {
//		return session;
//	}
	//------------------
	public PostBean findByPrimaryKey(Integer post_idS) {
		//0103 OK
		return this.getSession().get(PostBean.class, post_idS);
	}
	public List<PostBean> findAll() {
		//0103 OK
		return this.getSession().createQuery("from PostBean", PostBean.class)
				.setMaxResults(50)
				.list();
	}
	
//	public List<PostBean> findAllReturn10(Integer page) {
//		//0103 OK
//		return this.getSession().createQuery("from PostBean", PostBean.class)
//				.setMaxResults(50)
//				.list();
//	}
	
	public List<PostBean> findArticleFromMember (String member_username){
		//0106 OK
		String hql = "from PostBean WHERE member_username=:member_username and post_idM=null Order By post_time Desc";
		Query<PostBean> query = this.getSession().createQuery(hql);
		query.setParameter("member_username", member_username);
		List<PostBean> PostList = query.list();
		return PostList;
	}
	public List<PostBean> findCommentFromArticle (Integer post_idS){
		String hql = "from PostBean WHERE post_idM=:post_idM ";
		Query<PostBean> query = this.getSession().createQuery(hql);
		query.setParameter("post_idM", post_idS);
		List<PostBean> PostList = query.list();
		return PostList;
	}
	public PostBean create(PostBean bean) {
		//0103 OK
		if(bean!=null) {this.getSession().save(bean);
		return bean;
		}
		return bean;
	}
	
	public void update(PostBean bean) {
		//0103 OK
		getSession().clear();
		getSession().update(bean);
	}
	
	public boolean remove(Integer post_idS) {
		//0103 OK
		PostBean result = this.getSession().get(PostBean.class, post_idS);
		if(result!=null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}
	
//顯示所有文章在文章頁面	
public List<PostBean> showAllArticleInFindArticle (Boolean post_postorshare){
		String hql = "from PostBean WHERE post_postorshare=:post_postorshare Order By post_time Desc";
		Query<PostBean> query = this.getSession().createQuery(hql);
		query.setParameter("post_postorshare", post_postorshare);
		List<PostBean> PostList = query.list();
		return PostList;
	}

//顯示單一文章在文章頁面
public List<PostBean> showSearchArticleInFindArticle (String searchString){
	String hql = "from PostBean WHERE post_content like :post_content Order By post_time Desc";
	Query<PostBean> query = this.getSession().createQuery(hql);
	query.setParameter("post_content", "%"+searchString+"%");
	List<PostBean> PostList = query.list();
	return PostList;
}
}
