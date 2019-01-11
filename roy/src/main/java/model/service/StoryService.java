package model.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.StoryBean;
import model.dao.StoryDAO;

@Service
@Transactional
public class StoryService {

	@Autowired
	private StoryDAO storyDAO;

	public StoryBean findByPrimaryKey(Integer story_id) {
		return storyDAO.findByPrimaryKey(story_id);
	}

	public List<StoryBean> findAll() {
		return storyDAO.findAll();
	}

	public StoryBean create(StoryBean bean) {
		return storyDAO.create(bean);
	}

	public void update(StoryBean bean) {
		storyDAO.update(bean);
	}

	public boolean remove(Integer story_id) {
		return storyDAO.remove(story_id);
	}

}
