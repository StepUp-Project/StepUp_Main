package proj.stepUp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.UserDAO;
import proj.stepUp.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public int checkId(String userId) {
		
		return userDAO.checkId(userId);
	}

	@Override
	public int checkNick(String userNick) {
		// TODO Auto-generated method stub
		return userDAO.checkNick(userNick);
	}

	@Override
	public int insertUser(UserVO vo) {
		
		return userDAO.insertUser(vo);
	}

	@Override
	public UserVO login(UserVO vo) {
		
		return userDAO.login(vo);
	}

	@Override
	public UserVO kakaoLogin(String userKakaoId) {
		
		return userDAO.kakaoLogin(userKakaoId);
	}

	@Override
	public int upDateKakaoId(UserVO vo) {
		return userDAO.upDateKakaoId(vo);
	}

	@Override
	public UserVO naverLogin(String userNaverId) {
		// TODO Auto-generated method stub
		return userDAO.naverLogin(userNaverId);
	}

	@Override
	public int upDateNaverId(UserVO vo) {
		// TODO Auto-generated method stub
		return userDAO.upDateNaverId(vo);
	}

}