package controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.bean.FundingBean;
import model.bean.MemberBean;
import model.bean.MusicBean;
import model.service.FundingService;
import model.service.MusicService;

@Controller
public class FundingController {

	@Autowired
	private FundingService fundingService;
	@Autowired
	private MusicService musicService;
//創建專案

//		public String method(String funding_title, String funding_description, Integer funding_goal,
//				String funding_styleName, String funding_city, Model model) {
//創建募資專案+上傳圖片
	@RequestMapping("/funding/funding.controller")
	public String createProject(FundingBean bean, Model model, HttpSession session,
			@RequestParam("imageFile") MultipartFile imagefile) {
		String imagepath = "";
		if (!imagefile.isEmpty()) {

			try {
				byte[] imagebyte = imagefile.getBytes();
				imagepath = fundingService.imageFilePath(imagebyte);
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		MemberBean memberBean = (MemberBean) session.getAttribute("user");
		String username = memberBean.getMember_username();
		Date date = new Date();
		bean.setMember_username(username);
		bean.setFunding_image(imagepath);
		bean.setFunding_createTime(date);

		System.out.println(bean);
		FundingBean createBean = fundingService.insert(bean);

		model.addAttribute("fundingBean", createBean);
		return "/funding/reward.jsp";

	}

//使用者上傳的音樂
	@RequestMapping("/funding/showMusic.controller")
	public String findMusicByName(Model model, HttpSession session) {
		MemberBean memberBean = (MemberBean) session.getAttribute("user");
		String username = memberBean.getMember_username();
		List<MusicBean> musicbeans = fundingService.findMusicByUser(username);
		model.addAttribute("musicName", musicbeans);
		return "startProject.jsp";
	}

}
