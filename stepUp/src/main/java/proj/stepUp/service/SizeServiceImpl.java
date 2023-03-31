package proj.stepUp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.SizeDAO;
import proj.stepUp.vo.SizeVO;

@Service
public class SizeServiceImpl implements SizeService{
	
	@Autowired
	private SizeDAO sizeDAO;
	
	@Override
	public int insertSize(SizeVO vo) {
		// TODO Auto-generated method stub
		return sizeDAO.insertSize(vo);
	}

}
