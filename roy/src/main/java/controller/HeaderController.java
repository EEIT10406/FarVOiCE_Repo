package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.bean.MemberBean;
import model.service.MemberService;
@Controller
public class HeaderController {
	@Autowired
	MemberService memberService;
	@RequestMapping(path="/header/searchUser.controller",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String showAllArticleFromMember(Model model,HttpSession session,String username) {
		//show這個人的文章
		List<MemberBean> people = memberService.searchUser();
		//用gson包成json送回前端
		Gson gson = new Gson();
		String jsonList = gson.toJson(people);
		return jsonList;
	}
}
