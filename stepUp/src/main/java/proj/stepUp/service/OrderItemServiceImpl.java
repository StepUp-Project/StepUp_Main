package proj.stepUp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.OrderItemDAO;
import proj.stepUp.vo.OrderItemVO;

@Service
public class OrderItemServiceImpl implements OrderItemService {
	
	@Autowired
	private OrderItemDAO orderItemDAO;
	
	@Override
	public int insertOrderItem(OrderItemVO vo) {
		return orderItemDAO.insertOrderItem(vo);
	}

}
