package controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.bean.MusicBean;
import model.service.MusicService;

@Controller
public class UploadMusicController {
	@Autowired
	private MusicService musicService;
	
	@RequestMapping("/login-signUp-upload/uploadMusic")
     public String method(MusicBean bean,Model model,@RequestParam("musicFile") MultipartFile musicFile,
    		 @RequestParam("imageFile") MultipartFile imageFile) {
		
		String musicPath="";
		String imagePath="";
		if(!musicFile.isEmpty()) {
			try {
				byte[] musicByte = musicFile.getBytes();
				musicPath=musicService.musicFilePath(musicByte);
			} catch (IOException e) {
				e.printStackTrace();
			}		
		}
		if(!imageFile.isEmpty()) {
			try {
				byte[] imageByte = imageFile.getBytes();
				imagePath=musicService.imageFilePath(imageByte);
			} catch (IOException e) {
				e.printStackTrace();
			}		
		}
		bean.setMusic_music(musicPath);
		bean.setMusic_Image(imagePath);
		bean.setMusic_uploadTime(new java.util.Date());
		
		//取得member的username
//		MemberBean memberbean=(MemberBean)request.getSession().getAttribute("MemberBean");
//		bean.setMember_username(b);
		
		MusicBean uploadMusic=musicService.uploadMusic(bean);
		if(uploadMusic!=null) {
			model.addAttribute("uploadresult", "發佈成功");
			return "/login-signUp-upload/upload.jsp";
		}else {
			model.addAttribute("uploadresult", "發佈失敗");
			return "/login-signUp-upload/upload.jsp";
		}
		
     }
}
