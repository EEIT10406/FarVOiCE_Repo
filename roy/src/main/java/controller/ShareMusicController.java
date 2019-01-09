package controller;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.bean.MemberBean;
import model.bean.PostBean;
import model.service.ShareMusicService;

@Controller
public class ShareMusicController {
	
	@Autowired
	private ShareMusicService shareMusicService;
	
	@RequestMapping(path= {"/rankTop10/ShareMusic.controller"})
	public String method(
			@RequestParam(value="shareContent")String shareContent,
											   Model model,
											   PostBean shareMusicbean,
											   HttpSession session) {
//		接收資料
//		System.out.println(shareContent);
		
//		驗證資料
		Map<String,String> errors = new HashMap<>();
		model.addAttribute("errors",errors);
		
		if(shareContent==null ||shareContent.trim().length()==0 ) {
			errors.put("shareContentError", "不能為空值");
		}
		else{
			
			//取的發文者的username，設定發文者username
			MemberBean memberWhoPost = (MemberBean)session.getAttribute("user");
			shareMusicbean.setMember_username(memberWhoPost.getMember_username());
			//塞進使用者分享內容
			shareMusicbean.setPost_content(shareContent);
			//新增當時日期
			java.util.Date date = new java.util.Date();
			shareMusicbean.setPost_time(date);
			
			
			//設定隱私是否公開
			shareMusicbean.setPost_privacy(false);
			//設定是share
			shareMusicbean.setPost_postorshare(false);
			

		}
		
		
		//呼叫model
		PostBean bean = shareMusicService.insertShareMessage(shareMusicbean);
		System.out.println("shareMusicController的呼叫model後"+bean);
		//呼叫view
		if(bean == null) {	
			return "/homePage/index.jsp";
		}else{
			model.addAttribute("insert", bean);
			return "/rankTop10/rankTopTen.jsp";
			
		}
	
	}

}
