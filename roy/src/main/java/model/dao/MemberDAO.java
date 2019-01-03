package model.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.bean.MemberBean;
import model.hibernate.HibernateUtil;

public class MemberDAO {
	//Spring MVC
//	private SessionFactory sessionFactory;
//	public void setSessionFactory(SessionFactory sessionFactory) {
//		this.sessionFactory = sessionFactory;
//	}
//	public Session getSession() {
//	return this.sessionFactory.getCurrentSession();
//}
	
	
	public static void main(String... args) throws IOException, Exception, SQLException {
		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		MemberDAO memberDAO = new MemberDAO();
		memberDAO.setSession(session);
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
//		File fileIn = new File("C:/Users/User/Desktop/FarVoice/Cutekirby.jpg");
//		int length = (int)fileIn.length();
//		byte[] fileInByteArray = new byte[length];
//		Blob blob = null;;
//		FileInputStream fis = new FileInputStream(fileIn);
//		fis.read(fileInByteArray);
//		blob = new SerialBlob(fileInByteArray);
//		fis.close();
//		bean2.setMember_profileImage(blob);
//		bean2.setMember_registerTime(new Date());
//		bean2.setMember_ban(true);
//		MemberBean beanResult = memberDAO.create(bean2);
//		System.out.println(beanResult);
		
		//update
//		MemberBean bean3 = new MemberBean();
//		bean3.setMember_username("roy");
//		bean3.setMember_password("456update");
//		bean3.setMember_nickname("資海喔咿咿");
//		memberDAO.update(bean3);
		
		//remove
//		boolean  remove = memberDAO.remove("Roy");
//		System.out.println(remove);
		
		
		
		tx.commit();
		session.close();
		HibernateUtil.closeSessionFactory();
	}
	
	private Session session;
	public void setSession(Session session) {
		this.session = session;
	}

	public Session getSession() {
		return session;
	}
	
	public MemberBean findByPrimaryKey(String member_username) {
		//1228	OK
		return this.getSession().get(MemberBean.class, member_username);
	}
	public List<MemberBean> findAll() {
		//1228  OK
		return this.getSession().createQuery("from MemberBean", MemberBean.class)
				.setMaxResults(50)
				.list();
	}
	public MemberBean create(MemberBean bean) {
		//1228 OK
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
		//1228 OK
		getSession().clear();
		getSession().update(bean);
	}
	
	public boolean remove(String member_username) {
		//1228 OK
		MemberBean result = this.getSession().get(MemberBean.class, member_username);
		if(result!=null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}
}
