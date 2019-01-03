package model.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Story")
public class StoryBean {
@Override
	public String toString() {
		return "StoryBean [story_id=" + story_id + ", member_username=" + member_username + ", music_id=" + music_id
				+ ", story_time=" + story_time + "]";
	}
	/*	story_id		int primary key,
	member_username	varchar(30) REFERENCES member (member_username),
	music_id		int			REFERENCES Music (music_id),
	story_time		datetime
*/	
	@Id
	private Integer story_id;
	private String member_username;
	private Integer music_id;
	private java.util.Date story_time;
	public Integer getStory_id() {
		return story_id;
	}
	public void setStory_id(Integer story_id) {
		this.story_id = story_id;
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
	public java.util.Date getStory_time() {
		return story_time;
	}
	public void setStory_time(java.util.Date story_time) {
		this.story_time = story_time;
	}
}
