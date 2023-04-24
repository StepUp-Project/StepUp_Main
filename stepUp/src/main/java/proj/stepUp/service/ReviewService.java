package proj.stepUp.service;

import java.util.List;

import proj.stepUp.vo.ReviewVO;

public interface ReviewService {
	public int insertRivew(ReviewVO vo);
	public List<ReviewVO> selectReview(ReviewVO vo);
	public int selectCount(int prdIndex);
	public int selectCheckReview(ReviewVO vo);
	public int deleteReview(ReviewVO vo);
	public ReviewVO selectReviewModify(int reviewIndex);
	public int updateReview(ReviewVO vo);
	public List<ReviewVO> selectMyReview(int userIndex);
}
