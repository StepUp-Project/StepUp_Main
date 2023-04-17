package proj.stepUp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.MarkVO;

@Repository
public class MarkDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertMark(MarkVO vo) {//찜목록 추가
		return sqlSession.insert("proj.stepUp.mapper.markMapper.insertMark", vo);
	}
	
	public int deleteMark(MarkVO vo) {//찜목록 삭제
		return sqlSession.delete("proj.stepUp.mapper.markMapper.deleteMark", vo);
	}
	
	public MarkVO selectMarkByAll(MarkVO vo) {//찜목록 조획
		return sqlSession.selectOne("proj.stepUp.mapper.markMapper.selectMarkByAll", vo);
	}
}
