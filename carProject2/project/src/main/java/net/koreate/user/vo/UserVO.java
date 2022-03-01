package net.koreate.user.vo;

import java.util.List;

import lombok.Data;

@Data
public class UserVO {
	
	private int u_no;				// 회원번호
	private String u_id;			// 아이디 - 이메일 아님
	private String u_pw;			// 비밀번호
	private String u_phone;			// 전화번호
	private String u_name;			// 이름
	private String u_birth;			// 생년월일
	private String u_withdraw;		// 회원탈퇴 여부
	
	private List<AuthVO> authList;	// 권한 정보
}
