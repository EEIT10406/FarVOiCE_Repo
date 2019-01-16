package model.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.ReportBean;
import model.dao.ReportDAO;
import model.hibernate.HibernateUtil;

@Service
@Transactional
public class ReportService {

	@Autowired
	private ReportDAO reportDAO;
	
	public List<ReportBean> findByMember_username(String member_username,String music_id){
		return reportDAO.findByMember_username(member_username,music_id);
	}
	
	public ReportBean findByPrimaryKey(Integer report_id) {
		return reportDAO.findByPrimaryKey(report_id);
	}

	public List<ReportBean> findAll() {
		return reportDAO.findAll();
	}

	public ReportBean create(ReportBean bean) {
		return reportDAO.create(bean);
	}

	public ReportBean update(ReportBean bean) {
		reportDAO.update(bean);
		return reportDAO.findByPrimaryKey(bean.getReport_id());
	}

	public boolean remove(Integer report_id) {
		return reportDAO.remove(report_id);
	}

}
