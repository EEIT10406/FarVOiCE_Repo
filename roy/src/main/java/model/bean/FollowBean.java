package model.bean;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

import model.bean.primarykey.FollowId;

@Entity
@Table(name="Follow")
public class FollowBean {
//	member_usernameS	varchar(30) REFERENCES member (member_username),
//	member_usernameM	varchar(30) REFERENCES member (member_username),
//	follow_time			datetime,
//	member_nicknameS		varchar(30),
//	member_nicknameM		varchar(30),
//	member_profileImageS	varchar(200),
//	member_profileImageM	varchar(200),
//PRIMARY KEY(member_usernameS, member_usernameM)
	
//	private  String member_usernameS;
//	private  String member_usernameM;
	
	@Override
	public String toString() {
		return "FollowBean [id=" + id + ", follow_time=" + follow_time + ", member_nicknameS=" + member_nicknameS
				+ ", member_nicknameM=" + member_nicknameM + ", member_profileImageS=" + member_profileImageS
				+ ", member_profileImageM=" + member_profileImageM + "]";
	}
	
	@EmbeddedId
	private FollowId id;
	private String member_nicknameS;
	private String member_nicknameM;
	private String member_profileImageS;
	private String member_profileImageM;
	private java.util.Date follow_time;

	public FollowId getId() {
		return id;
	}
	public void setId(FollowId id) {
		this.id = id;
	}
	public String getMember_nicknameS() {
		return member_nicknameS;
	}
	public void setMember_nicknameS(String member_nicknameS) {
		this.member_nicknameS = member_nicknameS;
	}
	public String getMember_nicknameM() {
		return member_nicknameM;
	}
	public void setMember_nicknameM(String member_nicknameM) {
		this.member_nicknameM = member_nicknameM;
	}
	public String getMember_profileImageS() {
		return member_profileImageS;
	}
	public void setMember_profileImageS(String member_profileImageS) {
		this.member_profileImageS = member_profileImageS;
	}
	public String getMember_profileImageM() {
		return member_profileImageM;
	}
	public void setMember_profileImageM(String member_profileImageM) {
		this.member_profileImageM = member_profileImageM;
	}

	
	public java.util.Date getFollow_time() {
		return follow_time;
	}
	public void setFollow_time(java.util.Date follow_time) {
		this.follow_time = follow_time;
	}
}
