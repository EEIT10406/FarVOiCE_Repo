package controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.bean.MemberBean;
import model.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	@RequestMapping(path="/login-signUp-upload/MemberLogin.controller")
	public String login(Model model,
			String username,
			String password,
			HttpSession session) {
// 驗證資料
		System.out.println(username);
		System.out.println(password);
	
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);

		if (username == null || username.trim().length() == 0) {
			errors.put("usernameError", " 這個欄位是必須的");
		}
		if (password == null || password.trim().length() == 0) {
			errors.put("passwordError", " 這個欄位是必須的");
		}
		if (errors != null && !errors.isEmpty()) {
			return "/login-signUp-upload/login.jsp";
		}
		
//呼叫model
		String requestURI = (String) session.getAttribute("requestURI");
		System.out.println(requestURI);
		MemberBean bean = memberService.login(username, password);
//呼叫view
		if (bean == null) {
			errors.put("usernameError", "登入失敗");
			return "/login-signUp-upload/login.jsp";
		} else {
			session.setAttribute("user", bean);
			if(requestURI!=null && requestURI.length() > 0) {
				System.out.println("跳轉喔");
				if(requestURI.contains("rankTop10")) {
					
					return "redirect:/rankTop10/rankTopTen.jsp";
				}
				requestURI = requestURI.substring(5,requestURI.length() );
				return"redirect:/"+requestURI;
				
			}
			return"redirect:/personalPage/personalPage.jsp";
		}
	}
	
	
	@RequestMapping(path="/login-signUp-upload/MemberSignUP.controller")
	public String signUp(Model model,
			MemberBean bean,
			String member_passwordConfirm,
			HttpSession session) {
// 驗證資料
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		System.out.println(bean.getMember_password()+","+member_passwordConfirm);
		if(bean!=null) {
			if (!bean.getMember_password().equals(member_passwordConfirm)) {
				errors.put("signUpError", "密碼484不一致呢");
			}
		}
		if (bean.getMember_username() == null || bean.getMember_username().trim().length() == 0) {
			errors.put("signUpError", " 每個欄位是必須的喔。");
		}
		if (bean.getMember_password() == null || bean.getMember_password().trim().length() == 0) {
			errors.put("signUpError", " 每個欄位是必須的喔。");
		}
		if (bean.getMember_email() == null || bean.getMember_email().trim().length() == 0) {
			errors.put("signUpError", " 每個欄位是必須的喔。");
		}
		if (bean.getMember_nickname() == null || bean.getMember_nickname().trim().length() == 0) {
			errors.put("signUpError", " 每個欄位是必須的喔。");
		}
		
		if (errors != null && !errors.isEmpty()) {
			model.addAttribute("CssError","border:1px #880000 solid");
			return "/login-signUp-upload/signUp.jsp";
		}
		
//呼叫model
		bean.setMember_registerTime(new Date());
		bean.setMember_ban(false);

		MemberBean signUpbean = memberService.signUp(bean);
//呼叫view
		if (signUpbean == null) {
			errors.put("signUpError", "註冊失敗");
			return "/login-signUp-upload/signUp.jsp";
		} else {
			session.setAttribute("user", signUpbean);
			return"redirect:/personalPage/personalPage.jsp";
		}
	}
	
	
	
	@RequestMapping(path="/login-signUp-upload/MemberLogOut.controller")
	public String signUp(Model model,
			HttpSession session) {
		MemberBean bean =null;
		session.setAttribute("user", bean);
		return"redirect:/homePage/index.jsp";
	}
		
}
	
	
	
	
	
	
	
	

