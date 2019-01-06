package model.service;

import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.MemberBean;
import model.dao.MemberDAO;
import model.hibernate.HibernateUtil;
@Service
@Transactional
public class MemberService {
//	public static void main(String[] args) {
//		try {
//			HibernateUtil.getSessionfactory().getCurrentSession().beginTransaction();
//
//			MemberService memberService = new MemberService(
//					new MemberDAO(HibernateUtil.getSessionfactory()));
//			MemberBean login = memberService.login("peter", "123");
//			System.out.println("login="+login);
//			
//			MemberBean temp = new MemberBean();
//			temp.setMember_username("0103Test");
//			temp.setMember_password("456789");
//			temp.setMember_nickname("炸雞");
//			temp.setMember_registerTime(new Date());
//			MemberBean register = memberService.signUp(temp);
//
//			HibernateUtil.getSessionfactory().getCurrentSession().getTransaction().commit();
//		} finally {
//			HibernateUtil.closeSessionFactory();
//		}
//	}
	@Autowired
	private MemberDAO memberDAO;
	public MemberService(MemberDAO memberDAO) {
		super();
		this.memberDAO = memberDAO;
	}
	public MemberBean login(String username, String password) {
		//0103 OK
		MemberBean bean = memberDAO.findByPrimaryKey(username);
		if(bean!=null) {
			if(password!=null && password.length()!=0) {
				if(password.equals(bean.getMember_password())) {
					return bean;
				}
			}
		}
		return null;
	}
	public MemberBean signUp(MemberBean bean) {//成功回傳Bean失敗則null
		//0103 OK
		MemberBean memberExistBean = memberDAO.findByPrimaryKey(bean.getMember_username());
		if(memberExistBean==null) {//帳號不存在
			MemberBean newMemberBean = memberDAO.create(bean);
			return newMemberBean;
		}
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	public boolean changePassword(String username, String oldPassword, String newPassword) {
//		MemberBean bean = this.login(username, oldPassword);
//		if(bean!=null) {
//			if (newPassword!=null && newPassword.length()!=0) {
//				byte[] temp = newPassword.getBytes();
////				return memberDAO.update(
////						temp, bean.getEmail(), bean.getBirth(), username);
//			}
//		}
//		return false;
//	}
	
}
