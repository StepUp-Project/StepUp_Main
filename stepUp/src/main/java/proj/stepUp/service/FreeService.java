package proj.stepUp.service;

import java.util.List;

import proj.stepUp.vo.FreeBoardVO;
import proj.stepUp.vo.SearchVO;

public interface FreeService {
	public List<FreeBoardVO> list(SearchVO svo);
}
