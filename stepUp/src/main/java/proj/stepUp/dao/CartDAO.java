package proj.stepUp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.CartVO;

@Repository
public class CartDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<CartVO> list(int userIndex){
		return sqlSession.selectList("proj.stepUp.mapper.cartMapper.selectAll", userIndex);
	}
	
	public int deleteCart(int cartIndex) {
		return sqlSession.delete("proj.stepUp.mapper.cartMapper.deleteCart", cartIndex);
	}
}
