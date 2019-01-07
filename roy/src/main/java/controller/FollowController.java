package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
