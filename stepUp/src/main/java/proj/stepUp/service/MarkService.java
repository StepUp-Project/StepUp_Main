package proj.stepUp.service;

import proj.stepUp.vo.MarkVO;

public interface MarkService {
	public int insertMark(MarkVO vo);
	public int deleteMark(MarkVO vo);
	public MarkVO selectMarkByAll(MarkVO vo);
}
