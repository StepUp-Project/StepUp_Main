package proj.stepUp.service;

import proj.stepUp.vo.UserVO;

public interface UserService {
	
	public int checkId(String userId);
	public int checkNick(String userNick);
	public int insertUser(UserVO vo);
	public UserVO login(UserVO vo);
	public UserVO mypage(String userId);
	public int mypageUpdate(UserVO vo);
	public UserVO kakaoLogin(String userKakaoId);
	public int upDateKakaoId(UserVO vo);
	public UserVO naverLogin(String userNaverId);
	public int upDateNaverId(UserVO vo);
}
