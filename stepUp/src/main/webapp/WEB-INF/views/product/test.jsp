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

        function callPay() {
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/ordernum.do",
				type:"post",
				success:function(data){
					console.log("진입");
			        var IMP = window.IMP; 
			        IMP.init("imp73884570"); 
			        requestPay(data);
				}
			});
        }
		
        function requestPay(orderNum) {
        	console.log(orderNum);
            IMP.request_pay({
                pg : 'kcp.9810030929',
                pay_method : 'card',
                merchant_uid: "5564", 
                name : '당근 10kg',
                amount : 1004,
                buyer_email : 'Iamport@chai.finance',
                buyer_name : '포트원 기술지원팀',
                buyer_tel : '010-1234-5678',
                buyer_addr : '서울특별시 강남구 삼성동',
                buyer_postcode : '123-456'
            }, function (rsp) { // callback
                if (rsp.success) {
                    console.log(rsp);
                } else {
                    console.log(rsp);
                }
            });
        }
    </script>
</body>
</html>