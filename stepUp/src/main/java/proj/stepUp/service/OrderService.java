package proj.stepUp.service;

import proj.stepUp.vo.OrderVO;

public interface OrderService {
	public int selectOrderNum(String num);	
	public int insertOrder(OrderVO vo);
}
