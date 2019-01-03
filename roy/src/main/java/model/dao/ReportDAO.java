package model.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.bean.ReportBean;
import model.hibernate.HibernateUtil;

public class ReportDAO {
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
		ReportDAO reportDAO = new ReportDAO();
		reportDAO.setSession(session);
		
//		//findByPk
//		ReportBean bean0 = reportDAO.findByPrimaryKey(1);
//		System.out.println(bean0);		
//		
//		//findAll
//		List<ReportBean> beans = reportDAO.findAll();
//		for(ReportBean bean1:beans) {
//			System.out.println(bean1);
//		}
		
//		//create
//		ReportBean bean2 = new ReportBean();
//		bean2.setReport_id(4);
//		bean2.setMember_usernameReportS("Marry");
//		bean2.setMusic_idReportM(4);
//		java.util.Date date = java.sql.Date.valueOf("2019-01-03");
//		bean2.setReport_time(date);
//	
//		ReportBean beanResult = reportDAO.create(bean2);
//		System.out.println(beanResult);
		
//		//update 
//		ReportBean bean3 = new ReportBean();
//		bean3.setReport_id(4);
//		bean3.setMember_usernameReportS("Marry");
//		bean3.setMusic_idReportM(4);
//		java.util.Date date = java.sql.Date.valueOf("2019-01-20");
//		bean3.setReport_time(date);
//		reportDAO.update(bean3);
//		ReportBean updateTempBean = reportDAO.findByPrimaryKey(4);
//		System.out.println(updateTempBean);
		
//		//remove
		boolean  remove = reportDAO.remove(4);
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
	
	public ReportBean findByPrimaryKey(Integer report_id) {
		//0103 OK
		return this.getSession().get(ReportBean.class, report_id);
	}
	public List<ReportBean> findAll() {
		//0103 OK
		return this.getSession().createQuery("from ReportBean", ReportBean.class)
				.setMaxResults(50)
				.list();
	}
	public ReportBean create(ReportBean bean) {
		//0103 OK
		if(bean!=null) {
			ReportBean result = this.getSession().get(ReportBean.class, bean.getReport_id());
			if(result==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}
	
	public void update(ReportBean bean) {
		//0103 OK
		getSession().clear();
		getSession().update(bean);
	}
	
	public boolean remove(Integer report_id) {
		//0103 OK
		ReportBean result = this.getSession().get(ReportBean.class, report_id);
		if(result!=null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}
}
