package net.koreate.user.service;

import net.koreate.user.vo.UserVO;

public interface UserService {
	
	// 회원가입
	void userJoin(UserVO vo)throws Exception;
	
	// 아이디 체크
	boolean getUserById(String u_id)throws Exception;
	
	// 회원 탈퇴 여부 y,n / default n
	void deleteYN(UserVO vo)throws Exception;
}
