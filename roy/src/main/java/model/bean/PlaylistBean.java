package model.bean;

import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="Playlist")
public class PlaylistBean {
	@Override
	public String toString() {
		return "PlaylistBean [playlist_id=" + playlist_id + ", member_username=" + member_username + ", playlist_name="
				+ playlist_name + ", playlist_image=" + playlist_image + ", playlist_registerTime="
				+ playlist_registerTime + ", playlist_musicCount=" + playlist_musicCount + ", playlist_privacy="
				+ playlist_privacy + "]";
	}
	//1228
/*	playlist_id				int			primary key,
	member_username			varchar(30) REFERENCES member (member_username),
	playlist_name			varchar(30)	,
	playlist_image			varbinary,--上傳時需要限制大小
	playlist_registerTime	datetime,
	playlist_musicCount		int,
	playlist_privacy		bit,
	
*/	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer playlist_id;
	private String member_username;
	private String playlist_name;
	private String playlist_image;
	private java.util.Date playlist_registerTime;
	private Integer playlist_musicCount;
	private Boolean playlist_privacy;
	public Integer getPlaylist_id() {
		return playlist_id;
	}
	public void setPlaylist_id(Integer playlist_id) {
		this.playlist_id = playlist_id;
	}
	public String getMember_username() {
		return member_username;
	}
	public void setMember_username(String member_username) {
		this.member_username = member_username;
	}
	public String getPlaylist_name() {
		return playlist_name;
	}
	public void setPlaylist_name(String playlist_name) {
		this.playlist_name = playlist_name;
	}
	public String getPlaylist_image() {
		return playlist_image;
	}
	public void setPlaylist_image(String playlist_image) {
		this.playlist_image = playlist_image;
	}
	public java.util.Date getPlaylist_registerTime() {
		return playlist_registerTime;
	}
	public void setPlaylist_registerTime(java.util.Date playlist_registerTime) {
		this.playlist_registerTime = playlist_registerTime;
	}
	public Integer getPlaylist_musicCount() {
		return playlist_musicCount;
	}
	public void setPlaylist_musicCount(Integer playlist_musicCount) {
		this.playlist_musicCount = playlist_musicCount;
	}
	public Boolean getPlaylist_privacy() {
		return playlist_privacy;
	}
	public void setPlaylist_privacy(Boolean playlist_privacy) {
		this.playlist_privacy = playlist_privacy;
	}
}
