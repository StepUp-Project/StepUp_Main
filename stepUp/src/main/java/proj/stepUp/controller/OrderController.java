package proj.stepUp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import proj.stepUp.service.OrderItemService;
import proj.stepUp.service.OrderService;
import proj.stepUp.vo.OrderItemVO;
import proj.stepUp.vo.OrderVO;

@RequestMapping(value="/order")
@Controller
public class OrderController {
	
	@Autowired
	private OrderService orederService;
	@Autowired
	private OrderItemService orderItemService;
	
	@RequestMapping(value = "managerOrder.do", method = RequestMethod.GET)
	public String managerOrderList() {
				
		return "order/manager";
	}
	
	@RequestMapping(value = "managerInfo.do", method = RequestMethod.GET)
	public String managerInfo(int orderIndex, Model model) {
		
		OrderVO orderVO = orederService.selectByOrderIndex(orderIndex);
		List<OrderItemVO> orderItemVO = orderItemService.selectOrderInfo(orderIndex);
		model.addAttribute("orderVO", orderVO);
		model.addAttribute("orderItemVO", orderItemVO);
		
		return "order/managerInfo";
	}
}
