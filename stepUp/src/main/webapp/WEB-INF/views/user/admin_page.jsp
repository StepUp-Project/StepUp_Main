<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="proj.stepUp.vo.UserVO" %>
<%@ page import="java.util.*" %>
<% 
	List<UserVO> blist = (List<UserVO>)request.getAttribute("blist");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/><!-- swiper CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
</head>
<body>
<%@ include file="../include/header.jsp" %>
<main>
	<div id="slideEdit" style="width:60%; margin:30px auto;">
		<form name="slidefrm" method="post" action="slide.do" enctype="multipart/form-data">
			<br/> <br/>
			<div>변경할 슬라이드의 번호를 선택하세요</div> 
        		<label><input type="radio" name="slideNum" value="1"> 1</label>
     			<label><input type="radio" name="slideNum" value="2"> 2</label>
        		<label><input type="radio" name="slideNum" value="3"> 3</label>
     			<label><input type="radio" name="slideNum" value="4"> 4</label>
			<br/> <br/>
			<input type="file" name="mainFile" style="width:300px; height: 40px;" />
			 <br/> <br/>
			<input type="text" name="slideUrl"  placeholder="해당 슬라이드에 연결할 url을 입력해주세요" style="width:600px; height: 40px;" /> <input type="submit" value="저장" style="width:100px; height: 40px;" >
		</form>
	</div>
	
	<div style="width:60%; margin:30px auto;">
		<div>회원 제재</div>
		<form action="qna/restrict.do" method="post">
			<br/> <br/>
			<input type="hidden" name="userGrade" value="F" >
			<input type="text" name="userId" placeholder="제재할 회원이 ID를 입력해주세요"  style="width:600px; height: 40px;" /> <input type="submit" value="저장" style="width:100px; height: 40px;" >
		</form>
		<br> <br>
		<div>제재회원 목록</div>
		<ul>
		 <c:forEach var="vo" items="${blist}">
		 	<li>회원아이디 : ${vo.userId} // 회원번호 : ${vo.userIndex} // 회원상태 : ${vo.userGrade}</li>

		 </c:forEach>
		 </ul>
	</div>
	<div style="width:60%; margin:30px auto;">
		<a href="<%=request.getContextPath()%>/product/registration.do">상품등록페이지로 이동!</a>
	</div>

</main>	
<%@ include file="../include/footer.jsp" %>
</body>
</html>