package proj.stepUp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@RequestMapping(value="/notice")	
@Controller

public class NoticeController {
	
	@RequestMapping(value="/notice.do", method = RequestMethod.GET)
	public String notice() {
		
		return "notice/notice_view";
	}	
	
	
	@RequestMapping(value="/notice_write.do", method = RequestMethod.GET)
	public String noticewrite() {
		
		return "notice/notice_write";
	}
	
	
	

}
