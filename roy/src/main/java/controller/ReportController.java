package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.ReportBean;
import model.service.ReportService;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ReportController {

	@Autowired
	ReportService reportService;

	@RequestMapping(value = "**/report.get")
	public String get(Model model, Integer report_id) {
		model.addAttribute("reportBean", reportService.findByPrimaryKey(report_id));
		return "testSpring2";
	}

	@RequestMapping(value = "**/report.create")
	public String put(Model model, ReportBean reportBean,HttpServletRequest req) {
		model.addAttribute("reportBean", reportService.update(reportBean));
		return "testSpring2";
	}

}
