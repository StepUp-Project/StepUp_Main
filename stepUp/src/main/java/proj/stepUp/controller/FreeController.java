package proj.stepUp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import proj.stepUp.service.FreeService;
import proj.stepUp.vo.FreeBoardVO;
import proj.stepUp.vo.SearchVO;


@RequestMapping(value="/free")	
@Controller

public class FreeController {
	
	@Autowired
	private FreeService freeService;
	
	@RequestMapping(value="/free.do")
	public String free(Model model, SearchVO svo) {
		
		List<FreeBoardVO> list = freeService.list(svo);
		model.addAttribute("blist", list);
		return "free/free_list";
	}	
	
	
	@RequestMapping(value="/free_write.do", method = RequestMethod.GET)
	public String freewrite() {
		
		return "free/free_write";
	}
	
	@RequestMapping(value="/free_view.do", method = RequestMethod.GET)
	public String freeview() {
		
		return "free/free_view";
	}
	
	
	
}
