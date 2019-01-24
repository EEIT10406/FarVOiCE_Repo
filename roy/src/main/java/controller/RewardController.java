package controller;

import java.io.IOException;
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
import model.service.FundingService;
import model.service.RewardService;

@Controller
public class RewardController {
	@Autowired
	private FundingService fundingService;
	@Autowired
	private RewardService rewardService;

//創一筆回饋
	@RequestMapping("/funding/reward.controller")
	public String creatRewardModel(HttpSession session, FundingBean fundingBean, String funding_id, String reward,
			Model model, RewardBean bean, @RequestParam("imageFile") MultipartFile imagefile) {
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
		MemberBean memberBean = (MemberBean) session.getAttribute("user");
		bean.setReward_image(imagepath);
		bean.getFunding_id();
		bean.setReward_donateCount(0);
		
//		找出音樂
		List<MusicBean> musicbeans = fundingService.findMusicByUser(memberBean.getMember_username());
//		上一步修改專案
		if ("編輯專案內容".equals(reward)) {
			FundingBean editBean = fundingService.findFundingById(bean.getFunding_id());

			model.addAttribute("fundingBean", editBean);
			session.setAttribute("musicName", musicbeans);
			session.setAttribute("fundingBean", editBean);
			return "editFuding.jsp";
		}
//		繼續新增回饋
		if ("新增一個回饋".equals(reward)) {
			RewardBean createBean = rewardService.insert(bean);
			model.addAttribute("rewardBean", createBean);
			return "reward.jsp";
		}
//		結束提交專案
		if ("提交專案".equals(reward)) {
			RewardBean createBean = rewardService.insert(bean);
			model.addAttribute("rewardBean", createBean);
			return "personalFunding.jsp";
		}

		return "";
	}

}
