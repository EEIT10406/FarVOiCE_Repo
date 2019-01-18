package model.service;

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

//創一筆回饋
	public RewardBean insert(RewardBean bean) {
		RewardBean result = null;
		if (bean != null) {
			result = rewardDAO.create(bean);
		}
		return result;
	}

}
