package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.service.MemberService;

@Controller
public class SomebodyPersonalPageController {
	@Autowired
	MemberService memberService; 
	@RequestMapping(path="/personalPage/somebodyPersonalPage.controller")
	public String method(Model model,String somebody,String nickname,HttpSession session) {
		//進別人的首頁
		System.out.println(somebody+","+nickname);
		session.setAttribute("somebody", somebody);
		session.setAttribute("nickname", nickname);

		return "/personalPage/somebodyPersonalPage.jsp";
	}
}
