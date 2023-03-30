package proj.stepUp.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import proj.stepUp.service.ProductImgService;
import proj.stepUp.service.ProductService;
import proj.stepUp.vo.ProductImgVO;
import proj.stepUp.vo.ProductVO;
import proj.stepUp.vo.SizeVO;

@RequestMapping(value="/product")
@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductImgService producImgService;
	
	@RequestMapping(value="registration.do", method = RequestMethod.GET)
	public String registration() {
		
		
		return "product/registration" ;
	}
	
	@RequestMapping(value="registration.do", method = RequestMethod.POST)
	public String registrationOK(MultipartHttpServletRequest subFile,MultipartFile mainFile, ProductVO vo, ProductImgVO subVO, ArrayList<SizeVO> sizeVO,
			HttpServletRequest req) throws IOException {
		String rootPath = req.getSession().getServletContext().getRealPath("/");
		//String uploadMainFolder = "C:\\Users\\MYCOM\\git\\StepUp\\stepUp\\src\\main\\webapp\\resources\\prdmainimg";
		String uploadMainFolder = rootPath+"resources/prdmainimg";
		//String uploadSubFolder = "C:\\Users\\MYCOM\\git\\StepUp\\stepUp\\src\\main\\webapp\\resources\\prdsubimg";
		String uploadSubFolder = rootPath+"resources/prdsubimg";
		List<MultipartFile> subFileList =  subFile.getFiles("subFile");
		
		File mainDir = new File(uploadMainFolder);//위치 폴더가 존재하는지 확인
		File subDir = new File(uploadSubFolder);
		if(!mainDir.exists()) {
			mainDir.mkdirs();
		}
		if(!subDir.exists()) {
			subDir.mkdirs();
		}
		
		
		String prdOname = mainFile.getOriginalFilename();		//원본 파일이름
		String prdRname = System.currentTimeMillis()+"_"+prdOname;//저장용 파일이름
		prdRname = new String(prdRname.getBytes("utf-8"),"8859_1");
		mainFile.transferTo(new File(uploadMainFolder, prdRname));//새로운 파일이름으로 저장
		vo.setPrdOname(prdOname);
		vo.setPrdRname(prdRname);
		System.out.println(vo.getPrdCnt());
		int prdIndex = productService.insertProduct(vo);
		System.out.println(prdIndex);
		
		for(SizeVO i : sizeVO) {//진입이 안됨
			System.out.println("사이즈 반복문 진입");
			System.out.println(i.getSiezStock());
			System.out.println(i.getSizeKind());
		}
		
		for(MultipartFile sub : subFileList) {
			String prdImgOname = sub.getOriginalFilename();
			String prdImgRname = System.currentTimeMillis() + "_" + prdImgOname;
			prdImgRname = new String(prdImgRname.getBytes("utf-8"),"8859_1");
			sub.transferTo(new File(uploadSubFolder, prdImgRname));
			subVO.setPrdImgOname(prdImgOname);
			subVO.setPrdImgRname(prdImgRname);
			subVO.setPrdIndex(prdIndex);
			int result = producImgService.insertProductImg(subVO);
		}
		

		
		return "product/registration" ;
	}
}
