package proj.stepUp.service;

import proj.stepUp.vo.ProductVO;

public interface ProductService {
	public int insertProduct(ProductVO vo);
	
	public ProductVO selectProductIndex(int prdIndex);
}
