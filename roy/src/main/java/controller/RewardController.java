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

//創一筆回饋
	@RequestMapping("/funding/reward.controller")
	public String creatRewardModel(FundingBean createBean,String reward, Model model, RewardBean bean,
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
			FundingBean editBean = fundingService.findFundingById(bean.getFunding_id());//找此筆專案內容
			List<MusicBean> musicbeans = musicService.findMusicByUser(editBean.getMember_username());
			System.out.println(musicbeans);
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

}
