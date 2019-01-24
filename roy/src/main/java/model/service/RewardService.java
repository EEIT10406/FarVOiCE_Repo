package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.RewardBean;
import model.dao.RewardDAO;

@Service
@Transactional
public class RewardService {

	@Autowired
	private RewardDAO rewardDAO;

//根據專案id找出回饋
	public List<RewardBean> findRewardByFunding_id(Integer funding_id) {
		if (funding_id != null) {
			return rewardDAO.findByFundingId(funding_id);
		}

		return null;
	}

//創一筆回饋
	public RewardBean insert(RewardBean bean) {
		RewardBean result = null;
		if (bean != null) {
			result = rewardDAO.create(bean);
		}
		return result;
	}

//根據回饋id找出該筆回饋
	public RewardBean findRewardByReward_id(Integer reward_id) {
		RewardBean result =null;
		if(reward_id!=null) {
			result =rewardDAO.findByPrimaryKey(reward_id);
		}
		return result;
	}
}
