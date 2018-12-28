package model.Bean;

public class ListMusicBean {
//	playlist_id		int			 REFERENCES PlayList (playlist_id),
//	music_id		int			 REFERENCES Music (music_id),
//	PRIMARY KEY(music_id, playlist_id)
	private Integer playlist_id;
	private Integer music_id;
	public Integer getPlaylist_id() {
		return playlist_id;
	}
	public void setPlaylist_id(Integer playlist_id) {
		this.playlist_id = playlist_id;
	}
	public Integer getMusic_id() {
		return music_id;
	}
	public void setMusic_id(Integer music_id) {
		this.music_id = music_id;
	}
	
	
}
