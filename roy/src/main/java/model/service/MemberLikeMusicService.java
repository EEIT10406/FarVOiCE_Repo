package model.service;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.MemberLikeMusicBean;
import model.bean.MusicBean;
import model.bean.primarykey.MemberLikeMusicId;
import model.dao.MemberLikeMusicDAO;
import model.dao.MusicDAO;

@Service
@Transactional
public class MemberLikeMusicService {
    @Autowired
	private MemberLikeMusicDAO memberLikeMusicDAO;
    @Autowired
    private MusicDAO musicDao;
    
    
    
  //使用者收回讚後刪除該筆資料
    public boolean memberTakeBackLike(MemberLikeMusicId memberLikeMusicId) {
    	boolean result=memberLikeMusicDAO.remove(memberLikeMusicId);
    	if(result==true) {
    		return true;
    	}
    	return false;
    }
    
    
    //使用者按讚後新增一筆資料
    public MemberLikeMusicBean memberClickLike(MemberLikeMusicBean bean) {
    	MemberLikeMusicBean memberLikeMusicBean=memberLikeMusicDAO.create(bean);
    	if(memberLikeMusicBean!=null) {
    		return memberLikeMusicBean;
    	}
    	return null;
    }
    

	//找出該使用者喜歡哪些音樂，且該音樂沒被下架，回傳音樂id
	public List<Integer> memberLikeMusics(String member_username) {
		List <MemberLikeMusicBean> memberLikeMusicBean=memberLikeMusicDAO.findLikeMusicByUser(member_username);
		if(memberLikeMusicBean!=null) {
			List <Integer> likeMusics=new LinkedList<>();
			for(MemberLikeMusicBean beans:memberLikeMusicBean) {
				MusicBean musicBean=musicDao.findByPrimaryKey(beans.getId().getMusic_id());
				if(musicBean.getMusic_unavailable()==false) {
					likeMusics.add(beans.getId().getMusic_id());
				}	
			}
			return likeMusics;
		}else{
			return null;
		}
	}
	
	
	public static void main(String[] args) {
		
//		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
//		Session session = sessionFactory.openSession();
//		Transaction tx = session.beginTransaction();
//		MemberLikeMusicDAO memberLikeMusicDAO = new MemberLikeMusicDAO();
//		memberLikeMusicDAO.setSession(session);
//		
//		MemberLikeMusicService service=new MemberLikeMusicService();
//		MemberLikeMusicId memberLikeMusicId = new MemberLikeMusicId();
//		memberLikeMusicId.setMember_username("Jack");
//		memberLikeMusicId.setMusic_id(3);
//		service.setMusicDAO(memberLikeMusicDAO);
//		System.out.println(service.memberLike(memberLikeMusicId));
//		
//		
//
//		
//		
//		tx.commit();
//		session.close();
//		HibernateUtil.closeSessionFactory();

		

	}





	
	
}
