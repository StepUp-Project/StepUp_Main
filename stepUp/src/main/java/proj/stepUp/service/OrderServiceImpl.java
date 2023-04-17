package proj.stepUp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.OrderDAO;
import proj.stepUp.vo.OrderVO;
import proj.stepUp.vo.ReviewVO;

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

	@Override
	public int selectByOrder(ReviewVO vo) {
		System.out.println("서비스 진입");
		return orderDAO.selectByOrder(vo);
	}

}
