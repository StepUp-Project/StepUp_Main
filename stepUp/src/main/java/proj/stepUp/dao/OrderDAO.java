package proj.stepUp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.OrderVO;

@Repository
public class OrderDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public int selectOrderNum(String num) {
		return sqlSession.selectOne("proj.stepUp.mapper.orderMapper.selectOrderNum", num);
	}
}
