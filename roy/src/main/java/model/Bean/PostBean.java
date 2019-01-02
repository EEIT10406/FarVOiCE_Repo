package model.Bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Post")
public class PostBean {
//	post_idS		int			primary key,
//	post_idM		int			REFERENCES Post (post_idS),--發文本人此欄位為null
//	member_username	varchar(30) REFERENCES member (member_username),
//	post_content	varchar(800),
//	post_time		datetime,
//	post_privacy	bit,
	@Id
	private Integer post_idS;
	private Integer post_idM;
	private String member_username;
	private String post_content;
	private java.util.Date post_time;
	private Boolean post_privacy;
	public Integer getPost_idS() {
		return post_idS;
	}
	public void setPost_idS(Integer post_idS) {
		this.post_idS = post_idS;
	}
	public Integer getPost_idM() {
		return post_idM;
	}
	public void setPost_idM(Integer post_idM) {
		this.post_idM = post_idM;
	}
	public String getMember_username() {
		return member_username;
	}
	public void setMember_username(String member_username) {
		this.member_username = member_username;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public java.util.Date getPost_time() {
		return post_time;
	}
	public void setPost_time(java.util.Date post_time) {
		this.post_time = post_time;
	}
	public Boolean getPost_privacy() {
		return post_privacy;
	}
	public void setPost_privacy(Boolean post_privacy) {
		this.post_privacy = post_privacy;
	}

}
