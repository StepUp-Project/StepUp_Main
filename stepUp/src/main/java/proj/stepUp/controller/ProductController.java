package proj.stepUp.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import proj.stepUp.service.ProductService;
import proj.stepUp.vo.ProductImgVO;
import proj.stepUp.vo.ProductVO;

@RequestMapping(value="/product")
@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="registration.do", method = RequestMethod.GET)
	public String registration() {
		
		
		return "product/registration" ;
	}
	
	@RequestMapping(value="registration.do", method = RequestMethod.POST)
	public String registrationOK(MultipartHttpServletRequest subFile,MultipartFile mainFile, ProductVO vo, ProductImgVO subVO) throws IOException {
		String uploadMainFolder = "C:\\Users\\MYCOM\\git\\StepUp\\stepUp\\src\\main\\webapp\\resources\\prdmainimg";
		String uploadSubFolder = "C:\\Users\\MYCOM\\git\\StepUp\\stepUp\\src\\main\\webapp\\resources\\prdsubimg";
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
		
		for(MultipartFile sub : subFileList) {
			String prdImgOname = sub.getOriginalFilename();
			String prdImgRname = System.currentTimeMillis() + "_" + prdImgOname;
			prdImgRname = new String(prdImgRname.getBytes("utf-8"),"8859_1");
			sub.transferTo(new File(uploadSubFolder, prdImgRname));
			subVO.setPrdImgOname(prdImgOname);
			subVO.setPrdImgRname(prdImgRname);
			System.out.println("서브"+prdImgOname);
			System.out.println("서브"+prdImgRname);
		}
		
		return "product/registration" ;
	}
}
