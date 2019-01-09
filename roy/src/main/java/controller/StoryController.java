package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.service.StorySevice;

@Controller
public class StoryController {
	@Autowired
	private StorySevice storySevice;
	@RequestMapping(path= {"story.controller"})
	public String insertStory() {
		
		return "";
	} 	
}
