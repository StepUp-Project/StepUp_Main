<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="frm" action="test.do" method="post">
		<input type="number" name="prdIndex">
		<button>전송</button>
	</form>
	
	<c:if test="${not empty prdVO}">
		${prdVO.prdIndex}
		<br>
		${prdVO.prdCode}
		<br>
		${prdVO.prdName}
		<br>
		${prdVO.prdPrice}
		<br>
		${prdVO.prdDate}
		<br>
		${prdVO.prdOname}
		<br>
		${prdVO.prdRname}
		<br>
		${prdVO.prdCnt}
		<br>
		${prdVO.prdMadeIn}
		<br>
		${prdVO.prdMt}
		<br>
		${prdVO.prdQc}
		<br>
		${prdVO.prdCare}
		<br>
		${prdVO.prdMadeDate}																				
	</c:if>
</body>
</html>