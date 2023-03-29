package proj.stepUp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import proj.stepUp.service.UserService;
import proj.stepUp.util.KakaoLogin;
import proj.stepUp.util.NaverLogin;
import proj.stepUp.vo.UserVO;

@RequestMapping(value="/user")
@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	
	@RequestMapping(value="/join.do", method = RequestMethod.GET)
	public String join(HttpServletRequest req) {
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
		 
		 if(result == 0) { 
			return "user/join"; 
		 }else { 
			return "home"; 
		 }
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
		if(loginVO != null) {
			System.out.println("로그인 성공");
			HttpSession seesion = req.getSession();
			seesion.setAttribute("login", loginVO);
			pw.append("<script>location.href='"+req.getContextPath()+"'</script>");
		}else {
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
		return "home";
	}
}
