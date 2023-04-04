package proj.stepUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.ProductDAO;
import proj.stepUp.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public int insertProduct(ProductVO vo) {
		// TODO Auto-generated method stub
		return productDAO.insertProduct(vo);
	}

	@Override
	public ProductVO selectProductIndex(int prdIndex) {
		// TODO Auto-generated method stub
		return productDAO.selectProductIndex(prdIndex);
	}

	@Override
	public List<ProductVO> selectProductByDate(int maxPrd) {
		// TODO Auto-generated method stub
		return productDAO.selectProductByDate(maxPrd);
	}

	@Override
	public List<ProductVO> selectProductSales(int maxPrd) {
		// TODO Auto-generated method stub
		return productDAO.selectProductSales(maxPrd);
	}
	
}
