package controller;

import java.io.IOException;
import java.math.BigDecimal;
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
import model.bean.RewardBean;
import model.service.BackerService;
import model.service.FundingService;
import model.service.MemberService;
import model.service.MusicService;
import model.service.RewardService;

@Controller
public class RewardController {
	@Autowired
	private FundingService fundingService;
	@Autowired
	private RewardService rewardService;
	@Autowired
	private MusicService musicService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private BackerService backerService;

//創一筆回饋
	@RequestMapping("/funding/reward.controller")
	public String creatRewardModel(FundingBean createBean, String reward, Model model, RewardBean bean,
			@RequestParam("imageFile") MultipartFile imagefile) {
		String imagepath = "";
		System.out.println(reward);
		if (!imagefile.isEmpty()) {
			try {
				byte[] imagebyte = imagefile.getBytes();
				imagepath = fundingService.imageFilePath(imagebyte);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		bean.setReward_image(imagepath);
		bean.setReward_donateCount(0);

//		上一步修改專案
		if ("編輯專案內容".equals(reward)) {
			FundingBean editBean = fundingService.findFundingById(bean.getFunding_id());// 找此筆專案內容
			List<MusicBean> musicbeans = musicService.findMusicByUser(editBean.getMember_username());
			model.addAttribute("fundingBean", editBean);
			model.addAttribute("musicName", musicbeans);
			return "editFuding.jsp";
		}
//		繼續新增回饋
		if ("新增一個回饋".equals(reward)) {
			RewardBean createRewardBean = rewardService.insert(bean);
			Integer rewardCount = rewardService.rewardCount(createRewardBean.getFunding_id());
			model.addAttribute("rewardCount", rewardCount);
			model.addAttribute("rewardBean", createRewardBean);
			return "reward.jsp";
		}
//		結束提交專案
		if ("提交專案".equals(reward)) {

			return "/personalPage/personalProject.jsp";
		}

		return "";
	}

	// 個人創一筆回饋
	@RequestMapping("/funding/addReward.controller")
	public String addReward(HttpSession session, FundingBean createBean, String reward, Model model, RewardBean bean,
			String funding_id, @RequestParam("imageFile") MultipartFile imagefile) {
		String imagepath = "";
		System.out.println(reward);
		Integer editFunding_id = Integer.valueOf(funding_id);

		if (!imagefile.isEmpty()) {
			try {
				byte[] imagebyte = imagefile.getBytes();
				imagepath = fundingService.imageFilePath(imagebyte);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		bean.setReward_image(imagepath);
		bean.setReward_donateCount(0);

		// 繼續新增回饋
		if ("新增一個回饋".equals(reward)) {
			RewardBean createRewardBean = rewardService.insert(bean);
			Integer rewardCount = rewardService.rewardCount(editFunding_id);
			System.out.println(rewardCount);
			model.addAttribute("rewardCount", rewardCount);
			model.addAttribute("rewardBean", createRewardBean);
			model.addAttribute("funding_id", funding_id);
			return "addReward.jsp";
		}
		if ("返回專案".equals(reward)) {
			String username = null;
			try {
				MemberBean memberBean = (MemberBean) session.getAttribute("user");
				if (memberBean != null) {
					username = memberBean.getMember_username();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println(funding_id);
			if (funding_id != null) {
				Integer funding_Id = Integer.valueOf(funding_id);
				BigDecimal sumDonater = rewardService.sumDonater(funding_Id);
				List<MemberBean> donateMemberBeans = backerService.donateHistory(funding_Id);
				List<RewardBean> rewardBeans = rewardService.findRewardByFunding_id(funding_Id);
				FundingBean fundingBean = fundingService.findFundingById(funding_Id);
				Integer oldBrowseCount = fundingBean.getFunding_browseCount();// 原本的瀏覽次數
				MusicBean musicBean = musicService.findMusic(fundingBean.getMusic_id());
				MemberBean createPjtBean = memberService
						.getMemberBeanForSomebodyPersonalPage(fundingBean.getMember_username());
				Integer createCount = fundingService.findProjectByUsernamePass(fundingBean.getMember_username()).size();// 抓出提案人提案總數

				Integer donateCount = backerService.userdonateHistory(fundingBean.getMember_username()).size();// 抓出提案人贊助總數
				fundingBean.setFunding_browseCount(oldBrowseCount + 1);// 瀏覽次數+1
				fundingService.update(fundingBean);// 更新瀏覽次數
				Double current = Double.valueOf(fundingBean.getFunding_currentAmount());
				Double goal = Double.valueOf(fundingBean.getFunding_goal());
				Double susses = current / goal * 100;
				String percent = String.valueOf(current / goal * 100);
				model.addAttribute("donateCount", donateCount);
				model.addAttribute("createCount", createCount);
				model.addAttribute("createPjtBean", createPjtBean);
				model.addAttribute("musicBean", musicBean);
				model.addAttribute("donateMemberBeans", donateMemberBeans);
				model.addAttribute("susses", susses);
				model.addAttribute("sumDonater", sumDonater);
				model.addAttribute("selfusername", username);
				model.addAttribute("percent", percent);
				model.addAttribute("reward", rewardBeans);
				model.addAttribute("funding", fundingBean);
				return "/funding/fundingDetail.jsp";
			}

		}

		return "/homePage/index.jsp";
	}

	// 新增個人回饋
	@RequestMapping("/funding/toAddRewardPage.controller")
	public String toAddRewardPage(Model model, String funding_id) {
		if (funding_id != null) {
			Integer editFunding_id = Integer.valueOf(funding_id);
			Integer rewardCount = rewardService.rewardCount(editFunding_id);
			model.addAttribute("rewardCount", rewardCount);
			model.addAttribute("funding_id", funding_id);

			return "addReward.jsp";
		}

		return "/homePage/index.jsp";
	}
}
