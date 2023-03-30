package proj.stepUp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.ProductVO;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertProduct(ProductVO vo) {
		System.out.println("DAO¡¯¿‘");
		return sqlSession.insert("proj.stepUp.mapper.productMapper.insertProduct", vo);
	}
}
