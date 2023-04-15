package proj.stepUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.CartDAO;
import proj.stepUp.vo.CartVO;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartDAO cartDAO;
	
	@Override
	public List<CartVO> list(int userIndex){
		return cartDAO.list(userIndex);
	}

	@Override
	public int deleteCart(int cartIndex) {
		return cartDAO.deleteCart(cartIndex);
	}


}
