package proj.stepUp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.UserVO;

@Repository

public class NoticeBoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
}
