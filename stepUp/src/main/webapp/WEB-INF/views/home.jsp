<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>Home</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>	
<script type="text/javascript">

	function conectKakao(){
		let url = "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=0575c28de27e26d54b189d1b04528e6b&redirect_uri=http://localhost:8080/controller/user/kakaoLogin.do";
		let name = "kakaoLogin";
		let option = "width = 500, height = 500, top = 100, left = 200, location = no";
		 window.open(url, name, option);
	}
	
	function connectNaver(){
		let url = "<%=request.getContextPath()%>/user/naverLogin.do";
		let name = "naverLogin";
		let option = "width = 500, height = 500, top = 100, left = 200, location = no";
		window.open(url, name, option);
	}
	
	function logout(){
		location.href = "http://localhost:8080/controller/user/logout.do";
	}
</script>	
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<a href="<%=request.getContextPath()%>/user/join.do">회원가입 테스트 이동!</a>
<a href="<%=request.getContextPath()%>/user/login.do">로그인 테스트 이동!</a>
<a href="<%=request.getContextPath()%>/location.do">위치 테스트 이동!</a>
<a href="<%=request.getContextPath()%>/weare.do">소개 페이지  이동!</a>
<a href="<%=request.getContextPath()%>/free/free.do">자유게시판으로 이동!</a>
<a href="<%=request.getContextPath()%>/event/event.do">이벤트게시판으로 이동!</a>
<a href="<%=request.getContextPath()%>/notice/notice.do">공지사항으로 이동!</a>
<a href="<%=request.getContextPath()%>/product/registration.do">상품등록페이지로 이동!</a>
<a href="<%=request.getContextPath()%>/product/new.do">신상품 페이지로 이동!</a>
<a href="<%=request.getContextPath()%>/product/test.do">상품등록 확인 테스트!</a>
<a href="<%=request.getContextPath()%>/admin.do">관리자 페이지 테스트!</a>
<a href="https://kauth.kakao.com/oauth/logout?client_id=0575c28de27e26d54b189d1b04528e6b&logout_redirect_uri=http://localhost:8080/controller/user/logout.do">카카오 로그아웃</a>
<a href="#" onclick="logout()">로그아웃</a>
<c:if test="${not empty login}">
	${login.userId}
	<br>
	${login.userName}
	<br>
	${login.userNick}
	<br>
	${login.userGrade}
	<br>
	${login.userIndex}
</c:if>

<h3>menu</h3>
	<a href="<%=request.getContextPath()%>/index.do">INDEX로 이동!</a>
	<br/>
	<a href="<%=request.getContextPath()%>/product/brand.do">BRAND로 이동!</a>
	<br/>
	<a href="<%=request.getContextPath()%>/product/new.do">NEW로 이동!</a>
	<br/>
	<a href="<%=request.getContextPath()%>/product/best.do">BEST로 이동!</a>

<h3>board</h3>
	<a href="<%=request.getContextPath()%>/free/free.do">자유게시판으로 이동!</a>
	<br/>
	<a href="<%=request.getContextPath()%>/event/event.do">이벤트게시판으로 이동!</a>
	<br/>
	<a href="<%=request.getContextPath()%>/notice/notice.do">공지사항으로 이동!</a>
	
<h3>product</h3>
	<a href="<%=request.getContextPath()%>/product/product_view.do">상품상세페이지로 이동!</a>
	<br/>
	<a href="<%=request.getContextPath()%>/product/registration.do">상품등록페이지로 이동!</a>

<h3>user</h3>
	<a href="<%=request.getContextPath()%>/user/join.do">회원가입 테스트 이동!</a>
	<br/>
	<a href="<%=request.getContextPath()%>/user/login.do">로그인 테스트 이동!</a>
	<br/>
	<a href="https://kauth.kakao.com/oauth/logout?client_id=0575c28de27e26d54b189d1b04528e6b&logout_redirect_uri=http://localhost:8080/controller/user/logout.do">카카오 로그아웃</a>
	<a href="#" onclick="logout()">로그아웃</a>
	<c:if test="${not empty login}">
		${login.userId}
		<br>
		${login.userName}
		<br>
		${login.userNick}
		<br>
		${login.userGrade}
		<br>
		${login.userIndex}
		<br/>
		${login.userKakaoId}
		<br/>
		${login.userNaverId}
		<br/>
		<a href="#" onclick="conectKakao()">카카오 연결</a>
		<a href="#" onclick="connectNaver()">네이버 연결</a>
	</c:if>
</body>
</html>
