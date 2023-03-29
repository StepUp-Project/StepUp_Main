package proj.stepUp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import proj.stepUp.service.NoticeService;
import proj.stepUp.vo.NoticeBoardVO;
import proj.stepUp.vo.SearchVO;


@RequestMapping(value="/notice")	
@Controller

public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value="/notice.do", method = RequestMethod.GET)
	public String notice(Model model, SearchVO svo) {
		
		List<NoticeBoardVO> list = noticeService.list(svo);
		model.addAttribute("blist", list);
		return "notice/notice_view";
	}	
	
	
	@RequestMapping(value="/notice_write.do", method = RequestMethod.GET)
	public String noticewrite() {
		
		return "notice/notice_write";
	}
	
	
	

}
