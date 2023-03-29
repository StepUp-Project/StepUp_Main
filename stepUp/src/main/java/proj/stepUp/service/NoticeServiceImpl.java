package proj.stepUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.NoticeBoardDAO;
import proj.stepUp.vo.NoticeBoardVO;
import proj.stepUp.vo.SearchVO;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeBoardDAO noticeBoardDAO;

	@Override
	public List<NoticeBoardVO> list(SearchVO svo) {
		
		return noticeBoardDAO.list(svo);
	}
	
	
}
