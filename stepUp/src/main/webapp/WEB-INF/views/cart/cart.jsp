<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
	<title>Home</title>
	<meta charset="UTF-8">
</head>
<style>
	h3{text-align:center; margin-top:200px;}
	.top{width:450px; height:400px; margin:150px 700px;}
	input{width:300px; height:40px; margin-top:30px; margin-left:20px; font-size:15px;}
	label{font-size:20px;}
	.top a{float: right; margin-right:30px; font-size:20px;}
	button{width:300px; height:40px; font-size:20px; margin-top:40px; margin-left:70px;}
</style>
<body>
<h3>
	해당 시스템은 로그인 후 이용 가능합니다.
</h3><hr>

	<form id="frm" action="login.do" method="post">
		<div class="top">
			<label>아이디 :　 </label>
			<input type="text" name="mid"><br>
			<label>비밀번호 : </label>
			<input type="password" name="mpw"><br>
			<div class="log"><button>로그인</button></div><br>
			<a href="<%=request.getContextPath()%>/join/join.do">[ 회원가입 ]</a>
		</div>
	</form>
</body>
</html>
