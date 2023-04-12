<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<button onclick="callPay()">결제 요청</button>

	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
		
    	let totalPrice = 100;
    	
        function callPay() {
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
                merchant_uid: orderNum, 
                name : '당근 10kg',
                amount : totalPrice,
                buyer_name : '조범준',
                buyer_tel : '010-5378-6735',
                buyer_addr : '전주시',
                buyer_postcode : '123-456'
            }, function (rsp) { // callback
                if (rsp.success) {			
                    $.ajax({
                    	url:"<%=request.getContextPath()%>/ajax/createOrder.do",
                    	type:"post",
                    	data:{
                            imp_uid: rsp.imp_uid,            // 결제 고유번호
                            merchant_uid: rsp.merchant_uid,	 // 주문번호
                            totalPrice : totalPrice
                    	},
                    	success:function(data){
                    		console.log(data);
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