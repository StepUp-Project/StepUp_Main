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
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
	
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
		.input-style{
			width:350px;
			height: 38px;
		}
		.zip-style{
			width: 500px;
			height: 38px;
		}
		.table-boot-bd tr{
			border-bottom: 1px solid #dee2e6;
		}
	</style>
</head>

<body>
<%@ include file="../include/header.jsp" %>    
	
	<main>
		<div class="container pt-5"><!-- 컨텐츠 영역 -->
			<div class="mb-4 text-darkr border-bottom border-dark"><!-- 타이틀 영역 -->
				<h2 class="fw-bold fs-2">주문/결제</h2>
			</div><!-- 타이틀 영역 end-->
			<div class="mt-5">
				<h5 class="fs-3">주문리스트</h5>
			</div>
			<div class="table-responsive">
				<table class="table table-boot-bd">
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
					<c:forEach var="prd" items="${sizeVO}" varStatus="status">
						<tr>
							<td class="w-15 img-size">
								<img alt="상품이미지" src="<%=request.getContextPath()%>/resources/prdmainimg/${prd.prdRname}">
							</td>
							<td class="px-5 w-25">
								<c:set var="BrandCode" value="${fn:substring(prd.prdCode,0,2)}"/>
								<span class="fw-bold">
								<c:choose>
									<c:when test='${BrandCode eq "NK"}'>나이키</c:when>
					               	<c:when test='${BrandCode eq "AD"}'>아디다스</c:when>
					               	<c:when test='${BrandCode eq "VS"}'>반스</c:when>
					               	<c:when test='${BrandCode eq "CV"}'>컨버스</c:when>
					               	<c:when test='${BrandCode eq "PM"}'>퓨마</c:when>
					               	<c:when test='${BrandCode eq "FL"}'>휠라</c:when>
					               	<c:when test='${BrandCode eq "CR"}'>크록스</c:when>
					               	<c:when test='${BrandCode eq "NB"}'>뉴발란스</c:when>
								</c:choose>
								</span>
								<br>
								<span id="prdName">${prd.prdName}</span>
								<br>
								<span class="fs-7">${prd.prdCode}</span>
							</td>
							<td>${prd.sizeKind}</td>
							<td name="sizeStock">${stock[status.index]}</td>
							<input type="hidden" name="sizeindex" value="${prd.sizeIndex}">
							<input type="hidden" name="orderitemStock" value="${stock[status.index]}">
							<c:set var="total" value="${prd.prdPrice * stock[status.index]}"/>
							<input type="hidden" name="itemPrice" value="${total}"/>
							<td><fmt:formatNumber value="${total}" pattern="#,###"/>원</td>
							<td>무료배송</td>							
						</tr>							
					</c:forEach>
					<tbody>
					</tbody>
				</table>
			</div>
			<div class="d-flex justify-content-end mb-3 border-bottom border-dark border-5">
				<span class="fw-light mb-3">&#8226;상품수량 및 옵션변경은 상품상세 또는 장바구니에서 가능합니다.</span>
			</div>
			<div class="d-flex justify-content-end mb-5">
				<span class="fs-1">결제예정금액</span>
				<span class="ms-5 fs-1 text-danger" id="totalPrice"></span>
				<input type="hidden" id="totalPriceHidden" value="">
			</div>
			<div class="mt-5 border-bottom border-dark mb-5">
				<h5 class="mb-3">배송 정보</h5>
			</div>
			<div class="mb-3 border-bottom border-dark">
				<table class="table table-borderless table-boot-bd">
					<tbody>
						<tr>
							<th scope="row" class="w-15	">
								<label for="buyerName" class="fs-4">이름</label>
							</th>
							<td>
								<input class="input-style" id="buyerName" name="buyerName" type="text" placeholder="이름" value="${userVO.userName}">
								<span></span>
							</td>
						</tr>
						<tr>
							<th scope="row" class="w-15	">
								<label for="buyerTel" class="fs-4">전화번호</label>
							</th>
							<td>
								<input class="input-style" id="buyerTel" name="buyerTel" type="text" placeholder="연락처" value="${userVO.userPhone}">
								<span></span>
							</td>
						</tr>
						<tr>
							<th scope="row" class="w-15	">
								<label for="userZipCode" class="fs-4">주소</label>
							</th>
							<td class="d-flex justify-content-start">
								<input type="text" class="input-style" id="userZipCode" name="userZipCode" placeholder="우편번호" value="${userVO.userZipCode}" readonly oninput="clearCheck()">
								<button type="button" onclick="sample6_execDaumPostcode()" class="btn btn-secondary btn-sm ms-3">우편번호 찾기</button>
							</td>
						</tr>
						<tr>
							<th scope="row" class="w-15	">						
							</th>
							<td>
								<input type="text" class="zip-style" id="userAddr" name="userAddr" placeholder="주소" value="${userVO.userAddr}" readonly>
							</td>
						</tr>
						<tr>
							<th scope="row" class="w-15	">						
							</th>
							<td>
								<input type="text" class="zip-style" id="userAddrDetail" name="userAddrDetail" placeholder="상세주소" value="${userVO.userAddrDetail}">
							</td>
						</tr>																								
					</tbody>
				</table>
			</div>
			<div class="d-flex justify-content-end mb-5">
				<button type="button" class="btn btn-dark  btn-lg rounded-0" onclick="callPay()">결제하기</button>
				<button type="button" class="btn btn-light btn-lg rounded-0 ms-3">취소</button>
			</div>
		</div><!-- 컨텐츠 영역 end-->
	</main>
    
<%@ include file="../include/footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/crypto-js.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script><!-- 부트스트랩 자바 스크립트연결 -->
    <script src="<%=request.getContextPath()%>/resources/JS/script.js"></script><!-- 자바 스크립트 연결 -->
    <script type="text/javascript">
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }   

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('userZipCode').value = data.zonecode;
                document.getElementById("userAddr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("userAddrDetail").focus();
            }
        }).open();
    }
    function totalprice(){
    	let itemPrice = document.querySelectorAll('input[name="itemPrice"]');
    	let totalPrice = 0;
    	if(itemPrice.length != 0){
    		itemPrice.forEach(function(i){
    			totalPrice += parseInt(i.value);
    		})
    	}
    	let total = new Intl.NumberFormat('ko-kr').format(totalPrice);
    	$("#totalPriceHidden").val(totalPrice);
    	$("#totalPrice").html(total+"원");
    }
	
    //결제
    function callPay() {//결제 버큰 클릭시 함수 호출
    	let totalPrice = $("#totalPriceHidden").val();
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/ordernum.do",
			type:"post",
			data:{totalPrice : totalPrice},
			success:function(data){
		        var IMP = window.IMP; 
		        IMP.init("imp73884570"); 
		        requestPay(data);
			}
		});
    }
	
    function requestPay(orderNum) {
    	let totalPrice = $("#totalPriceHidden").val();
    	let sizeindex = [];		//제품 사이즈 인덱스
    	let orderitemStock = [];//제품 수량
    	let buyerName = $("#buyerName").val();
    	let buyerTel = $("#buyerTel").val();
    	let userAddr = $("#userAddr").val();
    	let userAddrDetail = $("#userAddrDetail").val();
    	let buyerPostcode = $("#userZipCode").val();
    	let buyerAddr = userAddr+" "+userAddrDetail;
    	let prdName = $("#prdName").html();
    	let orderName = "";
    	
    	let sizeindexHiddne = document.querySelectorAll('input[name="sizeindex"]');
    	let orderitemStockHidden = document.querySelectorAll('input[name="orderitemStock"]');
    	if(sizeindexHiddne.length != 0){
    		sizeindexHiddne.forEach(function(i){
    			sizeindex.push(i.value)
    		})    		
    	}
    	
    	if(orderitemStockHidden.length != 0){
    		orderitemStockHidden.forEach(function(i){
    			orderitemStock.push(i.value)
    		})  
    	}
    	
    	if(sizeindexHiddne.length > 1){
    		orderName = prdName+" 외 "+(sizeindexHiddne.length-1)+"건";
    	}else{
    		orderName = prdName;
    	}
    	
        IMP.request_pay({
            pg : 'kcp.9810030929',	
            pay_method : 'card',
            merchant_uid: orderNum, //주문번호
            name : orderName,		//상품 이름
            amount : totalPrice,	//결제될 가격
            buyer_name : buyerName,	//구매자 이름
            buyer_tel : buyerTel,//구매자 연락처
            buyer_addr : buyerAddr,		//구매자 주소(주소+상세주소)
            buyer_postcode : buyerPostcode	//구매자 우편번호
        }, function (rsp) { // callback
            if (rsp.success) {
            	let userIndex = '<c:out value="${login.userIndex}"/>';
                $.ajax({
                	url:"<%=request.getContextPath()%>/ajax/createOrder.do",
                	type:"post",
                	traditional : true,
                	data:{
                        imp_uid: rsp.imp_uid,            // 결제 고유번호
                        merchant_uid: rsp.merchant_uid,	 // 주문번호
                        totalPrice : totalPrice,		//결제금액
                        userIndex : userIndex,			//구매자 인덱스
                        sizeindex : sizeindex,			//구매할 상품 사이즈 인덱스(상품 특정)
                        orderitemStock : orderitemStock //각 상품당 구매수량
                	},
                	success:function(data){
                		if(data == 0){
                			alter("결제가 완료되었습니다.");
                		}
                	}
                });
            } else {
            	alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
            }
        });
    }

    totalprice();
    </script>
</body>
</html>
