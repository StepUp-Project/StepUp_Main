package proj.stepUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.vo.EventBoardVO;
import proj.stepUp.dao.EventBoardDAO;
import proj.stepUp.vo.SearchVO;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventBoardDAO eventBoardDAO;
	
	@Override
	public List<EventBoardVO> list(SearchVO svo) {
		return eventBoardDAO.list(svo);
	}

}
