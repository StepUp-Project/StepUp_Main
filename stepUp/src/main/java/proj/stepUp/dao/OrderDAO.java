package proj.stepUp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.OrderVO;

@Repository
public class OrderDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public int selectOrderNum(String num) {//주문번호 중복 확인
		return sqlSession.selectOne("proj.stepUp.mapper.orderMapper.selectOrderNum", num);
	}
	
	public int insertOrder(OrderVO vo) {//주문 생성
		return sqlSession.insert("proj.stepUp.mapper.orderMapper.insertOrder", vo);
	}
}
