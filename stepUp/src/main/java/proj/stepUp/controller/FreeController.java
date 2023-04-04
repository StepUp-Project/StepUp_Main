package proj.stepUp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import proj.stepUp.service.FreeService;
import proj.stepUp.util.PagingUtil;
import proj.stepUp.vo.EventBoardVO;
import proj.stepUp.vo.FreeBoardVO;
import proj.stepUp.vo.SearchVO;
import proj.stepUp.vo.UserVO;


@RequestMapping(value="/free")	
@Controller

public class FreeController {
	
	@Autowired
	private FreeService freeService;
	
	@RequestMapping(value="/free.do")
	public String free(Model model, SearchVO svo) {
		
		int nowPage = 1;
		if(svo.getNowPage() != 0 ) {
			nowPage = svo.getNowPage();
		}
		List<FreeBoardVO> cntTotal = freeService.cntTotal(svo);
		int totalCnt = cntTotal.get(1).getTotal();
		PagingUtil paging = new PagingUtil(totalCnt,nowPage, 10);
		List<FreeBoardVO> list = freeService.list(svo);
		
		System.out.println("getStart:::"+paging.getStart());
		System.out.println("totalCnt:::"+totalCnt);
		System.out.println("getPerPage:::"+paging.getPerPage());
		System.out.println("getNowPage:::"+paging.getNowPage());
		System.out.println("getEndPage:::"+paging.getEndPage());
		
		model.addAttribute("blist", list);
		model.addAttribute("paging", paging);

		return "free/free_list";
	}	
	
	
	@RequestMapping(value="/free_write.do", method = RequestMethod.GET)
	public String freewrite() {
		
		return "free/free_write";
	}
	
	@RequestMapping(value="/free_view.do", method = RequestMethod.GET)
	public String freeview(int freeIndex, Model model) {
		FreeBoardVO vo = freeService.selectByIndex(freeIndex);
		model.addAttribute("vo", vo);
		
		
		return "free/free_view";
	}
	
	@RequestMapping(value="/free_write.do", method = RequestMethod.POST)
	public String freewrite(FreeBoardVO vo, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		UserVO loginUserVO = (UserVO)session.getAttribute("login");
		vo.setUserIndex(loginUserVO.getUserIndex());
		int result = freeService.insert(vo);
		
		return "redirect:/free/free_view.do?freeIndex="+vo.getFreeIndex();
	}
	
}
