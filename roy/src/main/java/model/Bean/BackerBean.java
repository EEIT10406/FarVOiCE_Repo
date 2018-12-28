package model.Bean;

public class BackerBean {
/*	backer_id           int identity primary key,
	member_username     varchar(30) REFERENCES member (member_username),
	reward_id			int         REFERENCES reward (reward_id),
	backer_time         datetime,--贊助日期
	backer_address      varchar(50),--寄送地址*/
	private Integer backer_id;
	private String member_username;
	private Integer reward_id;
	private java.util.Date backer_time;
	private String backer_address;
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

}
