package proj.stepUp.service;

import proj.stepUp.vo.OrderVO;
import proj.stepUp.vo.ReviewVO;

public interface OrderService {
	public int selectOrderNum(String num);	
	public int insertOrder(OrderVO vo);
	public int selectByOrder(ReviewVO vo);
}
