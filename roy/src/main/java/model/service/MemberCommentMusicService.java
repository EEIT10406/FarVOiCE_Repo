package model.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.MemberCommentMusicBean;
import model.bean.PostBean;
import model.dao.MemberCommentMusicDAO;

@Service
@Transactional
public class MemberCommentMusicService {
	@Autowired
	private MemberCommentMusicDAO memberCommentMusicDAO;

	public MemberCommentMusicBean postNewMusicComment(MemberCommentMusicBean bean) {
		return  memberCommentMusicDAO.create(bean);
	}
	//給music_id 抓留言
	public List<MemberCommentMusicBean> showAllCommentFromMusic (Integer music_id){
		return memberCommentMusicDAO.showAllCommentFromMusic(music_id);
	}
}
