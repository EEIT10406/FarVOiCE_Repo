package controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.bean.MemberBean;
import model.bean.MusicBean;
import model.bean.ReportBean;
import model.service.MemberLikeMusicService;
import model.service.MusicService;
import model.service.ReportService;

@Controller
public class ReportController {

	@Autowired
	ReportService reportService;
	@Autowired
	MusicService musicService;
	@Autowired
	MemberLikeMusicService memberLikeMusicService;

	//查檢舉
	@RequestMapping(value = "**/report.get")
	public String get(Model model, Integer report_id) {
		model.addAttribute("reportBean", reportService.findByPrimaryKey(report_id));
		return "testSpring2";
	}
	//
		@RequestMapping(value = "**/report.update")
		public String update(Model model, ReportBean reportBean) {
			System.out.println(reportBean.getReport_time());
			model.addAttribute("reportBean", reportService.update(reportBean));
			return "testSpring2";
		}

	//檢舉
	@RequestMapping(value = "**/report.create",produces="text/html;charset=utf-8")
	@ResponseBody
	public String put(Model model,HttpSession session,String music_id,String member_username) {
		MemberBean memberBean = (MemberBean)session.getAttribute("user");
		ReportBean reportBean = new ReportBean();
		reportBean.setMember_usernameReportS(memberBean.getMember_username());
		reportBean.setMember_usernameReportM(member_username);
		reportBean.setMusic_idReportM(Integer.parseInt(music_id));
		reportBean.setReport_time(new java.sql.Date(new Date().getTime()));
		if(reportService.create(reportBean)!=null) {
			return "成功";
		}else {
			return "失敗";
		}
	}

	@RequestMapping(value = "**/report.searchMusic", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String searchMusic(Model model,String type,String searchString,String before,String sort) {
		return JSONValue.toJSONString(musicService.search(type,searchString,before,sort));
	}
	
	@RequestMapping(value = "**/report.addMusic_playCount")
	public void addMusic_playCount(Model model,String music_id) {
		System.out.println(music_id);
		MusicBean musicBean = musicService.findMusic(Integer.parseInt(music_id));
		musicBean.setMusic_playCount(musicBean.getMusic_playCount()+1);
		musicService.updateMusic(musicBean);
	}
	
}
