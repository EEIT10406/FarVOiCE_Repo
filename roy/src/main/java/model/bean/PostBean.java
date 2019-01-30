package model.bean;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Post")
public class PostBean {
	@Override
	public String toString() {
		return "PostBean [post_idS=" + post_idS + ", post_idM=" + post_idM + ", member_username=" + member_username
				+ ", member_profileImage=" + member_profileImage + ", member_nickname=" + member_nickname
				+ ", post_content=" + post_content + ", post_time=" + post_time + ", post_privacy=" + post_privacy
				+ ", post_postorshare=" + post_postorshare + ", post_musicid=" + post_musicid + ", post_musicname="
				+ post_musicname + ", post_musicImage=" + post_musicImage + "]";
	}

//	post_idS		int		identity	primary key,
//	post_idM		int			REFERENCES Post (post_idS),--發文本人此欄位為null，留言的話此欄位為被留言的post_idS
//	member_username	varchar(30) REFERENCES member (member_username),
//	member_profileImage	varchar(200),
//	member_nickname		varchar(30),
//	post_content	varchar(800),
//	post_time		datetime,
//	post_privacy	bit,
//	post_postorshare	bit,--0 是分享
//							--1 是文章
//	post_musicid int REFERENCES Music(music_id),
//	post_musicname varchar(30)
//    private PostBean parentPostBean;  
//    //子菜单列表  
//    private List<PostBean> childPostBean = new ArrayList<PostBean>();  
	
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer post_idS;
	private Integer post_idM;
	private String member_username;
	private String member_profileImage;
	private String member_nickname;
	private String post_content;
	private java.util.Date post_time;
	private Boolean post_privacy;
	private Boolean post_postorshare;
	private Integer post_musicid;
	private String post_musicname;
	private String post_musicImage;

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
	public Boolean getPost_postorshare() {
		return post_postorshare;
	}
	public void setPost_postorshare(Boolean post_postorshare) {
		this.post_postorshare = post_postorshare;
	}
	public Integer getPost_musicid() {
		return post_musicid;
	}
	public void setPost_musicid(Integer post_musicid) {
		this.post_musicid = post_musicid;
	}
	public String getPost_musicname() {
		return post_musicname;
	}
	public void setPost_musicname(String post_musicname) {
		this.post_musicname = post_musicname;
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
	public String getPost_musicImage() {
		return post_musicImage;
	}
	public void setPost_musicImage(String post_musicImage) {
		this.post_musicImage = post_musicImage;
	}

}
