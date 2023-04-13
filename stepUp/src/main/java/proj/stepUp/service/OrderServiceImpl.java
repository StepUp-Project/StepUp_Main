package proj.stepUp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.OrderDAO;
import proj.stepUp.vo.OrderVO;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	public int selectOrderNum(String num) {
		return orderDAO.selectOrderNum(num);
	}

	@Override
	public int insertOrder(OrderVO vo) {
		return orderDAO.insertOrder(vo);
	}

}
