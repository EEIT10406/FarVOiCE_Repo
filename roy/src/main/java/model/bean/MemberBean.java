package model.bean;

import java.sql.Blob;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name="Member")
public class MemberBean {
	//1228
	/*	member_username		varchar(30) primary key,--帳號
		member_password		varchar(30),
		member_email		varchar(30),
		member_nickname		varchar(30),
		member_profileImage	varchar(200),--上傳時需要限制大小
		member_registerTime datetime,
		member_ban			bit,
		member_third_id		varchar(300),
	*/
//	@OneToMany(
//		mappedBy="Member",
//		cascade= {CascadeType.REMOVE}
//	)
//	private List<MusicBean> MusicBeans;
	@Id
	private String member_username;
	private String member_password;
	private String member_email;
	private String member_nickname;
	private String member_profileImage;
	private java.util.Date member_registerTime;
	private Boolean member_ban;
	private String member_third_id;
	
	
	@Override
	public String toString() {
		return "MemberBean [member_username=" + member_username + ", member_password=" + member_password
				+ ", member_email=" + member_email + ", member_nickname=" + member_nickname + ", member_profileImage="
				+ member_profileImage + ", member_registerTime=" + member_registerTime + ", member_ban=" + member_ban
				+", member_third_id=" + member_third_id + "]";
	}
	public String getMember_username() {
		return member_username;
	}
	public void setMember_username(String member_username) {
		this.member_username = member_username;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getMember_profileImage() {
		return member_profileImage;
	}
	public void setMember_profileImage(String member_profileImage) {
		this.member_profileImage = member_profileImage;
	}
	public java.util.Date getMember_registerTime() {
		return member_registerTime;
	}
	public void setMember_registerTime(java.util.Date member_registerTime) {
		this.member_registerTime = member_registerTime;
	}
	public Boolean getMember_ban() {
		return member_ban;
	}
	public void setMember_ban(Boolean member_ban) {
		this.member_ban = member_ban;
		
	}
	public String getMember_third_id() {
		return member_third_id;
	}
	public void setMember_third_id(String member_third_id) {
		this.member_third_id = member_third_id;
	}
}
