package model.Bean;

public class MemberLikeMusicBean {
//	member_username			varchar(30) REFERENCES member (member_username),
//	music_id				int			REFERENCES Music (music_id),
//	memberLikeMusic_time    datetime
	private String member_username;
	private java.util.Date memberLikeMusic_time;
	private Integer music_id;
	public String getMember_username() {
		return member_username;
	}
	public void setMember_username(String member_username) {
		this.member_username = member_username;
	}
	public java.util.Date getMemberLikeMusic_time() {
		return memberLikeMusic_time;
	}
	public void setMemberLikeMusic_time(java.util.Date memberLikeMusic_time) {
		this.memberLikeMusic_time = memberLikeMusic_time;
	}
	public Integer getMusic_id() {
		return music_id;
	}
	public void setMusic_id(Integer music_id) {
		this.music_id = music_id;
	}
}
