package proj.stepUp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import proj.stepUp.vo.ProductVO;

@RequestMapping(value="/product")
@Controller
public class ProductController {

	@RequestMapping(value="registration.do", method = RequestMethod.GET)
	public String registration() {
		
		
		return "product/registration" ;
	}
	
	@RequestMapping(value="registration.do", method = RequestMethod.POST)
	public String registrationOK(ProductVO vo) {
		System.out.println(vo.getPrdCode());
		System.out.println("진입");
		return "product/registration" ;
	}
}
