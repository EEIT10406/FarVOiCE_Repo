package model.Bean;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

import model.Bean.primarykey.MemberLikeMusicId;

@Entity
@Table(name="MemberLikeMusic")
public class MemberLikeMusicBean {
//	member_username			varchar(30) REFERENCES member (member_username),
//	music_id				int			REFERENCES Music (music_id),
//	memberLikeMusic_time    datetime
//	PRIMARY KEY(member_username, music_id)
	
//	private String member_username;
//	private Integer music_id;
	
	@Override
	public String toString() {
		return "MemberLikeMusicBean [id=" + id + ", memberLikeMusic_time=" + memberLikeMusic_time + "]";
	}
	@EmbeddedId
	private MemberLikeMusicId id;
	private java.util.Date memberLikeMusic_time;
	
	public java.util.Date getMemberLikeMusic_time() {
		return memberLikeMusic_time;
	}
	public void setMemberLikeMusic_time(java.util.Date memberLikeMusic_time) {
		this.memberLikeMusic_time = memberLikeMusic_time;
	}
	public MemberLikeMusicId getId() {
		return id;
	}
	public void setId(MemberLikeMusicId id) {
		this.id = id;
	}
	
}
