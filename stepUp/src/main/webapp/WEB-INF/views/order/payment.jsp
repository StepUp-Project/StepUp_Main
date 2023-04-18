<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
	<style type="text/css">
		.img-size img{
			width: 100%;
			height: 100%;
		}
		.w-15{
			width:15%;
		}
		.fs-7{
			font-size: 0.7rem;
		}
	</style>
</head>

<body>
<%@ include file="../include/header.jsp" %>    
	
	<main>
		<div class="container pt-5"><!-- 컨텐츠 영역 -->
			<div class="mb-4 text-darkr border-bottom border-dark"><!-- 타이틀 영역 -->
				<h2 class="fw-bold">주문/결제</h2>
			</div><!-- 타이틀 영역 end-->
			<div class="mt-5">
				<h5>주문리스트</h5>
			</div>
			<div class="table-responsive">
				<table class="table">
					<thead class="table-secondary">
						<tr>
							<th scope="col" class="text-center">주문상품</th>
							<th scope="col" class="px-5">상품명</th>
							<th scope="col">사이즈</th>
							<th scope="col">수량</th>
							<th scope="col">가격</th>
							<th scope="col">배송비</th>
						</tr>
					</thead>
						<tr>
							<td class="w-15 img-size">
								<img alt="상품이미지" src="<%=request.getContextPath()%>/resources/image/brand/Brand_cnt03.jpg">
							</td>
							<td class="px-5 w-25">
								<span class="fw-bold">나이키</span>
								<br>
								<span>나이키 에어 맥스 AP</span>
								<br>
								<span class="fs-7">NK010001</span>
							</td>
							<td>210</td>
							<td>1개</td>
							<td>49999원</td>
							<td>무료배송</td>							
						</tr>
						<tr>
							<td class="w-15 img-size">
								<img alt="상품이미지" src="<%=request.getContextPath()%>/resources/image/brand/Brand_cnt03.jpg">
							</td>
							<td class="px-5 w-25">
								<span class="fw-bold">나이키</span>
								<br>
								<span>나이키 에어 맥스 AP</span>
								<br>
								<span class="fs-7">NK010001</span>
							</td>
							<td>210</td>
							<td>1개</td>
							<td>49999원</td>
							<td>무료배송</td>							
						</tr>						
					<tbody>
					</tbody>
				</table>
			</div>
		</div><!-- 컨텐츠 영역 end-->
	</main>
    
<%@ include file="../include/footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script><!-- 부트스트랩 자바 스크립트연결 -->
    <script src="<%=request.getContextPath()%>/resources/JS/script.js"></script><!-- 자바 스크립트 연결 -->
</body>
</html>
