package proj.stepUp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="/order")
@Controller
public class OrderController {
	
	@RequestMapping(value = "managerOrder.do", method = RequestMethod.GET)
	public String managerOrderList() {
				
		return "order/manager";
	}
	
	@RequestMapping(value = "managerInfo.do", method = RequestMethod.GET)
	public String managerInfo() {
				
		return "order/managerInfo";
	}
}
