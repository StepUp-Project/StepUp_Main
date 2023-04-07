package proj.stepUp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import proj.stepUp.vo.ReVO;

@Repository

public class ReDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<ReVO> list(int freeIndex){
		return sqlSession.selectList("proj.stepUp.mapper.reMapper.selectAll", freeIndex);
	}
	
	public int insert(ReVO vo) {
		return sqlSession.insert("proj.stepUp.mapper.reMapper.insert", vo);
	}
	public int update(ReVO vo) {
		return sqlSession.update("proj.stepUp.mapper.reMapper.update", vo);
	}
	
	public int delete(int reIndex) {
		return sqlSession.delete("proj.stepUp.mapper.reMapper.delete", reIndex);
	}
}
