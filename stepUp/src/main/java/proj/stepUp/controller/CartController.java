package proj.stepUp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import proj.stepUp.service.CartService;
import proj.stepUp.vo.CartVO;

@RequestMapping(value="/cart")
@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@RequestMapping(value="/cart.do", method = RequestMethod.GET)
	public String cart(Model model) {
		List<CartVO> list = cartService.list(1); //1말고 userIndex 받아오는걸로 바꿔야함
		model.addAttribute("clist", list);
		return "cart/cart";
	}
	
	@RequestMapping(value="/cartdel.do", method = RequestMethod.GET)
	public void deleteCart(int cartIndex, HttpServletResponse rsp, HttpServletRequest req) throws IOException {
		int result = cartService.deleteCart(cartIndex);
		PrintWriter pw = rsp.getWriter();
		pw.append("<script>location.href='"+req.getContextPath()+"/cart/cart.do'</script>");
		pw.flush();
	}
}
