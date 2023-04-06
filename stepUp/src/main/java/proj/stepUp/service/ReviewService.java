package proj.stepUp.service;

import java.util.List;

import proj.stepUp.vo.ReviewVO;

public interface ReviewService {
	public int insertRivew(ReviewVO vo);
	public List<ReviewVO> selectByPrdIndex(int prdIndex);
}
