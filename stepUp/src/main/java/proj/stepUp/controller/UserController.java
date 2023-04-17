package proj.stepUp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import proj.stepUp.service.FreeService;
import proj.stepUp.service.UserService;
import proj.stepUp.util.KakaoLogin;
import proj.stepUp.util.NaverLogin;
import proj.stepUp.util.PagingUtil;
import proj.stepUp.vo.FreeBoardVO;
import proj.stepUp.vo.SearchVO;
import proj.stepUp.vo.UserVO;

@RequestMapping(value="/user")
@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private FreeService freeService;
	
	
	@RequestMapping(value="/join_terms.do", method = RequestMethod.GET)
	public String joinTerms(HttpServletRequest req) {
		HttpSession seesion = req.getSession();
		if(seesion.getAttribute("login") != null) {
			return "home";
		}else {
			return "user/join_terms";
		}
	}

	
	@RequestMapping(value="/join.do", method = RequestMethod.GET)
	public String join(UserVO vo, HttpServletRequest req,Model model) {
		
		//jointerms에서 항목을 가져올 때 선택하지 않은 것에 N을 넣어줌
		 if(vo.getEveChk() == null) {
			 vo.setEveChk("N");
		 }
		 if(vo.getLoChk() == null) {
			 vo.setLoChk("N");
		 }
		 
		System.out.println(vo.getEveChk());
		System.out.println(vo.getLoChk());
		
		model.addAttribute("vo", vo);  //join_terms에서 선택한 체크박스  값을 join으로 넘겨줌
		
		HttpSession seesion = req.getSession();
		if(seesion.getAttribute("login") != null) {
			return "home";
		}else {
			return "user/join";
		}
	}
	
	
	@RequestMapping(value="/join.do", method = RequestMethod.POST)
	public String join(UserVO vo) {
		 
		 int result = userService.insertUser(vo);
		 if(result > 0) { 
			return "redirect:/user/joinok.do";
		 }else { 
			return "redirect:/user/join.do"; 
		 }
	}

	
	@RequestMapping(value="/joinok.do", method = RequestMethod.GET)
	public String joinok(UserVO vo) {
		return "user/joinok";
	}
	
	
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public String login(HttpServletRequest req) {
		
		HttpSession seesion = req.getSession();
		if(seesion.getAttribute("login") != null) {
			return "home";
		}else {
			return "user/login";
		}
	}
	
	
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public void login(UserVO vo, HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		
		rsp.setContentType("text/html;charset=utf-8");
		UserVO loginVO = userService.login(vo);
		PrintWriter pw = rsp.getWriter();
		
		if(loginVO != null ) {
			if(loginVO.getUserGrade().equals("Q")){
				System.out.println("탈퇴한 사용자 아이디 :: " + vo.getUserGrade());
				pw.append("<script>alert('탈퇴한 사용자입니다.');location.href='"+req.getContextPath()+"/user/login.do'</script>");
			}else {
				System.out.println("로그인 성공");
				HttpSession seesion = req.getSession();
				seesion.setAttribute("login", loginVO);
				pw.append("<script>location.href='"+req.getContextPath()+"'</script>");
			}
		}else{
			System.out.println("로그인 실패");
			pw.append("<script>alert('아이디 또는 비밀번호가 일치하지 않습니다.');location.href='"+req.getContextPath()+"/user/login.do'</script>");
		}
		pw.flush();
	}
	
	
	@RequestMapping(value="/kakaoLogin.do", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam String code, HttpServletRequest req, HttpServletResponse rsp) throws IOException{
		
		KakaoLogin kakaoLogin = new KakaoLogin();//로그인 요청 후 코드 발급
		String token = kakaoLogin.getKakaoAccessToken(code);//발급받은 코드를 이용하여 토큰 발급		
		String userKakaoId = kakaoLogin.createKakaoUser(token);//토큰을 이용하여 사용자 정보 조회 후 아이디 반환

		HttpSession seesion = req.getSession();
		
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		if(seesion.getAttribute("login") != null) {//로그인 중인 아이디가 존재하면
			UserVO kakaoVO = userService.kakaoLogin(userKakaoId);
			if(kakaoVO != null) {
				pw.append("<script>alert('해당 SNS 계정에 연결된 계정이 존재합니다.');opener.location.reload();window.close();</script>");
			}else {
				UserVO vo = (UserVO)seesion.getAttribute("login");
				vo.setUserKakaoId(userKakaoId);
				
				int result = userService.upDateKakaoId(vo);
				if(result == 1) {
					pw.append("<script>alert('연동이 완료되었습니다.');opener.location.reload();window.close();</script>");
				}else {
					pw.append("<script>alert('연동에 실패하였습니다.');opener.location.reload();window.close();</script>");
				}
			}			
			pw.flush();
		}else {										//로그인된 아이디가 존재하지 않는다면
			//발급받은 아이디로 db 비교 진행
			UserVO kakaoVO = userService.kakaoLogin(userKakaoId);
			if(kakaoVO != null) {
				//로그인 진행
				seesion.setAttribute("login", kakaoVO);				
				return "home";
			}else {				
				pw.append("<script>alert('최초 1회 계정 연동이 필요합니다.');location.href='"+req.getContextPath()+"/user/login.do'</script>");
			}
			pw.flush();
		}
		
		return "home";
	}
	
	
	@RequestMapping(value="naverLogin.do")
	public String naverLogin() {
		NaverLogin requestLogin = new NaverLogin();
		String request = requestLogin.requestLogin();
		
		System.out.println(request);
		return "redirect:"+request;
	}
	
	
	@RequestMapping(value="naverLoginOk.do")
	public String naverLoginOk(@RequestParam String code, String state, HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		NaverLogin requestLogin = new NaverLogin();
		String accessToken = requestLogin.getNaverAccessToken(code, state);//토큰 발급
		String userNaverId = requestLogin.getUserInfo(accessToken);//사용자 정보 조회를 통해 아이디 추출
		
		HttpSession seesion = req.getSession();
		
		seesion.setAttribute("naverToken", accessToken);
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		if(seesion.getAttribute("login") != null) {//로그인 중인 아이디가 존재하면
			UserVO naverVO = userService.naverLogin(userNaverId);
			if(naverVO != null) {
				pw.append("<script>alert('해당 SNS 계정에 연결된 계정이 존재합니다.');opener.location.reload();window.close();</script>");
			}else {
				UserVO vo = (UserVO)seesion.getAttribute("login");
				vo.setUserNaverId(userNaverId);
				
				int result = userService.upDateNaverId(vo);
				if(result == 1) {
					pw.append("<script>alert('연동이 완료되었습니다.');opener.location.reload();window.close();</script>");
				}else {
					pw.append("<script>alert('연동에 실패하였습니다.');opener.location.reload();window.close();</script>");
				}
			}
			pw.flush();
		}else {										//로그인된 아이디가 존재하지 않는다면
			//발급받은 아이디로 db 비교 진행
			UserVO naverVO = userService.naverLogin(userNaverId);
			if(naverVO != null) {
				//로그인 진행
				seesion.setAttribute("login", naverVO);				
				return "home";
			}else {				
				pw.append("<script>alert('최초 1회 계정 연동이 필요합니다.');location.href='"+req.getContextPath()+"/user/login.do'</script>");
			}
			pw.flush();
		}
		
		return "home";
	}
	
	
	@RequestMapping(value="/logout.do", method = RequestMethod.GET)
	public String kakaoLogout(HttpServletRequest req) {		
		HttpSession seesion = req.getSession();
		seesion.removeAttribute("login");
		return "index";
	}
	
	
	
	
	
	//개인정보수정 비밀번호 확인
	@RequestMapping(value="/mypage_modify_check.do", method = RequestMethod.GET)
	public String mpModifyCheck(HttpServletRequest req) {
		HttpSession seesion = req.getSession();
		if(seesion.getAttribute("login") != null) {
			return "user/mypage_modify_check";
		}else {
			return "user/login";
		}
	}
	
	
	@RequestMapping(value="/mypage_modify_check.do", method = RequestMethod.POST)
	public void mpModifyCheck(UserVO vo, HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		
		 UserVO loginVO = userService.login(vo);
		 rsp.setContentType("text/html;charset=utf-8");
		 PrintWriter pw = rsp.getWriter();
			if(loginVO != null) {
				System.out.println("비밀번호가 확인되었습니다.");
				HttpSession seesion = req.getSession();
				seesion.setAttribute("login", loginVO);
				pw.append("<script>location.href='"+req.getContextPath()+"/user/mypage_modify.do'</script>");
			}else {
				System.out.println("비밀번호가 정확하지 않습니다.");
				pw.append("<script>alert('비밀번호가 정확하지 않습니다.');location.href='"+req.getContextPath()+"/user/mypage_modify_check.do'</script>");
			}
			pw.flush();
		}
	
	
	//개인정보수정 기존정보 불러오기
	@RequestMapping(value="/mypage_modify.do", method = RequestMethod.GET)
	public String mpModify(HttpServletRequest req, Model model) {
		
		HttpSession session = req.getSession();  //로그인정보는 세션에 있는거라서 세션에서 가져와야함
		UserVO loginUser = (UserVO)session.getAttribute("login");
		System.out.println( loginUser.getUserName() );
		System.out.println( loginUser.getUserNick() );
		System.out.println( loginUser.getUserAddr() );
		System.out.println( loginUser.getUserId() );
		UserVO mypage = userService.mypage(loginUser.getUserId());
		model.addAttribute("mypage", mypage);
			return "user/mypage_modify";
	}
	
	
	//개인정보수정 후 업데이트
	@RequestMapping(value="/mypage_modify.do", method = RequestMethod.POST)
	public void mpModify(UserVO vo, String userNPw, HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		
		HttpSession session = req.getSession();  //지금 세션에 로그인되어있는 사용자의
		UserVO loginUser = (UserVO)session.getAttribute("login");  //로그인정보를 가져와서
		vo.setUserId(loginUser.getUserId());  //그 로그인정보에 있는 사용자의 아이디를 vo에 넣어준다

		vo.setUserPw(userNPw);  //새로운 비밀번호를 기존의 비밀번호에 넣어주는
		
		int result = userService.mypageUpdate(vo);
		System.out.println( vo.getUserName() );
		System.out.println( vo.getUserNick() );
		System.out.println( vo.getUserPw() );
		
		 rsp.setContentType("text/html;charset=utf-8");
		 PrintWriter pw = rsp.getWriter();
		if(result > 0) {
			System.out.println("정보가 수정되었습니다.");
			//return "redirect:/user/mypage_modify.do";
			//result가 0일 때
			pw.append("<script>alert('정보가 수정되었습니다.');location.href='"+req.getContextPath()+"/user/mypage_modify.do'</script>");
		}else {
			System.out.println("정보가 수정되지 않았습니다.");
			//return "redirect:/user/mypage_modify.do?updateYN=N";
			//result가 1일 때
			pw.append("<script>alert('정보가 수정되지 않았습니다.');location.href='"+req.getContextPath()+"/user/mypage_modify.do'</script>");
		}
		pw.flush();
	}

	
	
	//회원탈퇴
	@RequestMapping(value="/mypage_withdrawal.do", method = RequestMethod.GET)
	public String mpwd(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		if(session.getAttribute("login") != null) {
		    return "user/mypage_withdrawal";
		}else {
		    return "user/login";
		}
		
	}


	//회원탈퇴 비밀번호 입력하는 페이지
	@RequestMapping(value="/mypage_withdrawal.do", method = RequestMethod.POST)
	public void mpwd(UserVO vo, HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		
		//disabled를 사용하면 값이 안넘어감. userId 값 넘기려면 아래 세 줄써야함
		HttpSession session = req.getSession();  //지금 세션에 로그인되어있는 사용자의
		UserVO loginUser = (UserVO)session.getAttribute("login");  //로그인정보를 가져와서
		vo.setUserId(loginUser.getUserId());  //그 로그인정보에 있는 사용자의 아이디를 vo에 넣어준다
		
		 UserVO loginVO = userService.login(vo);  //db에 정보가 있는지 확인
		 
		 System.out.println("vo.getUserId()::" + vo.getUserId());
		 System.out.println("vo.getUserPw()::" + vo.getUserPw());
		 
		 rsp.setContentType("text/html;charset=utf-8");
		 PrintWriter pw = rsp.getWriter();
			if( loginVO != null) {
				int result = userService.userDelete(vo.getUserId());
				if(result > 0) {
					System.out.println("탈퇴 되었습니다.");
					HttpSession seesion = req.getSession();
					seesion.invalidate();  //세션에서 회원의 모든 정보를 브라우저에서 지운다
					pw.append("<script>location.href='"+req.getContextPath()+"/user/mypage_withdrawal_ok.do'</script>");
				}else {
					System.out.println("탈퇴되지 않았습니다.");
					pw.append("<script>alert('탈퇴되지 않았습니다.');location.href='"+req.getContextPath()+"/user/mypage_withdrawal.do'</script>");
				}
			}else {
				System.out.println("비밀번호가 정확하지 않습니다.");
				pw.append("<script>alert('비밀번호가 정확하지 않습니다.');location.href='"+req.getContextPath()+"/user/mypage_withdrawal.do'</script>");
			}
			pw.flush();
		} 
	
	
	@RequestMapping(value="/mypage_withdrawal_ok.do", method = RequestMethod.GET)
	public String mpwdok(UserVO vo) {
		return "user/mypage_withdrawal_ok";
	}
	

	//mypage 내가쓴 글
	
	@RequestMapping(value="/mypage_posting.do", method = RequestMethod.GET)
	public String myposting(Model model, HttpServletRequest req, SearchVO svo) {
		
		int nowPage = 1;
		if(svo.getNowPage() != 0 ) {
			nowPage = svo.getNowPage();
		}
		List<FreeBoardVO> cntTotal = freeService.cntTotal(svo);
		int totalCnt = 0;
		if(cntTotal.size()>0) {
			totalCnt = cntTotal.get(0).getTotal();
		}
		
		PagingUtil paging = new PagingUtil(totalCnt, nowPage, 10);
		
		
		HttpSession session = req.getSession();  //지금 세션에 로그인되어있는 사용자의
		UserVO loginUser = (UserVO)session.getAttribute("login");  //로그인정보를 가져와서
		
		List<FreeBoardVO> list = freeService.listByUserIdx(loginUser.getUserIndex());
		
		model.addAttribute("blist", list);
		model.addAttribute("paging", paging);
		
		return "user/mypage_posting";
	}
	
	
	@RequestMapping(value="/myposting_delete.do", method = RequestMethod.POST)
	public String mpdelete(int[] freeIndex) { //name이 같은 애들을 삭제하는거라 배열로..
		
		System.out.println("freeIndex:"+freeIndex.length);  //선택한 체크박스의 개수
		
		for(int idx : freeIndex) {
			int result = freeService.delete(idx);
		}
		
		return "redirect:/user/mypage_posting.do";
	}
		
}
	
	

