package proj.stepUp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.CartVO;

@Repository
public class CartDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertCart(CartVO vo) {
		return sqlSession.insert("proj.stepUp.mapper.cartMapper.insertCart", vo);
	}
}
