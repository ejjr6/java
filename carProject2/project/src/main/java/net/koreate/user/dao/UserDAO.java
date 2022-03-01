package net.koreate.user.dao;

import net.koreate.user.vo.UserVO;

public interface UserDAO {
	
	void userJoin(UserVO vo) throws Exception;
	
	UserVO getUserById(String u_id)throws Exception;

	// 회원가입한 회원 기본 권한 추가 ROLE_USER
	void insertAuth(String u_id) throws Exception;
	
	
}
