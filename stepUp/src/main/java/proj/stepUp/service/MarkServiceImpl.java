package proj.stepUp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.MarkDAO;
import proj.stepUp.vo.MarkVO;

@Service
public class MarkServiceImpl implements MarkService{
	
	@Autowired
	private MarkDAO markDAO;
	
	@Override
	public int insertMark(MarkVO vo) {//찜 목록 추가
		return markDAO.insertMark(vo);
	}

	@Override
	public int deleteMark(MarkVO vo) {//찜목록 삭제
		return markDAO.deleteMark(vo);
	}

	@Override
	public MarkVO selectMarkByAll(MarkVO vo) {//찜목록 조회
		return markDAO.selectMarkByAll(vo);
	}

}
