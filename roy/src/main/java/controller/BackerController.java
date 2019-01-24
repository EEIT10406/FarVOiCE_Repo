package controller;


import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.bean.BackerBean;
import model.bean.FundingBean;
import model.bean.MemberBean;
import model.bean.RewardBean;
import model.service.BackerService;
import model.service.FundingService;
import model.service.RewardService;

@Controller
public class BackerController {
	@Autowired
	private FundingService fundingService;
	@Autowired
	private RewardService rewardService;
	@Autowired
	private BackerService backerService;

//點選回饋小卡前往捐贈頁面
	@RequestMapping("**/turnToDonatePage.controller")
	public String turnToDonatePage(HttpSession session, Model model, String reward_id, String funding_id,
			String funding_title, String nickname, Integer sup_money) {
		System.out.println(reward_id);
		Integer select_reward_id = Integer.valueOf(reward_id);
		Integer donate_funding_id = Integer.valueOf(funding_id);

		if (sup_money == null) {
			sup_money = 0;
		}

		Integer ex_sup_money = Integer.valueOf(sup_money);
		MemberBean memberBean = (MemberBean) session.getAttribute("user");
		RewardBean rewardBean = rewardService.findRewardByReward_id(select_reward_id);
		FundingBean fundingBean = fundingService.findFundingById(donate_funding_id);
//		 該回饋設定有多少贊助者
		Integer donateCount = backerService.listBackerBeanByReward_id(select_reward_id).size();
		Integer total_sup = ex_sup_money + rewardBean.getReward_amount();
//		
//		
		model.addAttribute("memberBean", memberBean);
		model.addAttribute("total_sup", total_sup);
		model.addAttribute("fundingBean", fundingBean);
		model.addAttribute("rewardBean", rewardBean);
		model.addAttribute("nickname", nickname);
		model.addAttribute("donateCount", donateCount);
		return "backer.jsp";
	}

//新增一筆贊助
	@RequestMapping("**/createBack.controller")
	public String createBack(BackerBean bean,Model model) {
		
		Date date=new Date();
		bean.setBack_status(false);
		bean.setBacker_time(date);
		
		BackerBean newDonateBean=backerService.create(bean);
		
		if(newDonateBean!=null) {
			model.addAttribute("newDonateBean", newDonateBean);
			model.addAttribute("result", "贊助成功 再看看其他專案吧!");
		}else {
			
			model.addAttribute("result", "贊助失敗 請稍後重試");
			
		}
		
		
		return "allFunding.jsp";
	}
}
