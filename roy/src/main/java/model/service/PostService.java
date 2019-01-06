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
	
	public static void main(String[] args) {
		try {
			HibernateUtil.getSessionfactory().getCurrentSession().beginTransaction();

			PostService postService = new PostService(new PostDAO(HibernateUtil.getSessionfactory()));
			
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
			
			HibernateUtil.getSessionfactory().getCurrentSession().getTransaction().commit();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}

	public PostBean postNewArticle(PostBean bean) {
		//0104 OK
		PostBean newPostBean = postDAO.create(bean);
		return newPostBean;
	}
	public List<PostBean> showAllArticleFromMember(String member_username){
		//0106 OK
		return postDAO.findArticleFromMember(member_username);
	}
}
