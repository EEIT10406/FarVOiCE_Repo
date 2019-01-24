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
			@RequestParam(value="isprivacy")boolean isprivacy,
			@RequestParam(value="shareMusicid",required = false)Integer musicId,
			@RequestParam(value="shareMusicname",required = false)String musicName,
			@RequestParam(value="shareMusicimg",required = false)String shareMusicimg,
											   Model model,
											   PostBean shareMusicbean,
											   HttpSession session) {
//		接收資料
//		System.out.println(shareContent);
//		System.out.println("isprivacy===========>"+isprivacy);
//		System.out.println("addshareMusicid===========>"+musicId);
		
		
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
			shareMusicbean.setPost_privacy(isprivacy);
			//設定是share
			shareMusicbean.setPost_postorshare(false);
			shareMusicbean.setPost_musicid(musicId);
			shareMusicbean.setPost_musicname(musicName);
			//設定圖檔
			shareMusicbean.setPost_musicImage(shareMusicimg);

		}	
		//呼叫model
		PostBean bean = shareMusicService.insertShareMessage(shareMusicbean);
		System.out.println("shareMusicController的呼叫model後"+bean);
		//呼叫view
		if(bean == null) {	
			return "/homePage/index.jsp";
		}else{
			model.addAttribute("insert", bean);
			return "/personalPage/personalPage.jsp";
			
		}
	
	}
	
	@RequestMapping(path= {"/personalPage/ShareMusic.controller"})
	public String method1(
			@RequestParam(value="shareContent")String shareContent,
			@RequestParam(value="isprivacy")boolean isprivacy,
			@RequestParam(value="shareMusicid",required = false)Integer musicId,
			@RequestParam(value="shareMusicname",required = false)String musicName,
			@RequestParam(value="shareMusicimg",required = false)String shareMusicimg,
											   Model model,
											   PostBean shareMusicbean,
											   HttpSession session) {
		
		System.out.println("222addshareMusicimg===========>"+shareMusicimg);
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
			shareMusicbean.setPost_privacy(isprivacy);
			//設定是share
			shareMusicbean.setPost_postorshare(false);
			shareMusicbean.setPost_musicid(musicId);
			shareMusicbean.setPost_musicname(musicName);
			//設定圖檔
			shareMusicbean.setPost_musicImage(shareMusicimg);


		}	
		//呼叫model
		PostBean bean = shareMusicService.insertShareMessage(shareMusicbean);
		System.out.println("shareMusicController的呼叫model後"+bean);
		//呼叫view
		if(bean == null) {	
			return "/homePage/index.jsp";
		}else{
			model.addAttribute("insert", bean);
			return "/personalPage/personalPage.jsp";
			
		}
	
	}
	
	

}
