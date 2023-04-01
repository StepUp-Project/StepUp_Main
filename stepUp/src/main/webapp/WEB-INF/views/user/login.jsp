<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>login</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
    
    <script>//비밀번호 입력창 암호 보이기 숨기기 JS
        window.onload = function(){
            let eyes = document.getElementById("eyes");
            let iEyes = document.getElementById("i-eyes");
            let UserPw = document.getElementById("userPw");
            eyes.addEventListener("click", function(){
                if(iEyes.classList.contains("xi-eye-o")){
                    iEyes.classList.replace("xi-eye-o", "xi-eye-off-o");
                    UserPw.setAttribute("type", "text");
                }else{
                    iEyes.classList.replace("xi-eye-off-o", "xi-eye-o");
                    UserPw.setAttribute("type", "password");
                }
            });
        }
    
    
    	function kakaoLogin(){
			location.href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=0575c28de27e26d54b189d1b04528e6b&redirect_uri=http://localhost:8080/controller/user/kakaoLogin.do"
    	}
    	
    	function naverLogin(){
    		location.href="naverLogin.do"
    	}
    </script>
</head>
<body>
   <header id="header"><!--헤더 시작-->
        <div class="d-flex justify-content-between pt-5"><!--d-flex 영역 시작-->
            <div class="p-2 logo-wrap" ><!-- 로고 영역 시작-->
                <h1 class="logo">
                    <a href="/">
                        <span>kikshub</span>
                    </a>    
                </h1>
            </div><!-- 로고 영역 끝-->
            <nav><!--메인 네비게이션 영역 시작-->
                <ul class="d-flex" id="gnb">
                    <li>
                        <a href="#">WE ARE</a>
                        <ul class="mt-5"><!--sub 네비게이션 -->
                            <li><a href="#">소개</a></li>
                            <li><a href="#">위치</a></li>
                        </ul><!--sub 네비게이션 끝-->
                    </li>
                    <li>
                        <a href="#">BRAND</a>
                        <ul class="mt-5"><!--sub 네비게이션 -->
                            <li><a href="#">나이키</a></li>
                            <li><a href="#">뉴발란스</a></li>
                            <li><a href="#">아디다스</a></li>
                            <li><a href="#">반스</a></li>
                            <li><a href="#">푸마</a></li>
                            <li><a href="#">크록스</a></li>
                            <li><a href="#">컨버스</a></li>
                            <li><a href="#">휠라</a></li>
                        </ul><!--sub 네비게이션 -->
                    </li>
                    <li>
                        <a href="#">NEW</a>
                    </li>
                    <li><a href="#">BEST</a></li>
                    <li><a href="#">EVENT</a></li>
                    <li>
                        <a href="#">COMMUNITY</a>
                        <ul class="mt-5"><!--sub 네비게이션 -->
                            <li><a href="#">자유게시판</a></li>
                            <li><a href="#">중고거래</a></li>
                            <li><a href="#">경매</a></li>
                        </ul><!--sub 네비게이션 -->
                    </li>
                    <li>
                        <a href="#">CUSTOMER</a>
                        <ul class="mt-5"><!--sub 네비게이션 -->
                            <li><a href="#">공지사항</a></li>
                            <li><a href="#">QnA</a></li>
                        </ul><!--sub 네비게이션 -->
                    </li>
                </ul>
            </nav><!--메인 네비게이션 영역 끝-->
            <div class="p-2 me-4" id="user"><!-- 로그인, 장바구니, 마이페이지 영역 시작-->
                <a href="#"><i class="xi-search"></i></a>
                <a href="#"><i class="xi-user-o"></i></a>
                <a href="#"><i class="xi-cart-o"></i></a>
            </div><!-- 로그인, 장바구니, 마이페이지 영역 끝-->
	    </div><!--d-flex 영역 끝-->
    </header><!--헤더 끝-->   
    
    <main>
    <div class="login-area"><!--로그인 헤더 영역 시작-->
        <div class="login-header">
            <h1>
                <a href="<%=request.getContextPath()%>">
                    <img src="<%=request.getContextPath()%>/resources/image/kickshub_logo2.png" alt="kickshub">
                </a>
            </h1>
        </div><!--로그인 헤더 영역 끝-->
        <div class="login-main"><!--로그인 main 영역 시작-->
            <form name="frm" action="login.do" method="post">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="userId" name="userId" placeholder="userId">
                    <label for="userId">아이디</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="userPw" name="userPw" placeholder="userPw">
                    <label for="userPw">비밀번호</label>
                    <div id="eyes">
                        <i class="xi-eye-o" id="i-eyes"></i>
                    </div>
                </div>
                <div class="d-flex justify-content-end find-area">
                    <a href="">아이디 찾기 </a>
                    <span>&nbsp; &nbsp; | &nbsp;</span>
                    <a href="" class="find-btn">비밀번호 찾기</a>
                </div>
                <div class="d-grid gap-2 login-btn-area">
	                <div class="btngroup">
	                    <button class="btn btn-primary btn-lg">로그인</button>
	                    <button class="btn btn-primary btn-lg" type="button" onclick="location.href='join.do'">회원가입</button>
                    </div>
                    <a href="#" onclick="kakaoLogin()" class="sns-login">
                        <img src="<%=request.getContextPath()%>/resources/image/btn_login_kakao.gif" alt="카카오 로그인">
                    </a>
                    <a href="#" onclick="naverLogin()" class="sns-login">
                        <img src="<%=request.getContextPath()%>/resources/image/btn_login_naver.gif" alt="네이버 로그인">
                    </a>
                </div>
            </form>
        </div><!--로그인 main 영역 끝-->
        </main>

       <footer class="d-flex justify-content-between pt-2"> <!-- 하단 시작-->
        <div class="d-flex justify-content-between pt-3, footinfo"> <!-- 회사 정보 -->
            <ul>
                <li>(주)스텝업 / 대표자: 이상훈, 곽진훈, 조범준 / 사업장소재지 : 전라북도 전주시 덕진구 백제대로 572 5층</li>
                <li>사업자등록번호 : 257-67-74617 / 통신판매업 신고번호: 제2022-2875호</li>
                <li>이메일: service@kickshub.com / 개인정보관리책임자 : 배유진</li>
                <li></li>
                <li>Copyright Ⓒ kickshub All rights reserved,</li>
            </ul>
            <ul>
                <li>고객센터 : 1660-2875</li>
                <li>운영시간 : 10:00 ~ 17:00 (주말/공휴일 휴무)</li>
                <li>점심시간 : 11:50 ~ 13:00</li>
                <li>반품주소 : 전라북도 전주시 덕진구 백제대로 572 5층</li>
                <li></li>
            </ul>
            <ul>
                <li><a href="#">회사소개</a></li>
                <li><a href="#">공지사항</a></li>
                <li><a href="#">QnA</a></li>
                <li><a href="#">운영정책관리자</a></li>
                <li></li>
            </ul>
        </div> <!-- 회사 정보 끝 -->
        <div id="footlogosns"> <!--로고 및 sns 연결 시작-->
            <h1 id="footlogo"><a href="<%=request.getContextPath()%>">
                <span>kickshub</span>
            </a></h1>
            <ul id="footsns" class="d-flex justify-content-between "> <!--SNS 링크 부분-->
                <li id="sns_fb"><a href="#"><span>facebook</span></a></li>
                <li id="sns_tw"><a href="#"><span>twitter</span></a></li>
                <li id="sns_ist"><a href="#"><span>instagram</span></a></li>
                <li id="sns_ytb"><a href="#"><span>Youtube</span></a></li>
            </ul>
        </div> <!--로고 및 sns 연결 끝-->
    </footer> <!-- 하단 끝-->
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script><!-- 부트스트랩 자바 스크립트연결 -->
</body>
</html>
