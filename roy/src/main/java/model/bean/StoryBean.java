package model.bean;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;

@Entity
@Table(name="Story")
public class StoryBean {
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="music_id",
				referencedColumnName="music_id",
				insertable=false,updatable=false)
	private MusicBean musicBean;
	 
	
	
	public MusicBean getMusicBean() {
		return musicBean;
	}
	public void setMusicBean(MusicBean musicBean) {
		this.musicBean = musicBean;
	}
	
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
	@GeneratedValue(strategy = GenerationType.IDENTITY)@Expose
	private Integer story_id;
	@Expose
	private String member_username;
	@Expose
	private Integer music_id;
	@Expose
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
