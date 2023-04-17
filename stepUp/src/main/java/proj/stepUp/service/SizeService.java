package proj.stepUp.service;

import java.util.List;

import proj.stepUp.vo.SizeVO;

public interface SizeService {
	public int insertSize(SizeVO vo);
	public List<SizeVO> selectByPrdIndex(int prdIndex);
	public int updateSizeStock(SizeVO vo);
}
