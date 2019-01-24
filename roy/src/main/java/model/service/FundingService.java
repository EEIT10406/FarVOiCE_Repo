package model.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.FundingBean;
import model.bean.MusicBean;
import model.dao.FundingDAO;
import model.dao.MusicDAO;

@Service
@Transactional
public class FundingService {
	@Autowired
	private FundingDAO fundingDAO;
	@Autowired
	private MusicDAO musicDAO;

//找出審核通過的專案
	public List<FundingBean> findAllByPass() {
		List<FundingBean> bean = fundingDAO.findAllByPass();
		return bean;
	}

//根據使用者名稱抓出提案
	public List<FundingBean> findByUsername(String member_username) {
		if (member_username != null) {
			return fundingDAO.findByUsername(member_username);
		}
		return null;
	}

	// 給上傳的圖片檔一個儲存路徑
	public String imageFilePath(byte[] file) throws IOException {
		String imageFilePath = "C:/Roy_FarVoice/image/funding/" + System.currentTimeMillis() + ".jpg";
		FileOutputStream out = new FileOutputStream(imageFilePath);
		out.write(file);
		out.close();
		return "/roy/image/funding" + imageFilePath.substring(29);
	}

//根據使用者名稱抓出他上傳的音樂
	public List<MusicBean> findMusicByUser(String member_username) {
		if (member_username != null) {
			return musicDAO.findAllByUser(member_username);
		}
		return null;
	}

//根據專案id找專案內容
	public FundingBean findFundingById(Integer funding_id) {
		if (funding_id != null) {
			return fundingDAO.findByPrimaryKey(funding_id);
		}
		return null;
	}

//找出所有專案
	public List<FundingBean> allProject() {
		List<FundingBean> bean = fundingDAO.findAll();
		return bean;
	}

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
