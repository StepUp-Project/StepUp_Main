package proj.stepUp.service;

import java.util.List;

import proj.stepUp.vo.QnaVO;
import proj.stepUp.vo.SearchVO;

public interface QnaService {
	public List<QnaVO> list(SearchVO svo);
	public List<QnaVO> listByUserIdx(int userIndex);
	public List<QnaVO> cntTotal(SearchVO svo);
	public QnaVO selectByIndex(int qnaIndex);
	public int insert(QnaVO vo);
	public int update(QnaVO vo);
	public int delete(int qnaIndex);
	public int qnarsp(QnaVO vo);
}
