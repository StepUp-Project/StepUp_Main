package proj.stepUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.FreeBoardDAO;
import proj.stepUp.vo.FreeBoardVO;
import proj.stepUp.vo.SearchVO;

@Service
public class FreeServiceImpl implements FreeService {

	@Autowired
	private FreeBoardDAO freeBoardDAO;
	
	
	@Override
	public List<FreeBoardVO> list(SearchVO svo) {
		
		return freeBoardDAO.list(svo);
	}

}
