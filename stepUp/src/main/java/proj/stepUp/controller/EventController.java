package proj.stepUp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@RequestMapping(value="/event")	
@Controller

public class EventController {
	
	
	@RequestMapping(value="/event.do", method = RequestMethod.GET)
	public String event() {
		
		return "event/event_view";
	}	
		
	
	@RequestMapping(value="/event_write.do", method = RequestMethod.GET)
	public String eventwrite() {
		
		return "event/event_write";
	}
	
	
	
	

}
