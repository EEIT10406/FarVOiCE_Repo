package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.BackerBean;
import model.dao.BackerDAO;
import model.dao.FundingDAO;
import model.dao.RewardDAO;

@Service
@Transactional
public class BackerService {
	@Autowired
	private FundingDAO fundingDAO;
	@Autowired
	private RewardDAO rewardDAO;
	@Autowired
	private BackerDAO backerDAO;

//以funding_id找出所有贊助者
	public List<BackerBean> listBackerBeanByFunding_id(Integer funding_id) {
		if (funding_id != null) {

			return backerDAO.listBackerBeanByFunding_id(funding_id);
		}
		return null;
	}

//以reward_id找出該回饋所有贊助者
	public List<BackerBean> listBackerBeanByReward_id(Integer reward_id) {
		if (reward_id != null) {

			return backerDAO.listBackerBeanByReward_id(reward_id);
		}
		return null;
	}

//建一筆贊助
	public BackerBean create(BackerBean bean) {
		if (bean != null) {

			return backerDAO.create(bean);
		}
		return null;
	}
}
