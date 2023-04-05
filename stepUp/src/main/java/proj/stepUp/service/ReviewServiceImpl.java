package proj.stepUp.service;

import org.springframework.stereotype.Service;

import proj.stepUp.dao.ReviewDAO;
import proj.stepUp.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService{

	private ReviewDAO reviewDAO;

	@Override
	public int insertRivew(ReviewVO vo) {//서비스 : 상품리뷰 추가
		return reviewDAO.insertRivew(vo);
	}
}
