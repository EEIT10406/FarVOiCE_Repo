package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.bean.MemberBean;
import model.service.MemberService;
import model.service.MusicService;

@Controller
public class SomebodyPersonalPageController {
	@Autowired
	MemberService memberService; 
	@Autowired
	MusicService musicService;
	@RequestMapping(path="/personalPage/somebodyPersonalPage.controller")
	public String method(Model model,String nickname,HttpSession session) {
		//進別人的首頁
		
		String somebody = musicService.nicenameToUsername(nickname);
		
		MemberBean userBean = (MemberBean)session.getAttribute("user");
		//如果已登入且則進自己個人首頁
		if(userBean!=null) {
			if(userBean.getMember_username().equals(somebody)) {
				return "/personalPage/personalPage.jsp";
			}
		}
		MemberBean somebodyBean = memberService.getMemberBeanForSomebodyPersonalPage(somebody);
		session.setAttribute("somebody", somebody);
		session.setAttribute("nickname", nickname);
		session.setAttribute("somebodyImgPath", somebodyBean.getMember_profileImage());
		session.setAttribute("somebodyRegion", somebodyBean.getMember_region());
		session.setAttribute("somebodyDescription", somebodyBean.getMember_description());
		return "/personalPage/somebodyPersonalPage.jsp";
		
	}
}
