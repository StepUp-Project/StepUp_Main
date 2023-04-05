package proj.stepUp.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import proj.stepUp.service.ProductImgService;
import proj.stepUp.service.ProductService;
import proj.stepUp.service.SizeService;
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
	@Autowired
	private SizeService sizeService;
	
	
	
	@RequestMapping(value="registration.do", method = RequestMethod.GET)
	public String registration() {
		
		
		return "product/registration" ;
	}
	
	@RequestMapping(value="registration.do", method = RequestMethod.POST)
	public String registrationOK(MultipartHttpServletRequest subFile,MultipartFile mainFile, ProductVO vo, ProductImgVO subVO, 
			@RequestParam("sizeKind") String[] sizeKind,
			@RequestParam("sizeStock") int[] sizeStock,
			HttpServletRequest req) throws IOException {
		String rootPath = req.getSession().getServletContext().getRealPath("/");
		//String uploadMainFolder = "C:\\Users\\MYCOM\\git\\StepUp\\stepUp\\src\\main\\webapp\\resources\\prdmainimg";
		String uploadMainFolder = rootPath+"resources/prdmainimg";
		//String uploadSubFolder = "C:\\Users\\MYCOM\\git\\StepUp\\stepUp\\src\\main\\webapp\\resources\\prdsubimg";
		String uploadSubFolder = rootPath+"resources/prdsubimg";
		List<MultipartFile> subFileList =  subFile.getFiles("subFile");
		
		System.out.println("�н����"+uploadMainFolder);
		
		File mainDir = new File(uploadMainFolder);//��ġ ������ �����ϴ��� Ȯ��
		File subDir = new File(uploadSubFolder);
		if(!mainDir.exists()) {
			mainDir.mkdirs();
		}
		if(!subDir.exists()) {
			subDir.mkdirs();
		}
		
		
		String prdOname = mainFile.getOriginalFilename();		//���� �����̸�
		String prdRname = System.currentTimeMillis()+"_"+prdOname;//����� �����̸�
		prdRname = new String(prdRname.getBytes("utf-8"),"8859_1");
		mainFile.transferTo(new File(uploadMainFolder, prdRname));//���ο� �����̸����� ����
		vo.setPrdOname(prdOname);
		vo.setPrdRname(prdRname);
		productService.insertProduct(vo);
		int prdIndex = vo.getPrdIndex();
		

		for(MultipartFile sub : subFileList) {//���� �̹��� ����
			String prdImgOname = sub.getOriginalFilename();
			String prdImgRname = System.currentTimeMillis() + "_" + prdImgOname;
			prdImgRname = new String(prdImgRname.getBytes("utf-8"),"8859_1");
			sub.transferTo(new File(uploadSubFolder, prdImgRname));
			subVO.setPrdImgOname(prdImgOname);
			subVO.setPrdImgRname(prdImgRname);
			subVO.setPrdIndex(prdIndex);
			int result = producImgService.insertProductImg(subVO);
		}
		
		
		for(int i = 0; i < sizeKind.length; i++) {//��ǰ ����� ���� ����
			SizeVO sizeVO = new SizeVO();
			String sizekind = sizeKind[i];
			int sizestock = sizeStock[i];
			sizeVO.setSizeKind(sizekind);
			sizeVO.setSizeStock(sizestock);
			sizeVO.setPrdIndex(prdIndex);
			sizeService.insertSize(sizeVO);
		}

		
		return "product/registration" ;
	}
	
	@RequestMapping(value="/test.do", method = RequestMethod.GET)
	public String test() {
		
		return "product/test";
	}
	
	@RequestMapping(value="/test.do", method = RequestMethod.POST)
	public String testOK(int prdIndex, Model model, RedirectAttributes rttr) {
		ProductVO prdVO = productService.selectProductIndex(prdIndex);
		if(prdVO != null) {
			rttr.addFlashAttribute("prdVO", prdVO);
		}
		
		return "redirect:/product/test.do";
	}
	
	@RequestMapping(value="/view.do", method = RequestMethod.GET)
	public String view(int prdIndex, Model model) {
		ProductVO prdVO = productService.selectProductIndex(prdIndex);
		List<ProductImgVO> prdImgVO = producImgService.selectByProductIndex(prdIndex);
		if(prdVO != null) {
			model.addAttribute("prdVO", prdVO);//상품 정보
			model.addAttribute("prdImgVO", prdImgVO);//상품 서브 이미지
		}
		
		return "product/product_view";
	}
}
