package proj.stepUp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.ProductImgVO;

@Repository
public class ProductImgDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertProductImg(ProductImgVO vo) {
		return sqlSession.insert("proj.stepUp.mapper.productImgMapper.insertProductImg", vo);
	}
}
