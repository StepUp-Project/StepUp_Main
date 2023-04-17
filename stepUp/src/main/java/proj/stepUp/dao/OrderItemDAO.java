package proj.stepUp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.OrderItemVO;

@Repository
public class OrderItemDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public int insertOrderItem(OrderItemVO vo) {
		return sqlSession.insert("proj.stepUp.mapper.orderItemMapper.insertOrderItem", vo);
	}
}
