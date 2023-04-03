package proj.stepUp.service;

import java.util.List;

import proj.stepUp.vo.ProductVO;

public interface ProductService {
	public int insertProduct(ProductVO vo);	
	public ProductVO selectProductIndex(int prdIndex);
	public List<ProductVO> selectProductByDate(int maxPrd);
}
