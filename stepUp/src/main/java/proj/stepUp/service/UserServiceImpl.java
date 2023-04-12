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
	public UserVO mypage(String userId) {
		return userDAO.mypage(userId);
	}
	
	@Override
	public int mypageUpdate(UserVO vo) {
		return userDAO.mypageUpdate(vo);
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
		return userDAO.naverLogin(userNaverId);
	}

	@Override
	public int upDateNaverId(UserVO vo) {
		return userDAO.upDateNaverId(vo);
	}


}
