package model.bean;

import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="MemberCommentMusic")
public class MemberCommentMusicBean {

	@Override
	public String toString() {
		return "MemberCommentMusicBean [memberCommentMusic_id=" + memberCommentMusic_id + ", member_username="
				+ member_username + ", member_profileImage=" + member_profileImage + ", member_nickname="
				+ member_nickname + ", music_id=" + music_id + ", memberCommentMusic_content="
				+ memberCommentMusic_content + ", memberCommentMusic_time=" + memberCommentMusic_time
				+ ", memberCommentMusic_image=" + memberCommentMusic_image + "]";
	}
	//memberCommentMusic_id		int		identity	primary key,
	//member_username				varchar(30) REFERENCES member (member_username),
	//member_profileImage	varchar(200),
	//member_nickname		varchar(30),
	//music_id					int			REFERENCES Music (music_id),
	//memberCommentMusic_content	varchar(800),
	//memberCommentMusic_time		datetime,
	//memberCommentMusic_image	varchar(200)--上傳時需要限制大小
	@Id	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer memberCommentMusic_id;
	private String member_username;
	private String member_profileImage;
	private String member_nickname;
	private Integer music_id;
	private String memberCommentMusic_content;
	private java.util.Date memberCommentMusic_time;
	private Blob memberCommentMusic_image;
	public Integer getMemberCommentMusic_id() {
		return memberCommentMusic_id;
	}
	public void setMemberCommentMusic_id(Integer memberCommentMusic_id) {
		this.memberCommentMusic_id = memberCommentMusic_id;
	}
	public String getMember_username() {
		return member_username;
	}
	public void setMember_username(String member_username) {
		this.member_username = member_username;
	}
	public Integer getMusic_id() {
		return music_id;
	}
	public void setMusic_id(Integer music_id) {
		this.music_id = music_id;
	}
	public String getMemberCommentMusic_content() {
		return memberCommentMusic_content;
	}
	public void setMemberCommentMusic_content(String memberCommentMusic_content) {
		this.memberCommentMusic_content = memberCommentMusic_content;
	}
	public java.util.Date getMemberCommentMusic_time() {
		return memberCommentMusic_time;
	}
	public void setMemberCommentMusic_time(java.util.Date memberCommentMusic_time) {
		this.memberCommentMusic_time = memberCommentMusic_time;
	}
	public Blob getMemberCommentMusic_image() {
		return memberCommentMusic_image;
	}
	public void setMemberCommentMusic_image(Blob memberCommentMusic_image) {
		this.memberCommentMusic_image = memberCommentMusic_image;
	}
	public String getMember_profileImage() {
		return member_profileImage;
	}
	public void setMember_profileImage(String member_profileImage) {
		this.member_profileImage = member_profileImage;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
}
