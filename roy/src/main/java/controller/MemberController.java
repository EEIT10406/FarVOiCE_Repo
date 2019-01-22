package controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import model.bean.MemberBean;
import model.service.MemberService;
import util.mail.JavaEmailPass;
import util.mail.JavaEmailTest;
import util.uuid.UUIDGenerator;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;


	//登入
	@RequestMapping(path="/login-signUp-upload/MemberLogin.controller")
	public String login(Model model,String username,String password,HttpSession session,String third_Id) {
		System.out.println(username);
		System.out.println(password);
		//第三方登入
		if(third_Id!=null) {
			MemberBean bean=memberService.findThirdId(third_Id);
			//之前有第三方登入
			if(bean!=null) {
				session.setAttribute("user", bean);
				return "redirect:/personalPage/personalPage.jsp";
			}else {
			//之前還沒第三方登入
				model.addAttribute("thirdId", third_Id);
				return "/login-signUp-upload/thirdSignUp.jsp";
			}
		}
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
			errors.put("loginError", "請輸入有效帳號密碼");
			return "/login-signUp-upload/login.jsp";
		} else {
			if(bean.getMember_username().equals("David")) {//後台
				session.setAttribute("user", bean);
				return "redirect:/back/Back.jsp";
			}
			
			// 有帳號且登入成功
			//已驗證信箱
			if (bean.getMember_state() == 1) {
				session.setAttribute("user", bean);
				//檢查跳轉
				if (requestURI != null && requestURI.length() > 0) {
					System.out.println("跳轉喔");
					if (requestURI.contains("rankTop10")) {

						return "redirect:/rankTop10/rankTopTen.jsp";
					}
					requestURI = requestURI.substring(5, requestURI.length());
					return "redirect:/" + requestURI;

				}
				return "redirect:/personalPage/personalPage.jsp";
			} else {
				//未驗證
				errors.put("loginError", "此帳號未啟用");
				model.addAttribute("userNickname", bean.getMember_nickname());
				return "/login-signUp-upload/login.jsp";
			}

		}
	}
	
	// 註冊
	@RequestMapping(path = "/login-signUp-upload/MemberSignUP.controller")
	public String signUp(Model model, MemberBean signUPBean, String member_passwordConfirm, HttpSession session) {

		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		System.out.println(signUPBean.getMember_password() + "," + member_passwordConfirm);
		if (signUPBean != null) {
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
		if (memberService.checkNicknameExist(signUPBean.getMember_nickname())) {
			errors.put("signUpError", " 暱稱是否重複了呢。");
		}
		if (errors != null && !errors.isEmpty()) {
			model.addAttribute("CssError", "border:1px #880000 solid");
			return "/login-signUp-upload/signUp.jsp";
		}
		signUPBean.setMember_registerTime(new Date());
		signUPBean.setMember_ban(false);
		signUPBean.setMember_profileImage("/roy/image/profile/noProfile.gif");
		signUPBean.setMember_state(0);
		MemberBean signedbean = memberService.signUp(signUPBean);
		if (signedbean == null) {
			errors.put("signUpError", "帳號已存在");
			return "/login-signUp-upload/signUp.jsp";
		} else {
			// 通知已寄信,回到首頁
			new Thread(new JavaEmailTest(signUPBean.getMember_email(), signUPBean.getMember_username(),signUPBean.getMember_password())).start();
			return "redirect:/homePage/index.jsp";
		}
	}
	//第三方登入後填資料
		@RequestMapping(path="/login-signUp-upload/thirdSignUP.controller")
		public String thirdsignUp(Model model,MemberBean bean,String member_username,String member_nickname,HttpSession session,String member_third_id) {
			Map<String, String> errors = new HashMap<>();
			model.addAttribute("thirdSignUp", errors);
			
			bean.setMember_username(member_username);
			bean.setMember_nickname(member_nickname);
		    bean.setMember_third_id(member_third_id);
			bean.setMember_registerTime(new Date());
			bean.setMember_ban(false);
			bean.setMember_profileImage("");
			MemberBean signedbean = memberService.signUp(bean);
			if (signedbean != null) {
			    session.setAttribute("user", bean);
				return"redirect:/personalPage/personalPage.jsp";
			}else {
				errors.put("thirdSignUp", "帳號重複，登入失敗!!");
				return"/login-signUp-upload/login.jsp";
			}
		}
		
	
	//登出	
	@RequestMapping(path="/login-signUp-upload/MemberLogOut.controller")
	public String logOut(Model model,
			HttpSession session) {
		MemberBean bean =null;
		session.setAttribute("user", bean);
		session.setAttribute("requestURI", null);
		return "redirect:/homePage/index.jsp";
	}

	// 更改密碼
	@RequestMapping(path = "/personalPage/change_password")
	public String changePassword(Model model, HttpSession session, String old_password, String new_password,
			String new_passconf) {
		MemberBean bean = (MemberBean) session.getAttribute("user");
		Map<String, String> errors = new HashMap<>();
		if (!bean.getMember_password().equals(old_password)) {
			errors.put("passError", "是不是忘記密碼了呢?");
		}
		if (!new_password.equals(new_passconf)) {
			errors.put("passError", "新密碼不一致?");

		}
		if (!errors.isEmpty()) {
			model.addAttribute("errors", errors);
			return "/personalPage/personalDetail.jsp";
		}

		bean.setMember_password(new_passconf);
		memberService.update(bean);
		model.addAttribute("changePassSucc", "密碼更改成功");
		return "/personalPage/personalDetail.jsp";
	}

	// changeEmail
	@RequestMapping(path = "/personalPage/change_email")
	public String changeEmail(Model model, HttpSession session, String email, String emailconf) {
		MemberBean bean = (MemberBean) session.getAttribute("user");
		Map<String, String> errors = new HashMap<>();
		if (!email.equals(emailconf)) {
			errors.put("passError", "新email不一致?");
		}
		if (!errors.isEmpty()) {
			model.addAttribute("errors", errors);
			return "/personalPage/personalDetail.jsp";
		}

		bean.setMember_email(emailconf);
		memberService.update(bean);
		model.addAttribute("changePassSucc", "Email更改成功");
		return "/personalPage/personalDetail.jsp";
	}

	// changeProfile
	@RequestMapping(path = "/personalPage/change_profile")
	public String changeProfile(Model model, HttpSession session,
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
		return "/personalPage/personalDetail.jsp";
	}

	// 找找有沒有這個帳號
	@RequestMapping(path = "/login-signUp-upload/accountCheck.controller", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String accountCheck(Model model, HttpSession session, String user) {
		System.out.println(user);
		boolean existOrNot = memberService.checkAccountExist(user);
		// 重複-->true
		System.out.println("controller-existOrNot = " + existOrNot);
		String jsonList = "{\"existOrNot\":\"" + existOrNot + "\"}";
		return jsonList;
	}

	// 找找有沒有這個nickname
	@RequestMapping(path = "/login-signUp-upload/nicknameCheck.controller", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String nicknameCheck(Model model, HttpSession session, String nickname) {
		// 找找有沒有這個nickname
		System.out.println(nickname);
		boolean existOrNot = memberService.checkNicknameExist(nickname);
		// 重複-->true
		System.out.println("controller-existOrNot = " + existOrNot);

		String jsonList = "{\"existOrNot\":\"" + existOrNot + "\"}";
		return jsonList;
	}

	// changeDescription
	@RequestMapping(path = "/personalPage/change_description")
	public String changeDescription(Model model, HttpSession session, String description, String emailconf) {
		MemberBean bean = (MemberBean) session.getAttribute("user");
		bean.setMember_description(description.replace("\n", "<br>"));
		memberService.update(bean);
		model.addAttribute("changeDescription", "自介更改成功");
		return "/personalPage/personalDetail.jsp";
	}

	// changeRegion
	@RequestMapping(path = "/personalPage/change_region")
	public String changeRegion(Model model, HttpSession session, String region, String emailconf) {
		System.out.println(region);
		MemberBean bean = (MemberBean) session.getAttribute("user");
		bean.setMember_region(region);
		memberService.update(bean);
		model.addAttribute("changeRegion", "地區更改成功");
		return "/personalPage/personalDetail.jsp";
	}

	// 驗證信連結
	@RequestMapping(path = "/register/acticeAccount")
	public String acticeAccount(Model model, HttpSession session, String userAccount, String userPassword) {
		System.out.println(userAccount);
		System.out.println(userPassword);
		MemberBean bean = memberService.login(userAccount, userAccount);
		bean.setMember_state(1);
		;
		memberService.update(bean);
		session.setAttribute("user", bean);

		return "/personalPage/personalDetail.jsp";
	}
	
	// 再次寄出驗證信
	@RequestMapping(path = "/register/sendMail")
	public String sendMail(Model model, HttpSession session, String userAccount, String userPassword,String userEmail) {
		System.out.println(userAccount);
		System.out.println(userPassword);
		System.out.println(userEmail);
		MemberBean bean = memberService.login(userAccount, userAccount);
		bean.setMember_email(userEmail);
		memberService.update(bean);
		new Thread(new JavaEmailTest(userEmail, userAccount,userPassword)).start();
		return "redirect:/homePage/index.jsp";
	}
	// 再次寄出Password
	@RequestMapping(path = "/register/sendPass")
	public String sendPass(Model model, HttpSession session, String userAccount) {
		System.out.println("/register/sendPass------->帳號:"+userAccount);
		MemberBean bean = memberService.HiMethod(userAccount);
		if(bean==null) {
			//這個帳號沒註冊過
			model.addAttribute("sendPass", "noThisAccount");
			return "/login-signUp-upload/login.jsp";
		}
		//帳號有註冊
		String userEmail = bean.getMember_email();
		String userPassword = UUIDGenerator.getUUID().substring(0, 25);
		System.out.println("/register/sendPass------->新密碼 : "+userPassword);
		bean.setMember_password(userPassword);
		memberService.update(bean);
		new Thread(new JavaEmailPass(userEmail, userAccount,userPassword)).start();
		return "redirect:/homePage/index.jsp";
	}
}
