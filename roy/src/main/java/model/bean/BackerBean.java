package model.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Backer")
public class BackerBean {
	@Override
	public String toString() {
		return "BackerBean [backer_id=" + backer_id + ", member_username=" + member_username + ", reward_id="
				+ reward_id + ", backer_time=" + backer_time + ", backer_address=" + backer_address + ",funding_id="
				+ funding_id + ",member_realname=" + member_realname + ",phone_number=" + phone_number
				+ ",backer_email=" + backer_email + ",sup_money=" + sup_money + ",postal_code=" + postal_code
				+ ",back_status=" + back_status + "]";
	}

	/*
	 * backer_id int identity primary key, member_username varchar(30) REFERENCES
	 * member (member_username), reward_id int REFERENCES reward (reward_id),
	 * backer_time datetime,--贊助日期 backer_address varchar(50),--寄送地址
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer backer_id;
	private String member_username;
	private Integer reward_id;
	private Integer funding_id;
	private String member_realname;
	private String phone_number;
	private String backer_email;
	private Integer sup_money;
	private java.util.Date backer_time;
	private Integer postal_code;
	private String backer_address;
	private Boolean back_status;

	public Integer getBacker_id() {
		return backer_id;
	}

	public void setBacker_id(Integer backer_id) {
		this.backer_id = backer_id;
	}

	public String getMember_username() {
		return member_username;
	}

	public void setMember_username(String member_username) {
		this.member_username = member_username;
	}

	public Integer getReward_id() {
		return reward_id;
	}

	public void setReward_id(Integer reward_id) {
		this.reward_id = reward_id;
	}

	public java.util.Date getBacker_time() {
		return backer_time;
	}

	public void setBacker_time(java.util.Date backer_time) {
		this.backer_time = backer_time;
	}

	public String getBacker_address() {
		return backer_address;
	}

	public void setBacker_address(String backer_address) {
		this.backer_address = backer_address;
	}

	public Integer getFunding_id() {
		return funding_id;
	}

	public void setFunding_id(Integer funding_id) {
		this.funding_id = funding_id;
	}

	public String getMember_realname() {
		return member_realname;
	}

	public void setMember_realname(String member_realname) {
		this.member_realname = member_realname;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getBacker_email() {
		return backer_email;
	}

	public void setBacker_email(String backer_email) {
		this.backer_email = backer_email;
	}

	public Integer getSup_money() {
		return sup_money;
	}

	public void setSup_money(Integer sup_money) {
		this.sup_money = sup_money;
	}

	public Integer getPostal_code() {
		return postal_code;
	}

	public void setPostal_code(Integer postal_code) {
		this.postal_code = postal_code;
	}

	public Boolean getBack_status() {
		return back_status;
	}

	public void setBack_status(Boolean back_status) {
		this.back_status = back_status;
	}

}
