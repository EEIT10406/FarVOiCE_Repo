package controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.bean.MemberBean;
import model.bean.PostBean;
import model.service.PostService;

@Controller
public class PostController {
	@Autowired
	private PostService postService;
	@RequestMapping(path="/personalPage/Post.controller")
	public String post(Model model,PostBean newPostBean,HttpSession session) {
		//發文
//		post_idS		int		identity	primary key,
//		post_idM		int			REFERENCES Post (post_idS),--發文本人此欄位為null
//		member_username	varchar(30) REFERENCES member (member_username),ok
//		post_content	varchar(800),   ok
//		post_time		datetime,		ok
//		post_privacy	bit,
		if(newPostBean!=null) {
			System.out.println(newPostBean.getPost_content());
			Date now = new Date();
			newPostBean.setPost_time(now);
			MemberBean memberWhoPost = (MemberBean)session.getAttribute("user");
			newPostBean.setMember_username(memberWhoPost.getMember_username());
			System.out.println(newPostBean);
			//model
			PostBean newArticle = postService.postNewArticle(newPostBean);
			return "redirect:/personalPage/personalPage.jsp";
		}
		return "redirect:/personalPage/personalPage.jsp";
	}//,produces="text/html;charset=UTF-8"
	@RequestMapping(path="/personalPage/showArticleFromMember.controller",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String showAllArticleFromMember(Model model,HttpSession session,String user) {
		//show這個人的文章
		System.out.println(user);
		List<PostBean> posts = postService.showAllArticleFromMember(user);
		for(PostBean beantemp:posts) {
			System.out.println(beantemp);
		}
		Gson gson = new Gson();
		String jsonList = gson.toJson(posts);
		System.out.println(jsonList);
		return jsonList;
	}
	@RequestMapping(path="/personalPage/singleArticle.controller")
	public String singleArticle(Integer post_idS,Model model) {
		//進去文章頁面並帶著這個文章的bean
		System.out.println(post_idS);
		PostBean currentPostBean = postService.findSinglePost(post_idS);
		System.out.println(currentPostBean);
		model.addAttribute("currentPost",currentPostBean);
		return"/personalPage/singleArticle.jsp";
	}
	@RequestMapping(path="/personalPage/PostComment.controller")
	public String postComment(Integer post_idSReff,Model model,String member_username,String post_content,HttpSession session) {
		//新增留言
		PostBean currentPostBean = postService.findSinglePost(post_idSReff);
		System.out.println(currentPostBean);
		session.setAttribute("currentPost",currentPostBean);
		PostBean bean = new PostBean();
		bean.setPost_idM(post_idSReff);
		bean.setMember_username(member_username);
		bean.setPost_content(post_content);
		bean.setPost_time(new Date());
		postService.postNewComment(bean);
		return "redirect:/personalPage/singleArticle.jsp";
	}
	@RequestMapping(path="/personalPage/showAllCommentFromArticle.controller",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String showAllCommentFromArticle(Model model,HttpSession session,Integer post_idS) {
		
		//show這個文章的留言
	
		List<PostBean> comments = postService.showAllCommentFromArticle(post_idS);
		for(PostBean beantemp:comments) {
			System.out.println(beantemp);
		}
		Gson gson = new Gson();
		String jsonList = gson.toJson(comments);
		System.out.println(jsonList);
		return jsonList;
		
	}
}
