<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
	<style type="text/css">
		.orderImg{
			width: 20%;
		}
		.orderImg img{
			width: 100%;
			height: 100%;
		}	
	</style>
</head>
<body>
	<div>
		<div>
			<h3>주문상세내역</h3>
		</div>
		<div>
			<div>
				<span>2023.04.18</span>
				<span>주문번호123456789</span>
			</div>
			<div class="card">
			  <div class="card-body">
			  	<div class="table-responsive">
				   	<table class="table table-bordered">
				   		<tr>
				   			<td rowspan='5' class="orderImg">
				   				<img src="http://localhost:8080/controller/resources/prdmainimg/1681730514765_NK010003-main3.jpg" alt="상품이미지">
				   			</td>
				   			<th>상품명</th>
				   			<td>test02</td>
				   		</tr>
				   		<tr>
				   			<th>사이즈</th>
				   			<td>210</td>			   			
				   		</tr>
				   		<tr>
				   			<th>가격</th>
				   			<td>99999원</td>			   			
				   		</tr>
				   		<tr>
				   			<th>수량</th>
				   			<td>3개</td>			   			
				   		</tr>
				   		<tr>
				   			<th>총가격</th>
				   			<td>300000원</td>			   			
				   		</tr>			   					   					   		
				   	</table>
				   	<table class="table table-bordered">
				   		<tr>
				   			<td rowspan='5' class="orderImg">
				   				<img src="http://localhost:8080/controller/resources/prdmainimg/1681730514765_NK010003-main3.jpg" alt="상품이미지">
				   			</td>
				   			<th>상품명</th>
				   			<td>test02</td>
				   		</tr>
				   		<tr>
				   			<th>사이즈</th>
				   			<td>210</td>			   			
				   		</tr>
				   		<tr>
				   			<th>가격</th>
				   			<td>99999원</td>			   			
				   		</tr>
				   		<tr>
				   			<th>수량</th>
				   			<td>3개</td>			   			
				   		</tr>
				   		<tr>
				   			<th>총가격</th>
				   			<td>300000원</td>			   			
				   		</tr>			   					   					   		
				   	</table>				   	
			   	</div>
			  </div>
			</div>			
		</div>
	</div>
	
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script><!-- 부트스트랩 자바 스크립트연결 -->
    <script src="<%=request.getContextPath()%>/resources/JS/script.js"></script><!-- 자바 스크립트 연결 -->
</body>
</html>