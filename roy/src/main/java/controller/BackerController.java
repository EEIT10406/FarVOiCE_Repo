package controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String createBack(BackerBean bean, Model model) {

		Date date = new Date();
		bean.setBack_status(false);
		bean.setBacker_time(date);

		FundingBean fundingBean = fundingService.findFundingById(bean.getFunding_id());// 拿到這筆專案bean
		Integer oldAmount = fundingBean.getFunding_currentAmount();// 目前總募資金額
		Integer newAmount = bean.getSup_money();// 新增金額
		fundingBean.setFunding_currentAmount(oldAmount + newAmount);// 加總金額
		fundingService.update(fundingBean);// 更新募資金額

		RewardBean rewardBean = rewardService.findRewardByReward_id(bean.getReward_id());// 拿到這筆回饋bean
		Integer oldDonateCount = rewardBean.getReward_donateCount();// 原本贊助人數
		rewardBean.setReward_donateCount(oldDonateCount + 1);// 人數+1
		rewardService.update(rewardBean);// 更新贊助人數

		BackerBean newDonateBean = backerService.create(bean);// 新增一筆贊助

		if (newDonateBean != null) {
			model.addAttribute("newDonateBean", newDonateBean);
			model.addAttribute("result", "贊助成功 再看看其他專案吧!");
		} else {

			model.addAttribute("result", "贊助失敗 請稍後重試");

		}

		return "allFunding.jsp";
	}

//根據username找出贊助紀錄並照最新時間排序
	@RequestMapping(value = "/personalPage/listBackerBeanByUsername", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String listBackerBeanByUsername(String username) {

		List<BackerBean> backerBeans = backerService.listBackerBeanByUsername(username);
		System.out.println(backerBeans);

		List<Map<String, String>> backers = new LinkedList<Map<String, String>>();
		for (BackerBean bean : backerBeans) {
			RewardBean mixbean=rewardService.findRewardByReward_id(bean.getReward_id()); 
			Map<String, String> jsonMap = new HashMap<>();
			jsonMap.put("sup_money", ""+bean.getSup_money());
			jsonMap.put("back_status", ""+bean.getBack_status());
			jsonMap.put("reward_description", "" + mixbean.getReward_description());
			jsonMap.put("reward_image", "" + mixbean.getReward_image());
			jsonMap.put("reward_estimatedYear", "" + mixbean.getReward_estimatedYear());
			jsonMap.put("reward_estimatedMonth", "" + mixbean.getReward_estimatedMonth());
			backers.add(jsonMap);

		}
		return JSONValue.toJSONString(backers);
	}
	// 找出贊助過的人
	@RequestMapping(value = "/funding/donateHistory", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public List<MemberBean> donateHistory(Integer funding_id){
		
		Integer newFundingId = Integer.valueOf(funding_id);
		
		return backerService.donateHistory(newFundingId);
	}
}
