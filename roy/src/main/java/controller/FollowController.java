package controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.bean.FollowBean;
import model.bean.MemberBean;
import model.bean.primarykey.FollowId;
import model.service.FollowService;
import model.service.MemberService;

@Controller
public class FollowController {
	@Autowired
	FollowService followService;
	@Autowired
	MemberService memberService;
	// 追蹤or退追蹤
	@RequestMapping(path = "personalPage/somebodyPersonalPageFollow.controller")
	public String method(Model model, String somebody, HttpSession session) {
		System.out.println(somebody);
		MemberBean memberWhoS = (MemberBean) session.getAttribute("user");
		if (memberWhoS != null) {
			followService.followORCancelFollow(memberWhoS, somebody);
			return "/personalPage/somebodyPersonalPage.jsp";
		}
		return "/personalPage/somebodyPersonalPage.jsp";

	}

	// 檢查有無追蹤
	@RequestMapping(path = "personalPage/somebodyPersonalPageCheckFollow.controller")
	@ResponseBody
	public String method1(Model model, HttpSession session) {
		String somebody = (String) session.getAttribute("somebody");
		MemberBean memberWhoS = (MemberBean) session.getAttribute("user");
		if (memberWhoS != null) {
			if (followService.checkFollowOrNot(memberWhoS, somebody)) {
				return "true";
			} else {
				return "false";
			}
		}
		return "false";
	}

	// 幾個follow 我
	@RequestMapping(path = "personalPage/howMuchFollowMe.controller", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String howMuchFollowMe(Model model, HttpSession session, String username) {
		System.out.println("幾個follow 我" + username);

		return String.valueOf(followService.howMuchFollowMe(username));
	}

	// 我follow 幾個
	@RequestMapping(path = "personalPage/iFollowHowMuch.controller", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String iFollowHowMuch(Model model, HttpSession session, String username) {
		System.out.println("我follow 幾個" + username);
		return String.valueOf(followService.iFollowHowMuch(username));
	}

	// 我follow誰
	@RequestMapping(path = "personalPage/iFollowWho.controller", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String iFollowWho(Model model, HttpSession session, String username) {
		System.out.println("我follow 誰" + username);
		List<FollowBean> stars = followService.iFollowWho(username);
		if (stars!=null) {
		System.out.println(stars);
		//帳號改成暱稱
		Iterator<FollowBean> newStars =  stars.iterator();
		
			while (newStars.hasNext()) {
				FollowBean temp = newStars.next();
				FollowId followId = temp.getId();
				followId.setMember_usernameM(memberService.usernameToNickname(followId.getMember_usernameM()));
			}
			Gson gson = new Gson();
			String jsonString = gson.toJson(stars);
			return jsonString;
		}
		return "{}";
	}
	
	// 誰follow我
	@RequestMapping(path = "personalPage/whoFollowMe.controller", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String whoFollowMe(Model model, HttpSession session, String username) {
		System.out.println("我follow 誰" + username);
		List<FollowBean> stars = followService.whoFollowMe(username);
		System.out.println(stars);
		//帳號改成暱稱
		Iterator<FollowBean> newStars =  stars.iterator();
		while(newStars.hasNext()) {
			FollowBean temp = newStars.next();
			FollowId followId = temp.getId();
			followId.setMember_usernameS(memberService.usernameToNickname(followId.getMember_usernameS()));
		}
		Gson gson = new Gson();
		String jsonString = gson.toJson(stars);
		return jsonString;
	}
}
