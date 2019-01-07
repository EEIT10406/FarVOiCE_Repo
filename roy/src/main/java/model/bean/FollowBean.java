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
//PRIMARY KEY(member_usernameS, member_usernameM)
	
//	private  String member_usernameS;
//	private  String member_usernameM;
	
	@Override
	public String toString() {
		return "FollowBean [id=" + id + ", follow_time=" + follow_time + "]";
	}
	
	@EmbeddedId
	private FollowId id;
	public FollowId getId() {
		return id;
	}
	public void setId(FollowId id) {
		this.id = id;
	}
	private java.util.Date follow_time;
	public java.util.Date getFollow_time() {
		return follow_time;
	}
	public void setFollow_time(java.util.Date follow_time) {
		this.follow_time = follow_time;
	}
}