package model.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Funding")
public class FundingBean {
	@Override
	public String toString() {
		return "FundingBean [funding_id=" + funding_id + ", member_username=" + member_username
				+ ", funding_description=" + funding_description + ", funding_city=" + funding_city + ", funding_title="
				+ funding_title + ", funding_styleName=" + funding_styleName + ", funding_image=" + funding_image
				+ ", music_id=" + music_id + ", funding_goal=" + funding_goal + ", funding_currentAmount="
				+ funding_currentAmount + ", funding_duration=" + funding_duration + ", funding_createTime="
				+ funding_createTime + ", funding_browseCount=" + funding_browseCount + "]";
	}

	/*
	 * funding_id int primary key, member_username varchar(30) REFERENCES member
	 * (member_username), funding_description varchar(200),--募資專案描述 funding_city
	 * varchar(10),--發起募資所在城市 funding_title varchar(30), funding_styleName
	 * varchar(20),--音樂類型(選填,單選) funding_image varbinary(max), music_id int
	 * REFERENCES Music (music_id), funding_goal int,--募資金額目標 funding_currentAmount
	 * int,--募資目前金額 funding_duration int,--募資期限 1-60day funding_createTime datetime,
	 * funding_browseCount int
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer funding_id;
	private String member_username;
	private String funding_description;
	private String funding_city;
	private String funding_title;
	private String funding_styleName;
	private String funding_image;
	private Integer music_id;
	private Integer funding_goal;
	private Integer funding_currentAmount;
	private java.sql.Date funding_duration;
	private java.util.Date funding_createTime;
	private Integer funding_browseCount;

	public Integer getFunding_currentAmount() {
		return funding_currentAmount;
	}

	public void setFunding_currentAmount(Integer funding_currentAmount) {
		this.funding_currentAmount = funding_currentAmount;
	}


	public Integer getFunding_id() {
		return funding_id;
	}

	public void setFunding_id(Integer funding_id) {
		this.funding_id = funding_id;
	}

	public String getMember_username() {
		return member_username;
	}

	public void setMember_username(String member_username) {
		this.member_username = member_username;
	}

	public String getFunding_description() {
		return funding_description;
	}

	public void setFunding_description(String funding_description) {
		this.funding_description = funding_description;
	}

	public String getFunding_city() {
		return funding_city;
	}

	public void setFunding_city(String funding_city) {
		this.funding_city = funding_city;
	}

	public String getFunding_title() {
		return funding_title;
	}

	public void setFunding_title(String funding_title) {
		this.funding_title = funding_title;
	}

	public String getFunding_styleName() {
		return funding_styleName;
	}

	public void setFunding_styleName(String funding_styleName) {
		this.funding_styleName = funding_styleName;
	}

	public String getFunding_image() {
		return funding_image;
	}

	public void setFunding_image(String funding_image) {
		this.funding_image = funding_image;
	}

	public Integer getMusic_id() {
		return music_id;
	}

	public void setMusic_id(Integer music_id) {
		this.music_id = music_id;
	}

	public Integer getFunding_goal() {
		return funding_goal;
	}

	public void setFunding_goal(Integer funding_goal) {
		this.funding_goal = funding_goal;
	}

	public java.sql.Date getFunding_duration() {
		return funding_duration;
	}

	public void setFunding_duration(java.sql.Date funding_duration) {
		this.funding_duration = funding_duration;
	}

	public java.util.Date getFunding_createTime() {
		return funding_createTime;
	}

	public void setFunding_createTime(java.util.Date funding_createTime) {
		this.funding_createTime = funding_createTime;
	}

	public Integer getFunding_browseCount() {
		return funding_browseCount;
	}

	public void setFunding_browseCount(Integer funding_browseCount) {
		this.funding_browseCount = funding_browseCount;
	}

}
