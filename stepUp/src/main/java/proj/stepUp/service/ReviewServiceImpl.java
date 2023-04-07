package proj.stepUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.ReviewDAO;
import proj.stepUp.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public int insertRivew(ReviewVO vo) {//서비스 : 상품리뷰 추가
		return reviewDAO.insertRivew(vo);
	}

	@Override
	public List<ReviewVO> selectByPrdIndex(int prdIndex) {//상품 리뷰 검색(제품인덱스 기준)
		return reviewDAO.selectByPrdIndex(prdIndex);
	}
}
