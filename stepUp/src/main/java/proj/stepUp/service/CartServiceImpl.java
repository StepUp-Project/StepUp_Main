package proj.stepUp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.CartDAO;
import proj.stepUp.vo.CartVO;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDAO cartDAO;
	
	@Override
	public int insertCart(CartVO vo) {
		return cartDAO.insertCart(vo);
	}
	
}