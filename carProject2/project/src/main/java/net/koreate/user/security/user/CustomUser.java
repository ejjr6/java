package net.koreate.user.security.user;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import net.koreate.user.vo.AuthVO;
import net.koreate.user.vo.UserVO;

public class CustomUser extends User {

	private static final long serialVersionUID = 7730240925368535764L;

	@Getter
	private UserVO userInfo;
	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUser(UserVO vo) {
		super(vo.getU_id(),vo.getU_pw(),authorities(vo.getAuthList()));
		this.userInfo = vo;
	}

	private static Collection<? extends GrantedAuthority> 
				authorities(List<AuthVO> authList) {
		List<GrantedAuthority> gList = new ArrayList<>();
		for(AuthVO vo : authList) {
			gList.add(new SimpleGrantedAuthority(vo.getU_auth()));
		}
		return gList;
	}
	
	

}
