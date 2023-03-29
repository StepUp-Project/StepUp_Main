package proj.stepUp.service;

import java.util.List;

import proj.stepUp.vo.NoticeBoardVO;
import proj.stepUp.vo.SearchVO;

public interface NoticeService {
	
	public List<NoticeBoardVO> list(SearchVO svo);
}
