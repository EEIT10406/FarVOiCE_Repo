package controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import model.bean.MemberBean;
import model.bean.PostBean;
import model.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	//登入
	@RequestMapping(path="/login-signUp-upload/MemberLogin.controller")
	public String login(Model model,
			String username,
			String password,
			HttpSession session) {
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
		String requestURI = (String) session.getAttribute("requestURI");
		System.out.println(requestURI);
		MemberBean bean = memberService.login(username, password);
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
	
	//註冊
	@RequestMapping(path="/login-signUp-upload/MemberSignUP.controller")
	public String signUp(Model model,
			MemberBean signUPBean,
			String member_passwordConfirm,
			HttpSession session) {
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		System.out.println(signUPBean.getMember_password()+","+member_passwordConfirm);
		if(signUPBean!=null) {
			if (!signUPBean.getMember_password().equals(member_passwordConfirm)) {
				errors.put("signUpError", " 密碼不一致呢。");
			}
		}
		if (signUPBean.getMember_username() == null || signUPBean.getMember_username().trim().length() == 0) {
			errors.put("signUpError", " 每個欄位是必須的喔。");
		}
		if (signUPBean.getMember_password() == null || signUPBean.getMember_password().trim().length() == 0) {
			errors.put("signUpError", " 每個欄位是必須的喔。");
		}
		if (signUPBean.getMember_email() == null || signUPBean.getMember_email().trim().length() == 0) {
			errors.put("signUpError", " 每個欄位是必須的喔。");
		}
		if (signUPBean.getMember_nickname() == null || signUPBean.getMember_nickname().trim().length() == 0) {
			errors.put("signUpError", " 每個欄位是必須的喔。");
		}
		if(memberService.checkNicknameExist(signUPBean.getMember_nickname())) {
			errors.put("signUpError", " 暱稱是否重複了呢。");
		}
		if (errors != null && !errors.isEmpty()) {
			model.addAttribute("CssError","border:1px #880000 solid");
			return "/login-signUp-upload/signUp.jsp";
		}
		signUPBean.setMember_registerTime(new Date());
		signUPBean.setMember_ban(false);
		signUPBean.setMember_profileImage("");
		MemberBean signedbean = memberService.signUp(signUPBean);
		
		if (signedbean == null) {
			errors.put("signUpError", "帳號已存在");
			return "/login-signUp-upload/signUp.jsp";
		} else {
			session.setAttribute("user", signedbean);
			return"redirect:/personalPage/personalPage.jsp";
		}
	}
	@RequestMapping(path="/login-signUp-upload/MemberLogOut.controller")
	public String logOut(Model model,
			HttpSession session) {
		MemberBean bean =null;
		session.setAttribute("user", bean);
		session.setAttribute("requestURI",null);
		return"redirect:/homePage/index.jsp";
	}
	
	//更改密碼
	@RequestMapping(path="/personalPage/change_password")
	public String changePassword(Model model,
			HttpSession session,String old_password,String new_password,String new_passconf) {
		MemberBean bean = (MemberBean) session.getAttribute("user");
		Map<String, String> errors = new HashMap<>();
		if(!bean.getMember_password().equals(old_password)) {
			errors.put("passError", "是不是忘記密碼了呢?");
		}
		if(!new_password.equals(new_passconf)) {
			errors.put("passError", "新密碼不一致?");

		}
		if(!errors.isEmpty()) {
			model.addAttribute("errors", errors);
			return "/personalPage/personalDetail.jsp";
		}
		
		bean.setMember_password(new_passconf);
		memberService.update(bean);
		model.addAttribute("changePassSucc", "密碼更改成功");
		return"/personalPage/personalDetail.jsp";
	}
	
	@RequestMapping(path="/personalPage/change_email")
	public String changeEmail(Model model,
			HttpSession session,String email,String emailconf) {
		MemberBean bean = (MemberBean) session.getAttribute("user");
		Map<String, String> errors = new HashMap<>();
		if(!email.equals(emailconf)) {
			errors.put("passError", "新email不一致?");
		}
		if(!errors.isEmpty()) {
			model.addAttribute("errors", errors);
			return "/personalPage/personalDetail.jsp";
		}
		
		bean.setMember_email(emailconf);
		memberService.update(bean);
		model.addAttribute("changePassSucc", "Email更改成功");
		return"/personalPage/personalDetail.jsp";
	}
	@RequestMapping(path="/personalPage/change_profile")
	public String changeProfile(Model model,
			HttpSession session,
			@RequestParam("member_profileImage") MultipartFile imageFile) {
		MemberBean bean = (MemberBean) session.getAttribute("user");
		String imagePath = "";
		if (!imageFile.isEmpty()) {
			try {
				byte[] imageByte = imageFile.getBytes();
				imagePath = memberService.imageFilePath(imageByte);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		bean.setMember_profileImage(imagePath);
		memberService.update(bean);
		model.addAttribute("changeProSucc", "大頭貼更改成功");
		return"/personalPage/personalDetail.jsp";
	}
	@RequestMapping(path="/login-signUp-upload/accountCheck.controller",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String accountCheck(Model model,HttpSession session,String user) {
		//找找有沒有這個帳號
		System.out.println(user);
		boolean existOrNot = memberService.checkAccountExist(user);
		//重複-->true
		System.out.println("controller-existOrNot = " +existOrNot);

		String jsonList = "{\"existOrNot\":\""+existOrNot+"\"}";
		return jsonList;
	}
	
	@RequestMapping(path="/login-signUp-upload/nicknameCheck.controller",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String nicknameCheck(Model model,HttpSession session,String nickname) {
		//找找有沒有這個nickname
		System.out.println(nickname);
		boolean existOrNot = memberService.checkNicknameExist(nickname);
		//重複-->true
		System.out.println("controller-existOrNot = " +existOrNot);

		String jsonList = "{\"existOrNot\":\""+existOrNot+"\"}";
		return jsonList;
	}
}
	
	
	
	
	
	
	
	

