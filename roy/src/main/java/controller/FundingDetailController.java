package controller;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.bean.FundingBean;
import model.bean.MemberBean;
import model.bean.RewardBean;
import model.service.BackerService;
import model.service.FundingService;
import model.service.RewardService;

@Controller
public class FundingDetailController {
	@Autowired
	private RewardService rewardService;
	@Autowired
	private FundingService fundingService;
	@Autowired
	private BackerService backerService;

//點擊預覽小卡跳轉到詳細頁面
	@RequestMapping("/funding/detail.controller")
	public String findDetailByFindingId(String nickname, String day, String funding_id, Model model,
			HttpSession session) {

		String username = null;
		try {
			MemberBean memberBean = (MemberBean) session.getAttribute("user");
			if (memberBean != null) {
				username = memberBean.getMember_username();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (funding_id != null) {
			Integer funding_Id = Integer.valueOf(funding_id);
			Integer donateCount_funding = backerService.listBackerBeanByFunding_id(funding_Id).size();
			BigDecimal sumDonater = rewardService.sumDonater(funding_Id);
			List<RewardBean> rewardBeans = rewardService.findRewardByFunding_id(funding_Id);
			FundingBean fundingBean = fundingService.findFundingById(funding_Id);
			Integer oldBrowseCount = fundingBean.getFunding_browseCount();// 原本的瀏覽次數
			fundingBean.setFunding_browseCount(oldBrowseCount + 1);// 瀏覽次數+1
			fundingService.update(fundingBean);// 更新瀏覽次數
			Double current = Double.valueOf(fundingBean.getFunding_currentAmount());
			Double goal = Double.valueOf(fundingBean.getFunding_goal());
			String percent = String.valueOf(current / goal * 100);
			model.addAttribute("sumDonater", sumDonater);
			model.addAttribute("selfusername", username);
			model.addAttribute("percent", percent);
			model.addAttribute("day", day);
			model.addAttribute("nickname", nickname);
			model.addAttribute("reward", rewardBeans);
			model.addAttribute("funding", fundingBean);
			return "/funding/fundingDetail.jsp";
		}

		return "/homePage/index.jsp";
	}

}
