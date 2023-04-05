package proj.stepUp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import proj.stepUp.service.ReviewService;
import proj.stepUp.vo.ReviewVO;

@RequestMapping(value="/review")
@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value="/insert.do", method = RequestMethod.POST)
	public String insertReview(ReviewVO vo) {
		System.out.println(vo.getPrdIndex());
		System.out.println(vo.getReviewContent());
		System.out.println(vo.getReviewScore());
		System.out.println(vo.getUserIndex());
		int result = reviewService.insertRivew(vo);
		return "redirect:/product/view.do?prdIndex="+vo.getPrdIndex();
	}
}
