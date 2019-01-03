package model.Bean;

import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="Message")
public class MessageBean {
@Override
	public String toString() {
		return "MessageBean [message_id=" + message_id + ", member_usernameSend=" + member_usernameSend
				+ ", member_usernameReceive=" + member_usernameReceive + ", message_content=" + message_content
				+ ", message_image=" + message_image + ", message_time=" + message_time + "]";
	}
	//	message_id					int			primary key,
//	member_usernameSend			varchar(30) REFERENCES member (member_username),
//	member_usernameReceive		varchar(30) REFERENCES member (member_username),
//	message_content				varchar(800),
//	message_image				varbinary,
//	message_time				datetime,
	@Id
	private Integer message_id;
	private String member_usernameSend;
	private String member_usernameReceive;
	private String message_content;
	private Blob message_image;
	private java.util.Date message_time;
	public Integer getMessage_id() {
		return message_id;
	}
	public void setMessage_id(Integer message_id) {
		this.message_id = message_id;
	}
	public String getMember_usernameSend() {
		return member_usernameSend;
	}
	public void setMember_usernameSend(String member_usernameSend) {
		this.member_usernameSend = member_usernameSend;
	}
	public String getMember_usernameReceive() {
		return member_usernameReceive;
	}
	public void setMember_usernameReceive(String member_usernameReceive) {
		this.member_usernameReceive = member_usernameReceive;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public Blob getMessage_image() {
		return message_image;
	}
	public void setMessage_image(Blob message_image) {
		this.message_image = message_image;
	}
	public java.util.Date getMessage_time() {
		return message_time;
	}
	public void setMessage_time(java.util.Date message_time) {
		this.message_time = message_time;
	}
}
