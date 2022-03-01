package net.koreate.user.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import net.koreate.user.security.user.CustomUser;
import net.koreate.user.vo.UserVO;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		CustomUser userInfo = (CustomUser)authentication.getPrincipal();
		System.out.println(userInfo);
		UserVO vo = userInfo.getUserInfo();
		System.out.println(vo);
		
		String context
			= request.getServletContext().getContextPath();
		response.sendRedirect(context);

	}

}
