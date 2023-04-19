<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>아이디 찾기</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
</head>
<body style="background-color: #fafafa;">
     <main class="loginlogo">
        <div class="jointermslogo">
            <h1 class="jointerms_title">
                <a href="<%=request.getContextPath()%>/index.do">
                    <img src="<%=request.getContextPath()%>/resources/image/kickshublogo.png" alt="kickshub">
                </a>
            </h1>
        </div>
    	<div class="login-area">
	        <div class="login-main"><!--로그인 main 영역 시작-->
	            <form name="frm" action="find_id.do" method="post">
	                <div class="form-floating mb-3">
	                    <input type="text" class="form-control" id="userName" name="userName" placeholder="가입시 입력한 이름을 적어주세요">
	                    <label for="userId">가입자명을 입력해주세요</label>
	                </div>
	                <div class="form-floating">
	                    <input type="text" class="form-control" id="userPw" name="userMail" placeholder="가입시 입력한  이메일을 적어주세요">
	                    <label for="userPw">가입시 입력한 이메일을 입력해주세요</label>
	                </div>
	                <div class="d-flex justify-content-end find-area">
	                    <a href="">이전 페이지 </a>
	                    <span>&nbsp; &nbsp; | &nbsp;</span>
	                    <a href="" class="find-btn">비밀번호 찾기</a>
	                </div>
	                <div class="d-grid gap-2 login-btn-area">
		                <div class="btngroup">
		                    <button class="btn btn-primary btn-lg">확인</button>
		                    <button class="btn btn-primary btn-lg" type="button" onclick="location.href='join.do'">회원가입</button>
	                    </div>
	                </div>
	            </form>
	        </div><!--로그인 main 영역 끝-->
        </div>
        </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script><!-- 부트스트랩 자바 스크립트연결 -->
</body>
</html>
