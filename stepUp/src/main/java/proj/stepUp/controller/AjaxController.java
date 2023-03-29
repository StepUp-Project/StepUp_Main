package proj.stepUp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import proj.stepUp.service.UserService;
import proj.stepUp.util.NaverSMS;
import proj.stepUp.vo.UserVO;

@RequestMapping(value="/ajax")
@Controller
public class AjaxController {

	@Autowired
	private UserService userService;
	
	
	@ResponseBody
	@RequestMapping(value="/checkId.do", method = RequestMethod.POST)
	public String checkId(String userId){
		
		int result = result = userService.checkId(userId);	
		if(result > 0) {
			return "failse";
		}else {
			return "true";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/checkNick.do", method = RequestMethod.POST)
	public String checkNick(String userNick){
		
		int result = result = userService.checkNick(userNick);	
		if(result > 0) {
			return "failse";
		}else {
			return "true";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/checkPhone.do", method = RequestMethod.POST)
	public String checkPhone(String userPhone){
		
		NaverSMS sms = new NaverSMS();
		
		String result =  sms.sendSMS(userPhone);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/checkPchNum.do", method = RequestMethod.POST)
	public String checkPchNum(String userPhone){
		
		NaverSMS sms = new NaverSMS();
		
		String result =  sms.sendSMS(userPhone);
		
		return result;
	}
	

}
