package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.bean.FundingBean;
import model.service.FundingService;

@Controller
public class FundingController {

	@Autowired
	private FundingService fundingService;
//創建專案
	
	@RequestMapping("/funding/funding.controller")
//		public String method(String funding_title, String funding_description, Integer funding_goal,
//				String funding_styleName, String funding_city, Model model) {

	public String method(FundingBean bean, Model model) {

		System.out.println(bean);
		fundingService.insert(bean);

		return "startProject.jsp";
	}

}
