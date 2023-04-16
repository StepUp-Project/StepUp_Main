package proj.stepUp.service;

import java.util.List;

import proj.stepUp.vo.ProductVO;
import proj.stepUp.vo.SearchVO;

public interface ProductService {
	public int insertProduct(ProductVO vo);	
	public ProductVO selectProductIndex(int prdIndex);
	public List<ProductVO> selectProductByDate(int maxPrd);
	public List<ProductVO> selectProductSales(int maxPrd);
	public List<ProductVO> selectBrandPage(SearchVO searchVO);
	public int selectBrandToal(SearchVO searchVO);
	public int selectByPrdCode(String prdCode);
}
