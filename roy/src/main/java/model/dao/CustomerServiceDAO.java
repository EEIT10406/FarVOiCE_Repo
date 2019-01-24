package model.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.CustomerServiceBean;

@Repository
public class CustomerServiceDAO {
//	 Spring MVC
	@Autowired
	private SessionFactory sessionFactory;

	public CustomerServiceDAO(SessionFactory sessionfactory) {
		this.sessionFactory = sessionfactory;
	}

	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}

	public static void main(String... args) throws IOException, Exception, SQLException {
//		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
//		Session session = sessionFactory.openSession();
//		Transaction tx = session.beginTransaction();
//		CustomerServiceDAO CustomerServiceDAO = new CustomerServiceDAO();
//		CustomerServiceDAO.setSession(session);
//		
//		//findByPk
//		CustomerServiceBean bean0 = CustomerServiceDAO.findByPrimaryKey(1);
//		System.out.println(bean0);		
//		
//		//findAll
//		List<CustomerServiceBean> beans = CustomerServiceDAO.findAll();
//		for(CustomerServiceBean bean1:beans) {
//			System.out.println(bean1);
//		}
//		findArticleFromMember
//		List<CustomerServiceBean> posts = CustomerServiceDAO.findArticleFromMember("Peter");
//		for(CustomerServiceBean beantemp:posts) {
//			System.out.println(beantemp);
//		}
//		//create
//		CustomerServiceBean bean2 = new CustomerServiceBean();
//		bean2.setCustomerService_email("street717@yahoo.com.tw");
//		bean2.setCustomerService_title("客訴網站太醜");
//		bean2.setCustomerService_content("這網站實在是基掰醜我受不了了");
//		bean2.setCustomerService_time(new Date());
//		CustomerServiceBean beanResult = CustomerServiceDAO.create(bean2);
//		System.out.println(beanResult);
		//update 
//		CustomerServiceBean bean3 = CustomerServiceDAO.findByPrimaryKey(1);
//		bean3.setCustomerService_fixed(true);
//		bean3.setCustomerService_fixedTime(new Date());

//		//remove
//		boolean  remove = CustomerServiceDAO.remove(2);
//		System.out.println(remove);
//
//		tx.commit();
//		session.close();
//		HibernateUtil.closeSessionFactory();
	}

	// if you need to test

//	private Session session;
//	public void setSession(Session session) {
//		this.session = session;
//	}
//
//	public Session getSession() {
//		return session;
//	}
	// ------------------
	public CustomerServiceBean findByPrimaryKey(Integer CustomerService_id) {
		return this.getSession().get(CustomerServiceBean.class, CustomerService_id);
	}

	public List<CustomerServiceBean> findAll() {
		return this.getSession().createQuery("from CustomerServiceBean", CustomerServiceBean.class).setMaxResults(50)
				.list();
	}

	public CustomerServiceBean create(CustomerServiceBean bean) {
		if (bean != null) {
			this.getSession().save(bean);
			return bean;
		}
		return bean;
	}

	public void update(CustomerServiceBean bean) {
		// 0103 OK
		getSession().clear();
		getSession().update(bean);
	}

	public boolean remove(Integer CustomerService_id) {
		CustomerServiceBean result = this.getSession().get(CustomerServiceBean.class, CustomerService_id);
		if (result != null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}
}
