package model.Bean;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

import model.Bean.primarykey.ListMusicId;

@Entity
@Table(name="ListMusic")
public class ListMusicBean {
//	playlist_id		int			 REFERENCES PlayList (playlist_id),
//	music_id		int			 REFERENCES Music (music_id),
//	PRIMARY KEY(music_id, playlist_id)

	//	private Integer playlist_id;
//	private Integer music_id;
	@EmbeddedId
	private ListMusicId id;
	public ListMusicId getId() {
		return id;
	}
	public void setId(ListMusicId id) {
		this.id = id;
	}
}
