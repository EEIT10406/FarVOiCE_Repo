package model.Bean;

public class FollowBean {
//	member_usernameS	varchar(30) REFERENCES member (member_username),
//	member_usernameM	varchar(30) REFERENCES member (member_username),
//	follow_time			datetime,
	private  String member_usernameS;
	private  String member_usernameM;
	private java.util.Date follow_time;
	public String getMember_usernameS() {
		return member_usernameS;
	}
	public void setMember_usernameS(String member_usernameS) {
		this.member_usernameS = member_usernameS;
	}
	public String getMember_usernameM() {
		return member_usernameM;
	}
	public void setMember_usernameM(String member_usernameM) {
		this.member_usernameM = member_usernameM;
	}
	public java.util.Date getFollow_time() {
		return follow_time;
	}
	public void setFollow_time(java.util.Date follow_time) {
		this.follow_time = follow_time;
	}
}
