package controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
