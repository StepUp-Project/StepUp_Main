package proj.stepUp.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.owasp.encoder.Encode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import proj.stepUp.service.FreeService;
import proj.stepUp.service.ReService;
import proj.stepUp.util.PagingUtil;
import proj.stepUp.vo.FreeBoardVO;
import proj.stepUp.vo.ReVO;
import proj.stepUp.vo.SearchVO;
import proj.stepUp.vo.UserVO;


@RequestMapping(value="/free")	
@Controller

public class FreeController {
	
	@Autowired
	private FreeService freeService;
	@Autowired
	private ReService reService;
	
	@RequestMapping(value="/free.do")
	public String free(Model model, SearchVO svo) {
		
		int nowPage = 1;
		if(svo.getNowPage() != 0 ) {
			nowPage = svo.getNowPage();
		}
		List<FreeBoardVO> cntTotal = freeService.cntTotal(svo);
		int totalCnt = 0;
		if(cntTotal.size()>0) {
			totalCnt = cntTotal.get(0).getTotal();
		}
		
		PagingUtil paging = new PagingUtil(totalCnt,nowPage, 10);
		List<FreeBoardVO> list = freeService.list(svo);
		
		model.addAttribute("blist", list);
		model.addAttribute("paging", paging);
		
		return "free/free_list";
	}	
	
	
	@RequestMapping(value="/free_write.do", method = RequestMethod.GET)
	public String freewrite() {
		
		return "free/free_write";
	}
	
	@RequestMapping(value="/free_write.do", method = RequestMethod.POST)
	public String freewrite(FreeBoardVO vo, HttpServletRequest req) {
		
		HttpSession session = req.getSession();

		if(req.getAttribute("freeCnt") != null) {
			vo.setFreeCnt((String)req.getAttribute("freeCnt"));
		}
		
		if(req.getAttribute("freeTitle") != null){
			vo.setFreeTitle(Encode.forHtmlAttribute((String) req.getAttribute("freeTitle")));
		}
		
		UserVO loginUserVO = (UserVO)session.getAttribute("login");
		vo.setUserIndex(loginUserVO.getUserIndex());
		int result = freeService.insert(vo);
		
		return "redirect:/free/free_view.do?freeIndex="+vo.getFreeIndex();
	}
	
	@RequestMapping(value="/free_view.do", method = RequestMethod.GET)
	public String freeview(int freeIndex, Model model, HttpServletRequest req, HttpServletResponse res) {
		
		 Cookie[] cookies = req.getCookies();
		    boolean isExists = false;
		    if (cookies != null) {
		        for (Cookie cookie : cookies) {
		            if (cookie.getName().equals("freeIndex_" + freeIndex)) {
		                isExists = true;
		                break;
		            }
		        }
		    }
		    // 쿠키 생성 후 조회수 증가
		    if (!isExists) {
		        Cookie cookie = new Cookie("freeIndex_" + freeIndex, String.valueOf(freeIndex));
		        cookie.setMaxAge(60 * 60 * 24); // 쿠키 유효 1일
		        res.addCookie(cookie);
		        freeService.hitcount(freeIndex);
		    }
		
		
		
		FreeBoardVO vo = freeService.selectByIndex(freeIndex);
		List<ReVO> rList = reService.list(freeIndex);
		model.addAttribute("vo", vo);
		
		if(rList != null) {
		model.addAttribute("rList", rList);
		}
		return "free/free_view";
	}
	
	@RequestMapping(value="/free_modify.do", method = RequestMethod.GET)
	public String modify(int freeIndex, Model model) {
		FreeBoardVO vo = freeService.selectByIndex(freeIndex);
		model.addAttribute("vo", vo);
		
		
		
		System.out.println(vo.getFreeIndex());
		System.out.println(vo.getFreeTitle());
		System.out.println(vo.getUserIndex());
		
		return "free/free_modify";
	}
	
	@RequestMapping(value="/free_modify.do", method = RequestMethod.POST)
	public String modify(FreeBoardVO vo , HttpServletRequest req) {
		
		if(req.getAttribute("freeCnt") != null) {
			vo.setFreeCnt((String)req.getAttribute("freeCnt"));
		}
		
		if(req.getAttribute("freeTitle") != null){
			vo.setFreeTitle(Encode.forHtmlAttribute((String) req.getAttribute("freeTitle")));
		}
		
		System.out.println(vo.getFreeIndex());
		System.out.println(vo.getFreeTitle());
		System.out.println(vo.getUserIndex());
		
		int result = freeService.update(vo);
		if(result>0) {
			return "redirect:/free/free_view.do?freeIndex="+vo.getFreeIndex();
		}else {
			return "redirect:/free/free_view.do?freeIndex="+vo.getFreeIndex()+"&updateYN=N";
		}
	}
	
	
	
	@RequestMapping(value="/free_delete.do", method = RequestMethod.POST)
	public String delete(int freeIndex) {
		int result = freeService.delete(freeIndex);
		
		return "redirect:/free/free.do";
	}

	
	// 댓글 컨트롤러 부분
	
	@RequestMapping(value="/re_write.do", method = RequestMethod.POST)
	public String rewrite(ReVO vo, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		if(req.getAttribute("reCnt") != null){
			vo.setReCnt(Encode.forHtmlAttribute((String) req.getAttribute("reCnt")));
		}
		
		
		UserVO loginUserVO = (UserVO)session.getAttribute("login");
		vo.setUserIndex(loginUserVO.getUserIndex());
		int result = reService.insert(vo);
		
		return "redirect:/free/free_view.do?freeIndex="+vo.getFreeIndex();
	}
	
	@RequestMapping(value="/re_del.do", method = RequestMethod.POST)
	public String delete(int reIndex , int freeIndex) {
		int result = reService.delete(reIndex);
		
		return "redirect:/free/free_view.do?freeIndex="+freeIndex;
	}
	
	@RequestMapping(value="/re_edit.do", method = RequestMethod.POST)
	public String reedit(ReVO vo, HttpServletRequest req) {
		
		if(req.getAttribute("reCnt") != null){
			vo.setReCnt(Encode.forHtmlAttribute((String) req.getAttribute("reCnt")));
		}
		
		int result = reService.update(vo);
		if(result>0) {
			return "redirect:/free/free_view.do?freeIndex="+vo.getFreeIndex();
		}else {
			return "redirect:/free/free_view.do?freeIndex="+vo.getFreeIndex()+"&updateYN=N";
		}
	}
	
}
