package proj.stepUp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.ProductImgDAO;
import proj.stepUp.vo.ProductImgVO;

@Service
public class ProductImgServiceImpl implements ProductImgService{
	
	@Autowired
	private ProductImgDAO productImgDAO;
	
	@Override
	public int insertProductImg(ProductImgVO vo) {
		// TODO Auto-generated method stub
		return productImgDAO.insertProductImg(vo);
	}

}
