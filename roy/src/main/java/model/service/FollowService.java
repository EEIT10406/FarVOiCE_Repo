package model.service;

import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.FollowBean;
import model.bean.MemberBean;
import model.bean.primarykey.FollowId;
import model.dao.FollowDAO;
import model.hibernate.HibernateUtil;

@Service
@Transactional
public class FollowService {
	@Autowired
	private FollowDAO followDAO;
	public FollowService(FollowDAO followDAO) {
		super();
		this.followDAO = followDAO;
	}
	public static void main(String[] args) {
		try {
			HibernateUtil.getSessionfactory().getCurrentSession().beginTransaction();

			FollowService followService = new FollowService(new FollowDAO(HibernateUtil.getSessionfactory()));
			
//			MemberBean bean1 = new MemberBean();
//			bean1.setMember_username("Jack");
//			String m = "Marry";
//			
//			System.out.println(followService.checkFollowOrNot(bean1, m));
			
			
			HibernateUtil.getSessionfactory().getCurrentSession().getTransaction().commit();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}
	public void followORCancelFollow(MemberBean S,String member_username) {
		//0107 OK
		//如果沒訂閱就訂閱，已訂閱就取消訂閱
		FollowId followId = new FollowId(S.getMember_username(),member_username);
		FollowBean followExistBean = followDAO.findByPrimaryKey(followId);
		if(followExistBean==null) {
			//沒追蹤就追蹤
			FollowBean newFollowBean = new FollowBean();
			newFollowBean.setId(followId);
			newFollowBean.setFollow_time(new Date());
			followDAO.create(newFollowBean);
		}
		else {
			//追蹤就退追蹤
			followDAO.remove(followId); 
		}
	}
	public boolean checkFollowOrNot(MemberBean S,String member_username) {
		//0107 OK
		//找找看S訂閱M了沒
		FollowId followId = new FollowId(S.getMember_username(),member_username);
		FollowBean followExistBean = followDAO.findByPrimaryKey(followId);
		if(followExistBean==null) {
			//沒追蹤就沒追蹤阿阿不然勒
			return false;
		}else {
			//追蹤就true連你阿罵都知道
			return true;
		}
	}
}
