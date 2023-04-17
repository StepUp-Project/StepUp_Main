package proj.stepUp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.SizeVO;

@Repository
public class SizeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertSize(SizeVO vo) {
		return sqlSession.insert("proj.stepUp.mapper.sizeMapper.insertSize", vo);
	}
	
	public List<SizeVO> selectByPrdIndex(int prdIndex) {
		return sqlSession.selectList("proj.stepUp.mapper.sizeMapper.selectByPrdIndex", prdIndex);
	}
	
	public int updateSizeStock(SizeVO vo) {
		return sqlSession.update("proj.stepUp.mapper.sizeMapper.updateSizeStock", vo);
	}
}
