package proj.stepUp.service;

import java.util.List;

import proj.stepUp.vo.ReVO;

public interface ReService {
	public List<ReVO> list(int freeIndex);
	public int insert(ReVO vo);
	public int update(ReVO vo);
	public int delete(int reIndex);

}
