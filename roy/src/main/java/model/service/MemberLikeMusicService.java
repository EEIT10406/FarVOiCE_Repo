package model.service;

import javax.servlet.ServletContext;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;

import model.bean.MemberLikeMusicBean;
import model.bean.primarykey.MemberLikeMusicId;
import model.dao.MemberLikeMusicDAO;
import model.hibernate.HibernateUtil;

@Service
public class MemberLikeMusicService {
    @Autowired
	private MemberLikeMusicDAO musicDAO;
    
	public MemberLikeMusicDAO getMusicDAO() {
		return musicDAO;
	}
	public void setMusicDAO(MemberLikeMusicDAO musicDAO) {
		this.musicDAO = musicDAO;
	}

	//判斷該使用者是否按讚該音樂
	public boolean memberLike(MemberLikeMusicId memberLikeMusicId) {
		//看資料庫是否有這筆資料
		MemberLikeMusicBean bean=musicDAO.findByPrimaryKey(memberLikeMusicId);
		//如果資料庫有傳回true
		if(bean!=null) {
			return true;
		}else{
			//資料庫沒有傳回false
			return false;
		}
	}
	
	
	public static void main(String[] args) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		MemberLikeMusicDAO memberLikeMusicDAO = new MemberLikeMusicDAO();
		memberLikeMusicDAO.setSession(session);
		
		MemberLikeMusicService service=new MemberLikeMusicService();
		MemberLikeMusicId memberLikeMusicId = new MemberLikeMusicId();
		memberLikeMusicId.setMember_username("Jack");
		memberLikeMusicId.setMusic_id(3);
		service.setMusicDAO(memberLikeMusicDAO);
		System.out.println(service.memberLike(memberLikeMusicId));
		
		

		
		
		tx.commit();
		session.close();
		HibernateUtil.closeSessionFactory();

		

	}





	
	
}
