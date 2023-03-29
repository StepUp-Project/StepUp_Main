package proj.stepUp.service;

import java.util.List;

import proj.stepUp.vo.EventBoardVO;
import proj.stepUp.vo.SearchVO;

public interface EventService {
	public List<EventBoardVO> list(SearchVO svo);
}
