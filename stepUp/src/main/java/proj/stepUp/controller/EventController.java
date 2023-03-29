package proj.stepUp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import proj.stepUp.service.EventService;
import proj.stepUp.vo.EventBoardVO;
import proj.stepUp.vo.SearchVO;


@RequestMapping(value="/event")	
@Controller

public class EventController {
	
	@Autowired
	private EventService eventService;
	
	@RequestMapping(value="/event.do", method = RequestMethod.GET)
	public String event(Model model, SearchVO svo) {
		
		List<EventBoardVO> list = eventService.list(svo);
		model.addAttribute("blist", list);
		return "event/event_view";
	}	
		
	
	@RequestMapping(value="/event_write.do", method = RequestMethod.GET)
	public String eventwrite() {
		
		return "event/event_write";
	}
	
	
	
	

}
