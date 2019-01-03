package model.bean.primarykey;

import java.io.Serializable;
import java.util.Objects;

public class ListMusicId implements Serializable{

	@Override
	public String toString() {
		return "ListMusicId [playlist_id=" + playlist_id + ", music_id=" + music_id + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(getMusic_id(),getPlaylist_id());
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (!(o instanceof ListMusicId))
			return false;
		ListMusicId that = (ListMusicId) o;
		return Objects.equals(getMusic_id(), that.getMusic_id())
				&& Objects.equals(getPlaylist_id(), that.getPlaylist_id());
	}

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
