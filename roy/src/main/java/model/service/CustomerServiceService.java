package model.service;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.CustomerServiceBean;
import model.dao.CustomerServiceDAO;

@Service
@Transactional
public class CustomerServiceService {
	@Autowired
	private CustomerServiceDAO customerServiceDAO;
	public CustomerServiceService(CustomerServiceDAO customerServiceDAO) {
		super();
		this.customerServiceDAO = customerServiceDAO;
	}

//	public static void main(String[] args) {
//		try {
//			HibernateUtil.getSessionfactory().getCurrentSession().beginTransaction();
//
//			CustomerServiceService customerServiceService = new CustomerServiceService(new CustomerServiceDAO(HibernateUtil.getSessionfactory()));
//			
//			CustomerServiceBean temp = customerServiceService.findSingleCustomerService(1);
//			System.out.println(temp);
//			
//			List<CustomerServiceBean> temp = customerServiceService.showAllCustomerService();
//			for(CustomerServiceBean x:temp) {
//			System.out.println(x);
//			}
//			System.out.println(customerServiceService.remove(3));
//			System.out.println(customerServiceService.remove(4));
//
//			customerServiceService.fix(1, new Date());
//			
//			CustomerServiceBean temp = new CustomerServiceBean();
//			temp.setCustomerService_email("street717@yahoo.com.tw");
//			temp.setCustomerService_title("客訴網站太醜");
//			temp.setCustomerService_content("這網站實在是基掰醜我受不了了");
//			temp.setCustomerService_time(new Date());
//			temp.setCustomerService_fixed(false);
//			CustomerServiceBean beanResult = customerServiceService.postNewCustomerService(temp);
//			System.out.println(beanResult);
//			
//			HibernateUtil.getSessionfactory().getCurrentSession().getTransaction().commit();
//		} finally {
//			HibernateUtil.closeSessionFactory();
//		}
//	}
	public List<CustomerServiceBean> showAllCustomerService(){return customerServiceDAO.findAll();}//OK
	
	public CustomerServiceBean postNewCustomerService(CustomerServiceBean bean) {//OK
		CustomerServiceBean newCustomerServiceBean = customerServiceDAO.create(bean);
		return newCustomerServiceBean;
	}
	public CustomerServiceBean findSingleCustomerService(Integer CustomerService_id) {//OK
		CustomerServiceBean bean = customerServiceDAO.findByPrimaryKey(CustomerService_id);
		if(bean!=null) {
			return bean;
		}
		return null;
	}
	public boolean remove(Integer CustomerService_id) {//OK
		boolean b = customerServiceDAO.remove(CustomerService_id);
		return b;
	}
	public CustomerServiceBean fix (Integer CustomerService_id,Date date) {//OK
		CustomerServiceBean bean = customerServiceDAO.findByPrimaryKey(CustomerService_id);
		if(bean!=null) {
			bean.setCustomerService_fixed(true);
			bean.setCustomerService_fixedTime(date);
			return bean;
		}
		return null;
	}
	
}
