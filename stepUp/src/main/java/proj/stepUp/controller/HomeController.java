package proj.stepUp.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import proj.stepUp.service.ProductService;
import proj.stepUp.vo.ProductVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private ProductService productService;
	
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
		List<ProductVO> newProduct = productService.selectProductByDate(maxPrd);
		model.addAttribute("newProduct", newProduct);
		
		//상품정보(판매순)
		maxPrd = 15;
		List<ProductVO> bestProduct = productService.selectProductSales(maxPrd);
		model.addAttribute("bestProduct", bestProduct);
		
		return "index";
	}
	
	
}
