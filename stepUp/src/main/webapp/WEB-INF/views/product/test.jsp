<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   	<!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>
<body>
	로그인 후 사용가능합니다.
	<c:if test="${not empty login}">
		<button onclick="callPay()">결제 요청</button>
	</c:if>
	

	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
		
    	let totalPrice = 100;		//결제될 가격
    	let sizeindex = [1, 2];		//제품 사이즈 인덱스
    	let orderitemStock = [5, 10];//제품 수량
        function callPay() {//결제 버큰 클릭시 함수 호출
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
            IMP.request_pay({
                pg : 'kcp.9810030929',	
                pay_method : 'card',
                merchant_uid: orderNum, //주문번호
                name : '당근 10kg',		//상품 이름
                amount : totalPrice,	//결제될 가격
                buyer_name : '조범준',	//구매자 이름
                buyer_tel : '010-5378-6735',//구매자 연락처
                buyer_addr : '전주시',		//구매자 주소(주소+상세주소)
                buyer_postcode : '123-456'	//구매자 우편번호
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
    </script>
</body>
</html>