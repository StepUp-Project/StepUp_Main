package proj.stepUp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.QnaVO;
import proj.stepUp.vo.SearchVO;

@Repository

public class QnaDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<QnaVO> list(SearchVO svo){
		return sqlSession.selectList("proj.stepUp.mapper.qnaMapper.selectAll", svo);
	}
	
	public List<QnaVO> listByUserIdx(int userIndex){
		return sqlSession.selectList("proj.stepUp.mapper.qnaMapper.userQna", userIndex);
	}
	
	public List<QnaVO> cntTotal(SearchVO svo){
		return sqlSession.selectList("proj.stepUp.mapper.qnaMapper.cntTotal", svo);
	}
	
	public QnaVO selectByIndex(int qnaIndex) {
		
		return sqlSession.selectOne("proj.stepUp.mapper.qnaMapper.selectByIndex", qnaIndex);
	}
	
	public int insert(QnaVO vo) {
		return sqlSession.insert("proj.stepUp.mapper.qnaMapper.insert", vo);
	}
	public int update(QnaVO vo) {
		return sqlSession.update("proj.stepUp.mapper.qnaMapper.update", vo);
	}
	
	public int delete(int qnaIndex) {
		return sqlSession.delete("proj.stepUp.mapper.qnaMapper.delete", qnaIndex);
	}

}
