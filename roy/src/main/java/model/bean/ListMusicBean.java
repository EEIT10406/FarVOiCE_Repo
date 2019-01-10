package model.bean;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import model.bean.primarykey.ListMusicId;

@Entity
@Table(name="ListMusic")
public class ListMusicBean {
//	playlist_id		int			 REFERENCES PlayList (playlist_id),
//	music_id		int			 REFERENCES Music (music_id),
//	PRIMARY KEY(music_id, playlist_id)

	@Override
	public String toString() {
		return "ListMusicBean [id=" + id + "]";
	}
	//	private Integer playlist_id;
	//	private Integer music_id;
	
	@ManyToOne
	@JoinColumn(
			name="playlist_id",
			referencedColumnName="playlist_id",
			insertable=false, updatable=false
			)
	private PlaylistBean playList;
	@EmbeddedId
	private ListMusicId id;
	public ListMusicId getId() {
		return id;
	}
	public void setId(ListMusicId id) {
		this.id = id;
	}
}
