package model.bean;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name="Music")
public class MusicBean {
	
	
	@OneToMany(mappedBy="musicBean")
	private List<StoryBean> StoryBean;
	
	public List<StoryBean> getStoryBean() {
		return StoryBean;
	}
	public void setStoryBean(List<StoryBean> storyBean) {
		StoryBean = storyBean;
	}
	
	
	
	
	
	
	
	
	
	@Override
	public String toString() {
		return "MusicBean [music_id=" + music_id + ", music_name=" + music_name + ", member_username=" + member_username
				+ ", music_music=" + music_music + ", music_caption=" + music_caption + ", music_uploadTime="
				+ music_uploadTime + ", music_playCount=" + music_playCount + ", music_styleName=" + music_styleName
				+ ", music_lyric=" + music_lyric + ", music_likeCount=" + music_likeCount + ", music_Image="
				+ music_Image + ", music_ban=" + music_ban + ", music_unavailable=" + music_unavailable + "]";
	}
	//1228
/*	music_id			int		identity	primary key,
	music_name			varchar(30),
	member_username		varchar(30)	REFERENCES member (member_username),
	music_music			varbinary(max) , --實體檔案，上傳時需要限制大小及格式
	music_caption		varchar(200),--說明文字
	music_uploadTime	datetime,
	music_playCount		int,
	music_styleName		varchar(50), --接受多種風格
	music_lyric			varchar(800),
	music_likeCount		int,
	music_Image			varbinary(max),	 --上傳時需要限制大小
	music_ban			bit,
	music_unavailable	bit,--下架
*/	
//	@ManyToOne
//	@JoinColumn(name="member_username")
//	private MemberBean memberBean;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer music_id;
	private String music_name;
	private String member_username;
	@Column(updatable=false)
	private String music_music;
	private String music_caption;
	private java.util.Date music_uploadTime;
	private Integer music_playCount;
	private String music_styleName;
	private String music_lyric;
	private Integer music_likeCount;
	private String music_Image;
	private Boolean music_ban;
	private Boolean music_unavailable;
	public Boolean getMusic_unavailable() {
		return music_unavailable;
	}
	public void setMusic_unavailable(Boolean music_unavailable) {
		this.music_unavailable = music_unavailable;
	}
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
	
	public String getMusic_music() {
		return music_music;
	}
	public void setMusic_music(String music_music) {
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
	
	public String getMusic_Image() {
		return music_Image;
	}
	public void setMusic_Image(String music_Image) {
		this.music_Image = music_Image;
	}
	public Boolean getMusic_ban() {
		return music_ban;
	}
	public void setMusic_ban(Boolean music_ban) {
		this.music_ban = music_ban;
	}
}
