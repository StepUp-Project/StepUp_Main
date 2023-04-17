package proj.stepUp.service;

import java.util.List;

import proj.stepUp.vo.OrderVO;
import proj.stepUp.vo.ReviewVO;
import proj.stepUp.vo.SearchVO;

public interface OrderService {
	public int selectOrderNum(String num);	
	public int insertOrder(OrderVO vo);
	public int selectByOrder(ReviewVO vo);
	public List<OrderVO> selectManager(SearchVO vo);
	public int selectManagerCount(SearchVO vo);
}
