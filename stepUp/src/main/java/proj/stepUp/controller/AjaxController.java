package proj.stepUp.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import proj.stepUp.service.CartService;
import proj.stepUp.service.MarkService;
import proj.stepUp.service.OrderItemService;
import proj.stepUp.service.OrderService;
import proj.stepUp.service.ProductService;
import proj.stepUp.service.ReviewService;
import proj.stepUp.service.SizeService;
import proj.stepUp.service.UserService;
import proj.stepUp.util.NaverSMS;
import proj.stepUp.util.PagingUtil;
import proj.stepUp.util.PaymentUtil;
import proj.stepUp.vo.CartVO;
import proj.stepUp.vo.MarkVO;
import proj.stepUp.vo.OrderItemVO;
import proj.stepUp.vo.OrderVO;
import proj.stepUp.vo.ProductVO;
import proj.stepUp.vo.ReviewVO;
import proj.stepUp.vo.SearchVO;
import proj.stepUp.vo.SizeVO;

@RequestMapping(value="/ajax")
@Controller
public class AjaxController {

	@Autowired
	private UserService userService;	
	@Autowired
	private MarkService markService;	
	@Autowired
	private CartService cartService;	
	@Autowired
	private ReviewService reviewService;	
	@Autowired
	private ProductService productService;	
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderItemService orderItemService;
	@Autowired
	private SizeService sizeService;
	
	@ResponseBody
	@RequestMapping(value="/checkId.do", method = RequestMethod.POST)
	public String checkId(String userId){
		int result = userService.checkId(userId);
		if(result > 0) {
			return "failse";
		}else {
			return "true";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/checkNick.do", method = RequestMethod.POST)
	public String checkNick(String userNick){
		int result = userService.checkNick(userNick);	
		if(result > 0) {
			return "failse";
		}else {
			return "true";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/checkPhone.do", method = RequestMethod.POST)	//인증번호 발송처리
	public void checkPhone(String userPhone, HttpServletRequest req){
		
		NaverSMS sms = new NaverSMS();
		
		String result =  sms.sendSMS(userPhone);
		HttpSession session = req.getSession();	
		session.setAttribute("phoneCode", result);
		session.setMaxInactiveInterval(300);
		return;
	}
	
	@ResponseBody
	@RequestMapping(value="/checkPchNum.do", method = RequestMethod.POST)	//인증번호 비교 처리
	public String checkPchNum(String PchNum, HttpServletRequest req){
		HttpSession session = req.getSession();	
		String phoneCode = (String)session.getAttribute("phoneCode");
		if(PchNum.equals(phoneCode)) {
			return "1";
		}else {
			return "0";
		}

	}
	
	@RequestMapping(value="/SummerNoteImageFile.do", produces = "application/json; charset=utf8", method = RequestMethod.POST)
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		String fileupload = request.getContextPath()+"/resources/fileupload";
		File cntDir = new File(fileupload);
		if(!cntDir.exists()) {
			cntDir.mkdirs();
		}
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url",request.getContextPath()+"/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	
		@ResponseBody
		@RequestMapping(value="/addMark.do", method = RequestMethod.POST)
		public String addMark(MarkVO vo, HttpServletRequest req){	//북마크 등록
			int result = markService.insertMark(vo);
			return result+"";
		}
		
		@ResponseBody
		@RequestMapping(value="/removeMark.do", method = RequestMethod.POST)
		public String removeMark(MarkVO vo, HttpServletRequest req){	//북마크 등록
			int result = markService.deleteMark(vo);
			return result+"";
		}
		
		
		@ResponseBody
		@RequestMapping(value="/inputCart.do", method = RequestMethod.POST)
		public String inputCart(String[] sizeIndex, String[] sizeStock, CartVO vo){	//cart 데이터 넘기는중
			try {
				for(int i = 0; i < sizeIndex.length; i++) {
					int size = Integer.parseInt(sizeIndex[i]);
					int stock =Integer.parseInt(sizeStock[i]);				
					vo.setSizeIndex(size);
					vo.setCartStock(stock);
					int result = cartService.insertCart(vo);
					if(result != 1) {
						return "0";
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "1";
		}
		
			
		@ResponseBody
		@RequestMapping(value="/prdPaging.do", method = RequestMethod.GET)	//review리스트 페이징 ajax 처리
		public List<ReviewVO> prdPagingList(int nowPage, ReviewVO vo, Model model, HttpServletRequest request) {
			HttpSession session = request.getSession();
			int totalCount = reviewService.selectCount(vo.getPrdIndex());//해당 제품페이지에 존재하는 총 상품리뷰 수
			PagingUtil paging = new PagingUtil(totalCount, nowPage, 5);
			vo.setStart(paging.getStart());
			vo.setPerPage(paging.getPerPage());
			List<ReviewVO> reviewVO = reviewService.selectReview(vo);	
			
			return reviewVO;
		}
		
		@ResponseBody
		@RequestMapping(value="/prdPaging.do", method = RequestMethod.POST)	//페이징 버튼 ajax 처리
		public PagingUtil prdPagingBtn(int nowPage, ReviewVO vo) {		
			int totalCount = reviewService.selectCount(vo.getPrdIndex());//해당 제품페이지에 존재하는 총 상품리뷰 수
			PagingUtil paging = new PagingUtil(totalCount, nowPage, 5);
			
			return paging;
		}
		
		
		@ResponseBody
		@RequestMapping(value="/search.do", method = RequestMethod.GET)	
		public List<ProductVO> search(SearchVO searchVO, int nowPage) {
			int totalCount = productService.selectBrandToal(searchVO);
			PagingUtil paging = new PagingUtil(totalCount, nowPage, 20);
			searchVO.setStart(paging.getStart());
			searchVO.setPerPage(paging.getPerPage());
			List<ProductVO> productVO = productService.selectBrandPage(searchVO);
			return productVO;
		}
		
		@ResponseBody
		@RequestMapping(value="/searchPaging.do", method = RequestMethod.GET)	
		public PagingUtil searchPaging(SearchVO searchVO, int nowPage) {					
			int totalCount = productService.selectBrandToal(searchVO);
			PagingUtil paging = new PagingUtil(totalCount, nowPage, 20);

			return paging;
		}
		
		@ResponseBody
		@RequestMapping(value="/ordernum.do", method = RequestMethod.POST)//결제 요청전 실행ajax
		public String orderNum(int totalPrice) {					
			PaymentUtil paymentUtil = new PaymentUtil();
			String orderNum = paymentUtil.createNum();//주문번호 생성
		    int result = orderService.selectOrderNum(orderNum);//주문번호 중복 체크
		    try {
		    	while(result > 0) {//주문번호중복시
		    		orderNum = paymentUtil.createNum();
		    		result = orderService.selectOrderNum(orderNum);
		    	}
		    	String accessToken = paymentUtil.getAccessToken();//엑세스 토큰 발급
		    	int code = paymentUtil.prepare(orderNum, totalPrice, accessToken);//결제금액 사전등록
		    	if(code != 0) {
		    		System.out.println("존재하지 않는 결제입니다.");//경고창 출력할지 미정
		    	}
			} catch (Exception e) {
				e.printStackTrace();
			}

		    return orderNum;		    
		}
		
		@ResponseBody
		@RequestMapping(value="/createOrder.do", method = RequestMethod.POST)	
		public String createOrder(String imp_uid, String merchant_uid, int totalPrice, int userIndex,
				int[] sizeindex, int[] orderitemStock, OrderItemVO oiVO
				) {
			String success = "0";
			System.out.println(sizeindex);//매개변수 넘어왔는지 체크 넘어 왔을시 주소값 들어있음(정상 작동시 삭제 요망)
			System.out.println(orderitemStock);//매개변수 넘어왔는지 체크 넘어 왔을시 주소값 들어있음(정상 작동시 삭제 요망)
			PaymentUtil paymentUtil = new PaymentUtil();
			String accessToken = paymentUtil.getAccessToken();//엑세스 토큰 발급
			OrderVO vo = paymentUtil.paymentHistory(imp_uid, accessToken, totalPrice);
			vo.setUserIndex(userIndex);
			int orderIndex = orderService.insertOrder(vo);
			
			oiVO.setOrderIndex(vo.getOrderIndex());
			for(int i = 0; i < sizeindex.length; i++) {
				oiVO.setSizeIndex(sizeindex[i]);
				oiVO.setOrderItemStock(orderitemStock[i]);
				System.out.println(oiVO.getOrderIndex());//주문번호 인덱스(정상 작동시 삭제 요망)
				System.out.println(oiVO.getOrderItemStock());//주문 수향(정상 작동시 삭제 요망)
				System.out.println(oiVO.getSizeIndex());//상품 사이즈 인덱스(정상 작동시 삭제 요망)
				
				int result = orderItemService.insertOrderItem(oiVO);
				if(result != 1) {
					success = "1";
				}
			}
			
			return success;
		}
		
		@ResponseBody
		@RequestMapping(value="/prdCodeCheck.do", method = RequestMethod.GET)
		public String prdCodeCheck(String prdCode) {
			int result = productService.selectByPrdCode(prdCode);
			
			return result+"";
		}
		
		@ResponseBody
		@RequestMapping(value="/manageSearch.do", method = RequestMethod.GET)
		public List<ProductVO> manageSearch(SearchVO searchVO, int nowPage) {
			int totalCount = productService.selectManageCount(searchVO);
			PagingUtil paging = new PagingUtil(totalCount, nowPage, 20);
			searchVO.setStart(paging.getStart());
			searchVO.setPerPage(paging.getPerPage());
			List<ProductVO> vo = productService.selectManageList(searchVO);
			
			return vo;
		}
		
		@ResponseBody
		@RequestMapping(value="/manageSearchPaging.do", method = RequestMethod.GET)	
		public PagingUtil manageSearchPaging(SearchVO searchVO, int nowPage) {					
			int totalCount = productService.selectManageCount(searchVO);
			PagingUtil paging = new PagingUtil(totalCount, nowPage, 20);

			return paging;
		}
		
		
		@ResponseBody
		@RequestMapping(value="/ prdDel.do", method = RequestMethod.POST)	
		public String prdDel(int prdIndex) {
			int result = productService.updatePrdDel(prdIndex);
			
			return result+"";
		}
		
		@ResponseBody
		@RequestMapping(value="/sizeModify.do", method = RequestMethod.POST)
		public String sizeModify(SizeVO vo) {
			int result = sizeService.updateSizeStock(vo);
			
			return result+"";
		}
		
		@ResponseBody
		@RequestMapping(value="/sizeinsert.do", method = RequestMethod.POST)
		public String sizeinsert(SizeVO vo, String inputSize) {
			vo.setSizeKind(inputSize);
			vo.setSizeStock(0);
			
			int result = sizeService.insertSize(vo);
			
			return result+"";
		}
}
