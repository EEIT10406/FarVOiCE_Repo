package model.service;

import java.io.FileOutputStream;
import java.io.IOException;
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
		return null;//帳號已存在
	}
	public void update(MemberBean bean) {
			memberDAO.update(bean);		
	}
	
	// 給上傳的大頭貼一個儲存路徑
	public String imageFilePath(byte[] file) throws IOException {

		String imageFilePath = "C:/Roy_FarVoice/image/profile/" + System.currentTimeMillis()+".jpg";
		FileOutputStream out = new FileOutputStream(imageFilePath);
		out.write(file);
		out.close();

		return "/roy/image"+imageFilePath.substring(21);
	}
	
	//查找帳號有無重複
	public boolean checkAccountExist(String username) {
		//有重複的話傳true反之則false
		MemberBean checkBean = memberDAO.findByPrimaryKey(username);
		if(checkBean!=null) {//exist
			System.out.println("service--true");
			return true;
		}else {
			System.out.println("service--false");

			return false;
		}

	}
	//查找nickname有無重複
	public boolean checkNicknameExist(String nickname) {
		//有重複的話傳true反之則false
		return memberDAO.nicknameCheck(nickname);
	}
	//給username得到Bean
	public MemberBean getMemberBeanForSomebodyPersonalPage(String username) {
		if(memberDAO.findByPrimaryKey(username)!=null) {
			return memberDAO.findByPrimaryKey(username);
		}
		return null;
	}
}
