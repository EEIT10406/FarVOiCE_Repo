package model.Bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Report")
public class ReportBean {
@Override
	public String toString() {
		return "ReportBean [report_id=" + report_id + ", member_usernameReportS=" + member_usernameReportS
				+ ", member_usernameReportM=" + member_usernameReportM + ", music_idReportM=" + music_idReportM
				+ ", report_time=" + report_time + "]";
	}
	/*	report_id				int primary key,
	member_usernameReportS	varchar(30) REFERENCES member (member_username),
	member_usernameReportM	varchar(30) REFERENCES member (member_username),
	music_idReportM			int			REFERENCES Music (music_id),
	report_time				datetime*/
	@Id
	private Integer report_id;
	private String member_usernameReportS;
	private String member_usernameReportM;
	private Integer music_idReportM;
	private java.util.Date report_time;
	public Integer getReport_id() {
		return report_id;
	}
	public void setReport_id(Integer report_id) {
		this.report_id = report_id;
	}
	public String getMember_usernameReportS() {
		return member_usernameReportS;
	}
	public void setMember_usernameReportS(String member_usernameReportS) {
		this.member_usernameReportS = member_usernameReportS;
	}
	public String getMember_usernameReportM() {
		return member_usernameReportM;
	}
	public void setMember_usernameReportM(String member_usernameReportM) {
		this.member_usernameReportM = member_usernameReportM;
	}
	public Integer getMusic_idReportM() {
		return music_idReportM;
	}
	public void setMusic_idReportM(Integer music_idReportM) {
		this.music_idReportM = music_idReportM;
	}
	public java.util.Date getReport_time() {
		return report_time;
	}
	public void setReport_time(java.util.Date report_time) {
		this.report_time = report_time;
	}
}
