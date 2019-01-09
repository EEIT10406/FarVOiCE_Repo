package model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.FundingBean;
import model.dao.FundingDAO;

@Service
@Transactional
public class FundingService {
	@Autowired
	private FundingDAO fundingDAO;

	public List<FundingBean> select(FundingBean bean) {
		List<FundingBean> result = null;
		if (bean != null && bean.getFunding_id() != 0) {
			FundingBean temp = fundingDAO.findByPrimaryKey(bean.getFunding_id());
			if (temp != null) {
				result = new ArrayList<FundingBean>();
				result.add(temp);
			}
		} else {
			result = fundingDAO.findAll();
		}
		return result;
	}

	public FundingBean insert(FundingBean bean) {
		FundingBean result = null;
		if (bean != null) {
			result = fundingDAO.create(bean);
		}
		return result;
	}

	public FundingBean update(FundingBean bean) {
//		FundingBean result = null;
//		if(bean!=null) {
		fundingDAO.update(bean);
		return fundingDAO.findByPrimaryKey(bean.getFunding_id());
//			result = fundingDAO.update(bean.getFunding_title(), bean.getFunding_description(),
//					bean.getFunding_goal(), bean.getFunding_styleName(), bean.getFunding_city());
//		}
//		return result;

	}

	public boolean delete(FundingBean bean) {
		boolean result = false;
		if (bean != null) {
			result = fundingDAO.remove(bean.getFunding_id());
		}
		return result;
	}

}
