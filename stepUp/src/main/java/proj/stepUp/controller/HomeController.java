package proj.stepUp.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import proj.stepUp.service.AdminService;
import proj.stepUp.service.ProductService;
import proj.stepUp.service.QnaService;
import proj.stepUp.vo.FreeBoardVO;
import proj.stepUp.vo.ProductVO;
import proj.stepUp.vo.SlideVO;
import proj.stepUp.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private QnaService qnaService;
	@Autowired
	private AdminService adminservice;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index(Model model) {
		//상품 정보(Date순)
		int maxPrd = 9;
		// 슬라이드 가져오기
		List<SlideVO> slideObj = adminservice.slideSelect();
		
		List<ProductVO> newProduct = productService.selectProductByDate(maxPrd);
		model.addAttribute("newProduct", newProduct);
		
		//상품정보(판매순)
		maxPrd = 15;
		List<ProductVO> bestProduct = productService.selectProductSales(maxPrd);
		model.addAttribute("bestProduct", bestProduct);
		//슬라이드 삽입
		model.addAttribute("blist", slideObj);
		
		System.out.println("slideObj:::"+slideObj);
		System.out.println("slideObj:::"+slideObj.size());
		
		return "index";
	}
	
	@RequestMapping(value = "/location.do", method = RequestMethod.GET)
	public String location() {

		return "about/location";
	}
	
	@RequestMapping(value = "/weare.do", method = RequestMethod.GET)
	public String weare() {

		return "about/weare";
	}
	
	@RequestMapping(value = "/admin.do", method = RequestMethod.GET)
	public String admin(Model model, UserVO vo) {
		
		List<UserVO> list = qnaService.restrictList(vo);
		model.addAttribute("blist", list);	
		
		return "user/admin_page";
	}
	
	
	@RequestMapping(value = "/slide.do", method = RequestMethod.POST)
	public String slide(MultipartFile mainFile, HttpServletRequest req, SlideVO slvo) throws IOException {
		String rootPath = req.getSession().getServletContext().getRealPath("/");
		String uploadMainFolder = rootPath+"resources/image/main";
		System.out.println("rootPath:::"+rootPath);
		System.out.println("uploadMainFolder:::"+uploadMainFolder);
		
		File mainDir = new File(uploadMainFolder);
		if(!mainDir.exists()) {
			mainDir.mkdirs();
		}
		String slideFileOname = mainFile.getOriginalFilename();
		String slideFileRname = System.currentTimeMillis()+"_"+slideFileOname;
		
		slideFileRname = new String(slideFileRname.getBytes("utf-8"),"8859_1");
		mainFile.transferTo(new File(uploadMainFolder, slideFileRname));
		
		slvo.setSlideFileOname(slideFileOname);
		slvo.setSlideFileRname(slideFileRname);
		
		System.out.println(uploadMainFolder);
	 	System.out.println(slvo.getSlideFileOname());
		System.out.println(slvo.getSlideFileRname());
	   	System.out.println(slvo.getSlideUrl());
		
	   	adminservice.slideinsert(slvo);
		return "user/admin_page";
	}
	
}
