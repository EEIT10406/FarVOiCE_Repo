package model.service;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.ListMusicBean;
import model.bean.MemberBean;
import model.bean.PlaylistBean;
import model.bean.primarykey.ListMusicId;
import model.dao.ListMusicDAO;
import model.dao.MemberDAO;
import model.dao.PlaylistDAO;

@Service
@Transactional
public class ListMusicService {

	@Autowired
	private ListMusicDAO listMusicDao;
	@Autowired
	private PlaylistDAO playlistDao;
	@Autowired
	private MemberDAO memberDao;
	
	// 如果增加歌單的音樂便更新歌單的音樂數
		public void addMusicCount(ListMusicBean bean) {
			PlaylistBean playlistBean = playlistDao.findByPrimaryKey(bean.getId().getPlaylist_id());
			if (playlistBean != null) {
				int updateMusicCount = playlistBean.getPlaylist_musicCount() + 1;
				if (updateMusicCount >= 0) {
					playlistBean.setPlaylist_musicCount(updateMusicCount);
					playlistDao.update(playlistBean);
				}
			}
		}

	// 把音樂加進歌單
	public ListMusicBean addMusicToPlayList(ListMusicBean bean) {
		if (bean != null) {
			ListMusicBean listMusicBean = listMusicDao.create(bean);
			if (listMusicBean != null) {
                return listMusicBean;
			}
		}
		return null;
	}

	// 如果刪除歌單的音樂便更新歌單的音樂數
	public void reduceMusicCount(ListMusicBean bean) {
		PlaylistBean playlistBean = playlistDao.findByPrimaryKey(bean.getId().getPlaylist_id());
		if (playlistBean != null) {
			int updateMusicCount = playlistBean.getPlaylist_musicCount() - 1;
			if (updateMusicCount >= 0) {
				playlistBean.setPlaylist_musicCount(updateMusicCount);
				playlistDao.update(playlistBean);
			}
		}
	}

	// 把音樂從歌單刪除
	public boolean deleteMusicFromList(ListMusicId listMusicId, Integer musicId) {
		if (listMusicId != null) {
			List<ListMusicBean> beans = listMusicDao.findByPlayListId(listMusicId);
			if (beans != null) {
				for (ListMusicBean bean : beans) {
					if (bean.getId().getMusic_id() == musicId) {
						// 如果該音樂刪除成功要修改playlist的music_count
						return listMusicDao.remove(bean.getId());
					}
				}
			}
		}
		return false;
	}

	// 找歌單內所有音樂的id
	public List<Integer> findByPlayListId(ListMusicId listMusicId) {
		if (listMusicId != null) {
			List<ListMusicBean> listMusicBean = listMusicDao.findByPlayListId(listMusicId);
			List<Integer> listMusicIds = new LinkedList<>();
			if (listMusicBean != null) {
				for (ListMusicBean beans : listMusicBean) {
					listMusicIds.add(beans.getId().getMusic_id());
				}
				return listMusicIds;
			}
		}
		return null;
	}
	
}
