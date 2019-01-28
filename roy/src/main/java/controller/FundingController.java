package controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONValue;
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
import model.service.MemberService;
import model.service.MusicService;
import model.service.RewardService;

@Controller
public class FundingController {

	@Autowired
	private FundingService fundingService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private MusicService musicService;
	@Autowired
	private RewardService rewardService;

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
		String nickname = memberBean.getMember_nickname();
		Date date = new Date();
		bean.setFunding_browseCount(0);
		bean.setFunding_currentAmount(0);
		bean.setMember_username(username);
		bean.setMember_nickname(nickname);
		bean.setFunding_image(imagepath);
		bean.setFunding_createTime(date);
		bean.setFunding_status(false);

		System.out.println(bean);
		FundingBean createBean = fundingService.insert(bean);
		Integer rewardCount = rewardService.rewardCount(createBean.getFunding_id());
		model.addAttribute("rewardCount", rewardCount);
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
	public String editFundingContent(String editFunding, String oImage, String funding_id, Model model,
			FundingBean bean, @RequestParam("imageFile") MultipartFile imagefile) {
		String imagepath = "";
		Integer oldFunding_id = Integer.valueOf(funding_id);
		FundingBean editBean = fundingService.findFundingById(oldFunding_id);
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
				bean.setMember_nickname(editBean.getMember_nickname());
				bean.setFunding_browseCount(editBean.getFunding_browseCount());
				bean.setFunding_currentAmount(editBean.getFunding_currentAmount());
				bean.setFunding_id(editBean.getFunding_id());
				bean.setMember_username(editBean.getMember_username());
				bean.setFunding_createTime(editBean.getFunding_createTime());
				bean.setFunding_image(imagepath);
				bean.setFunding_status(editBean.getFunding_status());
				FundingBean updateFundingBean = fundingService.update(bean);
				List<MusicBean> musicbeans = musicService.findMusicByUser(editBean.getMember_username());
				model.addAttribute("musicName", musicbeans);
				model.addAttribute("fundingBean", updateFundingBean);

				return "editFuding.jsp";
				// 如果沒修改圖片
			} else {
				bean.setMember_nickname(editBean.getMember_nickname());
				bean.setFunding_browseCount(editBean.getFunding_browseCount());
				bean.setFunding_currentAmount(editBean.getFunding_currentAmount());
				bean.setFunding_id(editBean.getFunding_id());
				bean.setMember_username(editBean.getMember_username());
				bean.setFunding_createTime(editBean.getFunding_createTime());
				bean.setFunding_status(editBean.getFunding_status());
				bean.setFunding_image(oImage);
				FundingBean updateFundingBean = fundingService.update(bean);
				List<MusicBean> musicbeans = musicService.findMusicByUser(editBean.getMember_username());
				model.addAttribute("musicName", musicbeans);
				model.addAttribute("fundingBean", updateFundingBean);
				return "editFuding.jsp";
			}
		}
//點擊回饋設定
		if ("回饋設定".equals(editFunding)) {
			// 如果有修改圖片
			if (!imagefile.isEmpty()) {

				try {
					byte[] imagebyte = imagefile.getBytes();
					imagepath = fundingService.imageFilePath(imagebyte);
				} catch (IOException e) {
					e.printStackTrace();
				}
				bean.setMember_nickname(editBean.getMember_nickname());
				bean.setFunding_browseCount(editBean.getFunding_browseCount());
				bean.setFunding_currentAmount(editBean.getFunding_currentAmount());
				bean.setFunding_id(editBean.getFunding_id());
				bean.setMember_username(editBean.getMember_username());
				bean.setFunding_createTime(editBean.getFunding_createTime());
				bean.setFunding_image(imagepath);
				bean.setFunding_status(editBean.getFunding_status());
				FundingBean updateFundingBean = fundingService.update(bean);
				List<MusicBean> musicbeans = musicService.findMusicByUser(editBean.getMember_username());
				Integer rewardCount = rewardService.rewardCount(bean.getFunding_id());
				model.addAttribute("rewardCount", rewardCount);
				model.addAttribute("musicName", musicbeans);
				model.addAttribute("fundingBean", updateFundingBean);

				return "reward.jsp";
				// 如果沒修改圖片
			} else {
				bean.setMember_nickname(editBean.getMember_nickname());
				bean.setFunding_browseCount(editBean.getFunding_browseCount());
				bean.setFunding_currentAmount(editBean.getFunding_currentAmount());
				bean.setFunding_id(editBean.getFunding_id());
				bean.setMember_username(editBean.getMember_username());
				bean.setFunding_createTime(editBean.getFunding_createTime());
				bean.setFunding_status(editBean.getFunding_status());
				bean.setFunding_image(oImage);
				FundingBean updateFundingBean = fundingService.update(bean);
				List<MusicBean> musicbeans = musicService.findMusicByUser(editBean.getMember_username());
				Integer rewardCount = rewardService.rewardCount(bean.getFunding_id());
				model.addAttribute("rewardCount", rewardCount);
				model.addAttribute("musicName", musicbeans);
				model.addAttribute("fundingBean", updateFundingBean);
				return "reward.jsp";
			}
		}

		return "editFuding.jsp";
	}

//找出所有專案
	@RequestMapping(value = "/funding/allFundingProject.controller", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String allFundingProject() {
//		回傳所有專案
		List<FundingBean> fundingBeans = fundingService.allProject();
		List<Map<String, String>> fundings = new LinkedList<Map<String, String>>();
		for (FundingBean bean : fundingBeans) {
			Map<String, String> jsonMap = new HashMap<>();
			jsonMap.put("funding_title", bean.getFunding_title());
			jsonMap.put("funding_image", bean.getFunding_image());
			jsonMap.put("member_username", bean.getMember_username());
			jsonMap.put("nick_name", "" + bean.getMember_nickname());
			jsonMap.put("funding_description", bean.getFunding_description());
			jsonMap.put("funding_currentAmount", "" + bean.getFunding_currentAmount());
			jsonMap.put("funding_goal", "" + bean.getFunding_goal());
			jsonMap.put("funding_duration", "" + bean.getFunding_duration());
			jsonMap.put("funding_id", "" + bean.getFunding_id());
			jsonMap.put("funding_createTime", "" + bean.getFunding_createTime());
			jsonMap.put("funding_browseCount", "" + bean.getFunding_browseCount());
			jsonMap.put("funding_status", "" + bean.getFunding_status());
			fundings.add(jsonMap);
		}

		return JSONValue.toJSONString(fundings);
	}

//找出審核通過的專案
	@RequestMapping(value = "/funding/findAllByPass.controller", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String findAllByPass() {
//		回傳所有專案
		List<FundingBean> fundingBeans = fundingService.findAllByPass();
		List<Map<String, String>> fundings = new LinkedList<Map<String, String>>();
		for (FundingBean bean : fundingBeans) {
			Map<String, String> jsonMap = new HashMap<>();
			jsonMap.put("funding_title", bean.getFunding_title());
			jsonMap.put("funding_image", bean.getFunding_image());
			jsonMap.put("member_username", bean.getMember_username());
			jsonMap.put("nick_name", bean.getMember_nickname());
			jsonMap.put("funding_description", bean.getFunding_description());
			jsonMap.put("funding_currentAmount", "" + bean.getFunding_currentAmount());
			jsonMap.put("funding_goal", "" + bean.getFunding_goal());
			jsonMap.put("funding_duration", "" + bean.getFunding_duration());
			jsonMap.put("funding_id", "" + bean.getFunding_id());
			jsonMap.put("funding_createTime", "" + bean.getFunding_createTime());
			jsonMap.put("funding_browseCount", "" + bean.getFunding_browseCount());
			fundings.add(jsonMap);
		}

		return JSONValue.toJSONString(fundings);
	}

//	根據username抓出所有專案
	@RequestMapping(value = "/personalPage/findProjectByUsername", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String findProjectByUsername(String username) {

		List<FundingBean> fundingBeans = fundingService.findByUsername(username);
		System.out.println(fundingBeans);

		List<Map<String, String>> fundings = new LinkedList<Map<String, String>>();
		for (FundingBean bean : fundingBeans) {
			Map<String, String> jsonMap = new HashMap<>();
			jsonMap.put("funding_title", bean.getFunding_title());
			jsonMap.put("funding_image", bean.getFunding_image());
			jsonMap.put("member_username", bean.getMember_username());
			jsonMap.put("nick_name", "" + bean.getMember_nickname());
			jsonMap.put("funding_description", bean.getFunding_description());
			jsonMap.put("funding_currentAmount", "" + bean.getFunding_currentAmount());
			jsonMap.put("funding_goal", "" + bean.getFunding_goal());
			jsonMap.put("funding_duration", "" + bean.getFunding_duration());
			jsonMap.put("funding_id", "" + bean.getFunding_id());
			jsonMap.put("funding_createTime", "" + bean.getFunding_createTime());
			jsonMap.put("funding_browseCount", "" + bean.getFunding_browseCount());
			fundings.add(jsonMap);

		}
		return JSONValue.toJSONString(fundings);
	}

	// 找出該使用者通過審核的專案
	@RequestMapping(value = "/personalPage/findProjectByUsernamePass", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String findProjectByUsernamePass(String username) {

		List<FundingBean> fundingBeans = fundingService.findProjectByUsernamePass(username);
		System.out.println(fundingBeans);

		List<Map<String, String>> fundings = new LinkedList<Map<String, String>>();
		for (FundingBean bean : fundingBeans) {
			Map<String, String> jsonMap = new HashMap<>();
			jsonMap.put("funding_title", bean.getFunding_title());
			jsonMap.put("funding_image", bean.getFunding_image());
			jsonMap.put("member_username", bean.getMember_username());
			jsonMap.put("nick_name", "" + bean.getMember_nickname());
			jsonMap.put("funding_description", bean.getFunding_description());
			jsonMap.put("funding_currentAmount", "" + bean.getFunding_currentAmount());
			jsonMap.put("funding_goal", "" + bean.getFunding_goal());
			jsonMap.put("funding_duration", "" + bean.getFunding_duration());
			jsonMap.put("funding_id", "" + bean.getFunding_id());
			jsonMap.put("funding_createTime", "" + bean.getFunding_createTime());
			jsonMap.put("funding_browseCount", "" + bean.getFunding_browseCount());
			fundings.add(jsonMap);

		}
		return JSONValue.toJSONString(fundings);
	}

//找出審核通過並以募資金額做排序的熱門專案
	@RequestMapping(value = "/funding/findByPassOrderByMoney.controller", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String findByPassOrderByMoney() {
//		回傳所有專案
		List<FundingBean> fundingBeans = fundingService.findAllByPass();
		List<Map<String, String>> fundings = new LinkedList<Map<String, String>>();
		for (FundingBean bean : fundingBeans) {
			Map<String, String> jsonMap = new HashMap<>();
			jsonMap.put("funding_title", bean.getFunding_title());
			jsonMap.put("funding_image", bean.getFunding_image());
			jsonMap.put("member_username", bean.getMember_username());
			jsonMap.put("nick_name", bean.getMember_nickname());
			jsonMap.put("funding_description", bean.getFunding_description());
			jsonMap.put("funding_currentAmount", "" + bean.getFunding_currentAmount());
			jsonMap.put("funding_goal", "" + bean.getFunding_goal());
			jsonMap.put("funding_duration", "" + bean.getFunding_duration());
			jsonMap.put("funding_id", "" + bean.getFunding_id());
			jsonMap.put("funding_createTime", "" + bean.getFunding_createTime());
			jsonMap.put("funding_browseCount", "" + bean.getFunding_browseCount());
			fundings.add(jsonMap);
		}

		return JSONValue.toJSONString(fundings);
	}

//審核提案
	@RequestMapping(path = "/back/passCurrentFunding.controller")
	public void edit(Integer funding_id) {
		FundingBean bean = fundingService.findFundingById(funding_id);
		bean.setFunding_status(true);
		fundingService.update(bean);
	}

}
