package controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
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

import model.bean.FundingBean;
import model.bean.MemberBean;
import model.bean.MusicBean;
import model.service.FundingService;

@Controller
public class FundingController {

	@Autowired
	private FundingService fundingService;
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
		bean.setFunding_browseCount(0);
		bean.setFunding_currentAmount(0);
		bean.setMember_username(username);
		bean.setFunding_image(imagepath);
		bean.setFunding_createTime(date);

		System.out.println(bean);
		FundingBean createBean = fundingService.insert(bean);

		model.addAttribute("fundingBean", createBean);
		return "/funding/reward.jsp";

	}

//使用者上傳的音樂+放入提案人暱稱
	@RequestMapping("/funding/showMusic.controller")
	public String findMusicByName(Model model, HttpSession session) {
		MemberBean memberBean = (MemberBean) session.getAttribute("user");
		String username = memberBean.getMember_username();
		String nickname = memberBean.getMember_nickname();
		List<MusicBean> musicbeans = fundingService.findMusicByUser(username);
		model.addAttribute("musicName", musicbeans);
		model.addAttribute("username", username);
		model.addAttribute("nickname", nickname);
		return "startProject.jsp";
	}

//編輯更新專案內容+保存修改並前往編輯回饋頁面-創建時上一步版本
	@RequestMapping("/funding/editFundingContent.controller")
	public String editFundingContent(String editFunding, HttpSession session, String oImage, Model model,
			FundingBean bean, @RequestParam("imageFile") MultipartFile imagefile) {
		String imagepath = "";
		FundingBean editBean = (FundingBean) session.getAttribute("fundingBean");
//點擊保存修改
		if ("儲存修改".equals(editFunding)) {
			// 如果有修改圖片
			if (!imagefile.isEmpty()) {

				try {
					byte[] imagebyte = imagefile.getBytes();
					imagepath = fundingService.imageFilePath(imagebyte);
				} catch (IOException e) {
					e.printStackTrace();
				}
				bean.setFunding_browseCount(editBean.getFunding_browseCount());
				bean.setFunding_currentAmount(editBean.getFunding_currentAmount());
				bean.setFunding_id(editBean.getFunding_id());
				bean.setMember_username(editBean.getMember_username());
				bean.setFunding_createTime(editBean.getFunding_createTime());
				bean.setFunding_image(imagepath);
				FundingBean updateFundingBean = fundingService.update(bean);
				model.addAttribute("fundingBean", updateFundingBean);

				return "editFuding.jsp";
				// 如果沒修改圖片
			} else {
				bean.setFunding_browseCount(editBean.getFunding_browseCount());
				bean.setFunding_currentAmount(editBean.getFunding_currentAmount());
				bean.setFunding_id(editBean.getFunding_id());
				bean.setMember_username(editBean.getMember_username());
				bean.setFunding_createTime(editBean.getFunding_createTime());
				bean.setFunding_image(oImage);
				System.out.println(bean);
				FundingBean updateFundingBean = fundingService.update(bean);
				model.addAttribute("fundingBean", updateFundingBean);
				return "editFuding.jsp";
			}
		}
//點擊回饋設定
		if ("回饋設定".equals(editFunding)) {

			if (!imagefile.isEmpty()) {

				try {
					byte[] imagebyte = imagefile.getBytes();
					imagepath = fundingService.imageFilePath(imagebyte);
				} catch (IOException e) {
					e.printStackTrace();
				}
				bean.setFunding_browseCount(editBean.getFunding_browseCount());
				bean.setFunding_currentAmount(editBean.getFunding_currentAmount());
				bean.setFunding_id(editBean.getFunding_id());
				bean.setMember_username(editBean.getMember_username());
				bean.setFunding_createTime(editBean.getFunding_createTime());
				bean.setFunding_image(imagepath);
				FundingBean updateFundingBean = fundingService.update(bean);
				model.addAttribute("fundingBean", updateFundingBean);

				return "reward.jsp";
				// 如果沒修改圖片
			} else {
				bean.setFunding_browseCount(editBean.getFunding_browseCount());
				bean.setFunding_currentAmount(editBean.getFunding_currentAmount());
				bean.setFunding_id(editBean.getFunding_id());
				bean.setMember_username(editBean.getMember_username());
				bean.setFunding_createTime(editBean.getFunding_createTime());
				bean.setFunding_image(oImage);
				FundingBean updateFundingBean = fundingService.update(bean);
				model.addAttribute("fundingBean", updateFundingBean);
				return "reward.jsp";
			}
		}

		return "editFuding.jsp";
	}

//找出所有專案
	@RequestMapping(value = "/funding/allFundingProject.controller")
	@ResponseBody
	public List<FundingBean> allFundingProject() {
		List<FundingBean> fundingBeans = fundingService.allProject();
		return fundingBeans;
	}
}
