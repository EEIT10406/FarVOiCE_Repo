package model.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.MemberBean;
import model.bean.PostBean;
import model.dao.PostDAO;
import model.hibernate.HibernateUtil;

@Service
@Transactional
public class PostService {
	@Autowired
	private PostDAO postDAO;
	public PostService(PostDAO postDAO) {
		super();
		this.postDAO = postDAO;
	}

//	public static void main(String[] args) {
//		try {
//			HibernateUtil.getSessionfactory().getCurrentSession().beginTransaction();
//
//			PostService postService = new PostService(new PostDAO(HibernateUtil.getSessionfactory()));
//			
//			PostBean temp = new PostBean();
//			temp.setMember_username("Peter");
//			temp.setPost_content("哈囉囉囉囉囉");
//			PostBean newPostBean = postService.postNewArticle(temp);
//			System.out.println(newPostBean);
//			MemberBean member = new MemberBean();
//			member.setMember_username("Peter");
//			List<PostBean> posts = postService.showAllArticleFromMember(member);
	
//			for(PostBean beantemp:posts) {
//				System.out.println(beantemp);
//			}
			
//			List<PostBean> bean = postService.showAllArticleInFindArticle(true);
//			for(PostBean beantemp:bean) {
//				System.out.println(beantemp);
//			}
//			
//			
//			HibernateUtil.getSessionfactory().getCurrentSession().getTransaction().commit();
//		} finally {
//			HibernateUtil.closeSessionFactory();
//		}
//	}

//			int post_idS =5;
//			System.out.println(postService.removePost(post_idS));
//			HibernateUtil.getSessionfactory().getCurrentSession().getTransaction().commit();
//		} finally {
//			HibernateUtil.closeSessionFactory();
//		}
//	}


	public PostBean postNewArticle(PostBean bean) {
		//0104 OK
		PostBean newPostBean = postDAO.create(bean);
		return newPostBean;
	}
	public List<PostBean> showAllArticleFromMember(String member_username){
		//0106 OK
		return postDAO.findArticleFromMember(member_username);
	}
	public List<PostBean> showAllCommentFromArticle(Integer post_idS){
	
		return postDAO.findCommentFromArticle(post_idS);
	}
	public PostBean postNewComment(PostBean bean) {
		if(bean.getPost_idM()==null)return null;//代表是發文
		PostBean newPostBean = postDAO.create(bean);
		return newPostBean;
	}
	public PostBean findSinglePost(Integer post_idS) {
		PostBean bean = postDAO.findByPrimaryKey(post_idS);
		if(bean!=null) {
					return bean;
			}
		return null;
	}
	public boolean removePost(Integer post_idS) {
		//0109 OK
		boolean b = postDAO.remove(post_idS);
		return b;
	}
	public List<PostBean> showAllArticleInFindArticle(Boolean article){
		return postDAO.showAllArticleInFindArticle(article);
	}
	
//	public List<PostBean> showSearchArticleInFindArticle(String searchString){
//		return postDAO.showAllArticleInFindArticle(article);
//	}
	
}
