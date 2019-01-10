package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.bean.MemberBean;
import model.service.FollowService;

@Controller
public class FollowController {
	@Autowired
	FollowService followService;
	@RequestMapping(path="personalPage/somebodyPersonalPageFollow.controller")
	public String method(Model model,String somebody,HttpSession session) {
		System.out.println(somebody);
		MemberBean memberWhoS = (MemberBean)session.getAttribute("user");
		followService.followORCancelFollow(memberWhoS, somebody);
		return "/personalPage/somebodyPersonalPage.jsp";
	}
	@RequestMapping(path="personalPage/somebodyPersonalPageCheckFollow.controller")
	@ResponseBody
	public String method1(Model model,HttpSession session) {
		String somebody = (String) session.getAttribute("somebody");
		MemberBean memberWhoS = (MemberBean)session.getAttribute("user");
		if(followService.checkFollowOrNot(memberWhoS, somebody)) {
			return "true";
		}else {
			return "false";
		}
	}
	
}
