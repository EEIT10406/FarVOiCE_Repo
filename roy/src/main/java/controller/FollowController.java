package controller;

import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;

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
	//追蹤or退追蹤
	@RequestMapping(path="personalPage/somebodyPersonalPageFollow.controller")
	public String method(Model model,String somebody,HttpSession session) {
		System.out.println(somebody);
		MemberBean memberWhoS = (MemberBean)session.getAttribute("user");
		if(memberWhoS!=null) { 
		followService.followORCancelFollow(memberWhoS, somebody);
		return "/personalPage/somebodyPersonalPage.jsp";
		}
		return "/personalPage/somebodyPersonalPage.jsp";

	}
	//檢查有無追蹤
	@RequestMapping(path="personalPage/somebodyPersonalPageCheckFollow.controller")
	@ResponseBody
	public String method1(Model model,HttpSession session) {
		String somebody = (String) session.getAttribute("somebody");
		MemberBean memberWhoS = (MemberBean)session.getAttribute("user");
		if(memberWhoS!=null) {
			if(followService.checkFollowOrNot(memberWhoS, somebody)) {
					return "true";
				}else {
					return "false";
			}
		}
		return "false";
	}
	//看看幾個follow 我
	@RequestMapping(path="personalPage/howMuchFollowMe.controller" ,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String howMuchFollowMe(Model model,HttpSession session,String username) {
		System.out.println(username);

		 return String.valueOf(followService.howMuchFollowMe(username));
	}
	
	//看看我follow 幾個
	@RequestMapping(path="personalPage/iFollowHowMuch.controller" ,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String iFollowHowMuch(Model model,HttpSession session,String username) {
		System.out.println(username);
		 return String.valueOf(followService.iFollowHowMuch(username));
	}
	
}
