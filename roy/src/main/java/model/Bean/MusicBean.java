package model.Bean;

import java.sql.Blob;

public class MusicBean {
	//1228
/*	music_id			int			primary key,
	music_name			varchar(30),
	member_username		varchar(30)	REFERENCES member (member_username),
	music_music			varbinary ,	 --實體檔案，上傳時需要限制大小及格式
	music_caption		varchar(200),--說明文字
	music_uploadTime	datetime,
	music_playCount		int,
	music_styleName		varchar(50), --接受多種風格
	music_lyric			varchar(800),
	music_likeCount		int,
	music_bigImage		varbinary,	 --上傳時需要限制大小
	music_smallImage	varbinary,	 --上傳時需要限制大小
	music_ban			bit,
*/
	private Integer music_id;
	private String music_name;
	private String member_username;
	private Blob music_music;
	private String music_caption;
	private java.util.Date music_uploadTime;
	private Integer music_playCount;
	private String music_styleName;
	private String music_lyric;
	private Integer music_likeCount;
	private Blob music_bigImage;
	private Blob music_smallImage;
	private Boolean music_ban;

	public Integer getMusic_id() {
		return music_id;
	}
	public void setMusic_id(Integer music_id) {
		this.music_id = music_id;
	}
	public String getMusic_name() {
		return music_name;
	}
	public void setMusic_name(String music_name) {
		this.music_name = music_name;
	}
	public String getMember_username() {
		return member_username;
	}
	public void setMember_username(String member_username) {
		this.member_username = member_username;
	}
	public Blob getMusic_music() {
		return music_music;
	}
	public void setMusic_music(Blob music_music) {
		this.music_music = music_music;
	}
	public String getMusic_caption() {
		return music_caption;
	}
	public void setMusic_caption(String music_caption) {
		this.music_caption = music_caption;
	}
	public java.util.Date getMusic_uploadTime() {
		return music_uploadTime;
	}
	public void setMusic_uploadTime(java.util.Date music_uploadTime) {
		this.music_uploadTime = music_uploadTime;
	}
	public Integer getMusic_playCount() {
		return music_playCount;
	}
	public void setMusic_playCount(Integer music_playCount) {
		this.music_playCount = music_playCount;
	}
	public String getMusic_styleName() {
		return music_styleName;
	}
	public void setMusic_styleName(String music_styleName) {
		this.music_styleName = music_styleName;
	}
	public String getMusic_lyric() {
		return music_lyric;
	}
	public void setMusic_lyric(String music_lyric) {
		this.music_lyric = music_lyric;
	}
	public Integer getMusic_likeCount() {
		return music_likeCount;
	}
	public void setMusic_likeCount(Integer music_likeCount) {
		this.music_likeCount = music_likeCount;
	}
	public Blob getMusic_bigImage() {
		return music_bigImage;
	}
	public void setMusic_bigImage(Blob music_bigImage) {
		this.music_bigImage = music_bigImage;
	}
	public Blob getMusic_smallImage() {
		return music_smallImage;
	}
	public void setMusic_smallImage(Blob music_smallImage) {
		this.music_smallImage = music_smallImage;
	}
	public Boolean getMusic_ban() {
		return music_ban;
	}
	public void setMusic_ban(Boolean music_ban) {
		this.music_ban = music_ban;
	}
}
