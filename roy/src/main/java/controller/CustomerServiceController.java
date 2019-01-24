package controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.bean.CustomerServiceBean;
import model.service.CustomerServiceService;

@Controller
public class CustomerServiceController {
	@Autowired
	CustomerServiceService customerServiceService;
	@RequestMapping(path="/contact/new")
	public String newContact(String email,String content,String title,Model model) {
		CustomerServiceBean bean = new CustomerServiceBean();
		bean.setCustomerService_email(email);
		bean.setCustomerService_content(content);
		bean.setCustomerService_fixed(false);
		bean.setCustomerService_time(new Date());
		bean.setCustomerService_title(title);
		CustomerServiceBean resultBean = customerServiceService.postNewCustomerService(bean);
		if(resultBean!=null) {
			return "redirect:/homePage/index.jsp";
		}
		return "redirect:/homePage/index.jsp";
	}
	
	@RequestMapping(path="/back/showAllCustomerService.controller",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String showAllCustomerService(Model model) {		
		List<CustomerServiceBean> CustomerServiceBeans = customerServiceService.showAllCustomerService();
		Gson gson = new Gson();
		String jsonList = gson.toJson(CustomerServiceBeans);
			System.out.println(jsonList);
		
		return jsonList;
	}
	
	@RequestMapping(path="/back/edit.controller")
	public void edit(Boolean fixed,Integer CustomerService_id) {	
		customerServiceService.fix(CustomerService_id, new Date());
	}
}
