package proj.stepUp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.FreeBoardVO;
import proj.stepUp.vo.SearchVO;

@Repository

public class FreeBoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FreeBoardVO> list(SearchVO svo){
		return sqlSession.selectList("proj.stepUp.mapper.freeBoardMapper.selectAll", svo);
	}
	
	
}
