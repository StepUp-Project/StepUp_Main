package proj.stepUp.service;

import java.util.List;

import proj.stepUp.vo.CartVO;

public interface CartService {
	public List<CartVO> list(int userIndex);
	public int deleteCart(int cartIndex);

}
