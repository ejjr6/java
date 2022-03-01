package net.koreate.user.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.koreate.user.service.UserService;
import net.koreate.user.vo.UserVO;

@Controller
@RequestMapping("user/**")
public class userController {
	
	@Inject
	UserService us;
	
	@GetMapping("join")
	public void join() {}
	
	@GetMapping("login")
	public String login(){
		return "user/login";
	}
	
	@GetMapping("logout")
	public void logout() {}
	
	// id 중복 체크
	@PostMapping("uidCheck")
	@ResponseBody
	public boolean uidCheck(String u_id)throws Exception{
		boolean isCheck = us.getUserById(u_id);
		System.out.println(isCheck);
		return isCheck;
	}
	
	@PostMapping("joinPost")
	public String joinPost(UserVO vo) throws Exception{
		System.out.println(vo);
		us.userJoin(vo);
		return "redirect:/user/login";
	}
}
