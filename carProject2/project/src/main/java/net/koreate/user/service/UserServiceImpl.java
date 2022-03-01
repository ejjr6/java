package net.koreate.user.service;

import javax.inject.Inject;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.koreate.user.dao.UserDAO;
import net.koreate.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	UserDAO ud;
	
	@Inject
	PasswordEncoder encoder;
	
	@Transactional
	@Override
	public void userJoin(UserVO vo) throws Exception {
		String u_pw = vo.getU_pw();
		System.out.println("암호화 전 : "+ u_pw);
		vo.setU_pw(encoder.encode(u_pw));
		System.out.println("암호화 후 : "+ vo.getU_pw());
		ud.userJoin(vo);
		ud.insertAuth(vo.getU_id());

	}

	@Override
	public boolean getUserById(String u_id) throws Exception {
		UserVO vo = ud.getUserById(u_id);
		System.out.println(vo);
		return vo == null ? true : false;
	}

	@Override
	public void deleteYN(UserVO vo) throws Exception {
		// TODO Auto-generated method stub

	}

}
