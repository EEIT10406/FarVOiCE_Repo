package model.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.MemberBean;
import model.hibernate.HibernateUtil;
@Repository
public class MemberDAO {
	//Spring MVC
	@Autowired
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}
	public MemberDAO(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}
	public MemberDAO() {}
	
	
	
	public static void main(String... args) throws IOException, Exception, SQLException {
		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		MemberDAO memberDAO = new MemberDAO();
//		memberDAO.setSession(session);
		//findByPk
//		MemberBean bean0 = memberDAO.findByPrimaryKey("Peter");
//		System.out.println(bean0);		
//		
		//findAll
//		List<MemberBean> beans = memberDAO.findAll();
//		for(MemberBean bean1:beans) {
//			System.out.println(bean1);
//		}
		
		//create
//		MemberBean bean2 = new MemberBean();
//		bean2.setMember_username("PurpleDrag");
//		bean2.setMember_password("456");
//		bean2.setMember_email("hooooo@gmail.com");
//		bean2.setMember_nickname("要要");
//	
//		bean2.setMember_registerTime(new Date());
//		bean2.setMember_ban(true);
//		MemberBean beanResult = memberDAO.create(bean2);
//		System.out.println(beanResult);
		
		//update
//		MemberBean bean3 = new MemberBean();
//		bean3.setMember_username("PurpleDrag");
//		bean3.setMember_password("456update");
//		bean3.setMember_nickname("資海喔咿咿");
//		memberDAO.update(bean3);
		
		//remove
//		boolean  remove = memberDAO.remove("PurpleDrag");
//		System.out.println(remove);
		
		
		
		tx.commit();
		session.close();
		HibernateUtil.closeSessionFactory();
	}
	//Test
//	private Session session;
//	public void setSession(Session session) {
//		this.session = session;
//	}
//
//	public Session getSession() {
//		return session;
//	}
	
	
	public List<MemberBean> findByThirdId(String member_third_id) {
		
		return this.getSession().createQuery("from MemberBean where member_third_id='"+member_third_id+"'",MemberBean.class).list();
	}
	
	public MemberBean findByPrimaryKey(String member_username) {
		//0114	OK
		return this.getSession().get(MemberBean.class, member_username);
	}
	public List<MemberBean> findAll() {
		//0114  OK
		return this.getSession().createQuery("from MemberBean", MemberBean.class)
				.setMaxResults(50)
				.list();
	}
	public MemberBean create(MemberBean bean) {
		//0114  OK
		if(bean!=null) {
			MemberBean result = this.getSession().get(MemberBean.class, bean.getMember_username());
			if(result==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}
	
	public void update(MemberBean bean) {
		//0114  OK
		getSession().clear();
		getSession().update(bean);
	}
	
	public boolean remove(String member_username) {
		//0114  OK
		MemberBean result = this.getSession().get(MemberBean.class, member_username);
		if(result!=null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}
	//給nickname得username
	public String nicenameToUsername (String nickname) {
		//0111 OK
		String hql = " from MemberBean  WHERE member_nickname=:member_nickname ";
		Query<MemberBean> query = this.getSession().createQuery(hql);
		query.setParameter("member_nickname", nickname);
		List<MemberBean> memberList = query.list();
		MemberBean temp =  memberList.get(0);
		return temp.getMember_username();
	}
	
	
	//檢查nickname重複
	public boolean nicknameCheck(String nickname) {
		String hql = " from MemberBean  WHERE member_nickname=:member_nickname ";
		Query<MemberBean> query = this.getSession().createQuery(hql);
		query.setParameter("member_nickname", nickname);
		List<MemberBean> memberList = query.list();		
		if(memberList.isEmpty()) {// no repeat
			return false;
		}else {
			return true;
		}
	}
	
	
	
	
	
}
