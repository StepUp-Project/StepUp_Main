package proj.stepUp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.ReviewVO;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertRivew(ReviewVO vo) {//상품 리뷰 추가
		return sqlSession.insert("proj.stepUp.mapper.reviewMapper.insertRivew", vo);
	}
	
	public List<ReviewVO> selectReview(ReviewVO vo) {//상품 리뷰 추가
		return sqlSession.selectList("proj.stepUp.mapper.reviewMapper.selectReview", vo);
	}
	
	public int selectCount(int prdIndex) {
		return sqlSession.selectOne("proj.stepUp.mapper.reviewMapper.selectCount", prdIndex);
	}
}
