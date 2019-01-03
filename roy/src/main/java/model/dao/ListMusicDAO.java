package model.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.bean.ListMusicBean;
import model.bean.primarykey.ListMusicId;
import model.hibernate.HibernateUtil;

public class ListMusicDAO {
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
		ListMusicDAO fundingDAO = new ListMusicDAO();
		fundingDAO.setSession(session);
//		//findByPk
//		ListMusicId listMusicIdByPk = new ListMusicId();
//		listMusicIdByPk.setPlaylist_id(1);
//		listMusicIdByPk.setMusic_id(1);
//		ListMusicBean bean0 = fundingDAO.findByPrimaryKey(listMusicIdByPk);
//		System.out.println(bean0);		
//		
//		//findAll
		List<ListMusicBean> beans = fundingDAO.findAll();
		for(ListMusicBean bean1:beans) {
			System.out.println(bean1);
		}
		
//		//create
//		ListMusicBean bean2 = new ListMusicBean();
//		ListMusicId createListMusicId = new ListMusicId();
//		createListMusicId.setPlaylist_id(1);
//		createListMusicId.setMusic_id(2);
//		bean2.setId(createListMusicId);
//		ListMusicBean beanResult = fundingDAO.create(bean2);
//		System.out.println(beanResult);
		
//		//update 應該不用吧
//		ListMusicBean bean3 = new ListMusicBean();
//		int updateInt = 3;
//		bean3.setFunding_id(updateInt);
//		bean3.setMember_username("Marry");
//		fundingDAO.update(bean3);
//		ListMusicBean updateTempBean = fundingDAO.findByPrimaryKey(updateInt);
//		System.out.println(updateTempBean);
		
//		//remove
		ListMusicId removeListMusicId = new ListMusicId();
		removeListMusicId.setPlaylist_id(2);
		removeListMusicId.setMusic_id(1);
		boolean  remove = fundingDAO.remove(removeListMusicId);
		System.out.println(remove);
		
		
		
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
	
	public ListMusicBean findByPrimaryKey(ListMusicId listMusicId) {
		//0103 OK
		return this.getSession().get(ListMusicBean.class, listMusicId);
	}
	public List<ListMusicBean> findAll() {
		//0103 OK
		return this.getSession().createQuery("from ListMusicBean", ListMusicBean.class)
				.setMaxResults(50)
				.list();
	}
	public ListMusicBean create(ListMusicBean bean) {
		//0103 OK
		if(bean!=null) {
			ListMusicBean result = this.getSession().get(ListMusicBean.class, bean.getId());
			if(result==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}
	
//	public void update(ListMusicBean bean) {
//		
//		getSession().clear();
//		getSession().update(bean);
//	}
	
	public boolean remove(ListMusicId listMusicId) {
		//0103 OK
		ListMusicBean result = this.getSession().get(ListMusicBean.class, listMusicId);
		if(result!=null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}
}
