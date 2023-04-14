package proj.stepUp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.UserVO;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int checkId(String userId) {
		
		return sqlSession.selectOne("proj.stepUp.mapper.userMapper.checkId", userId);
	}
	
	public int checkNick(String userNick) {
		
		return sqlSession.selectOne("proj.stepUp.mapper.userMapper.checkId", userNick);
	}
	
	public int insertUser(UserVO vo) {
		return sqlSession.insert("proj.stepUp.mapper.userMapper.insertUser", vo);
	}
	
	public UserVO login(UserVO vo) {
		return sqlSession.selectOne("proj.stepUp.mapper.userMapper.login", vo);
	}
	
	public UserVO mypage(String userId) {
		
		return sqlSession.selectOne("proj.stepUp.mapper.userMapper.mypage", userId);
	}

	public int mypageUpdate(UserVO vo) {
		return sqlSession.update("proj.stepUp.mapper.userMapper.mypageUpdate", vo);
	}
	
	public UserVO kakaoLogin(String userKakaoId) {
		return sqlSession.selectOne("proj.stepUp.mapper.userMapper.kakaoLogin", userKakaoId);
	}
	
	public int upDateKakaoId(UserVO vo) {
		return sqlSession.update("proj.stepUp.mapper.userMapper.upDateKakaoId", vo);
	}
	
	public UserVO naverLogin(String userNaverId) {
		return sqlSession.selectOne("proj.stepUp.mapper.userMapper.naverLogin", userNaverId);
	}
	
	public int upDateNaverId(UserVO vo) {
		return sqlSession.update("proj.stepUp.mapper.userMapper.upDateNaverId", vo);
	}
	
	public int userDelete(String userid) {
		return sqlSession.update("proj.stepUp.mapper.userMapper.userDelete", userid);
	}
}
