package proj.stepUp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.OrderVO;
import proj.stepUp.vo.ReviewVO;

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
	
	public int selectByOrder(ReviewVO vo) {//해당 상품 주문 기록이 존재하는지 확인
		System.out.println("dao 진입");
		return sqlSession.selectOne("proj.stepUp.mapper.orderMapper.selectByOrder", vo);
	}
}
