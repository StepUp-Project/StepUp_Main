<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="proj.stepUp.vo.CartVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*" %>
<% 
	List<CartVO> clist = (List<CartVO>)request.getAttribute("clist");
%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
</head>

<body>
<%@ include file="../include/header.jsp" %>    
   <main class="d-flex justify-content-between "><!--메인 시작-->
        <section class="cart-top"><!--장바구니 탑메뉴-->
        <h1>장바구니</h1>
        <div class="cart-right">장바구니 > 주문결제 > 주문완료</div>
        <div class="cart-line"></div>
        </section><!--장바구니 탑메뉴 끝-->
        <section class="cart-table"><!--표입력-->
            <table>
                <thead><!--표 상단시작-->
                    <tr>
                        <th class="th1"><div><input id="cart-checkbox-all" type="checkbox" checked="checked"></div></th>
                        <th class="th2" colspan="2"><div>상품명</div></th>
                        <th class="th3"><div>가격</div></th>
                        <th class="th3"><div>수량</div></th>
                        <th class="th3"><div>합계</div></th>
                        <th class="th3"><div>배송비</div></th>
                        <th class="th3"><div>삭제하기</div></th>
                    </tr>
                </thead><!--표상단 끝-->
                <tbody><!--장바구니 상품 표시-->
                <c:if test="${empty clist}">
	                <tr>
	                	<th colspan="8" style="padding:150px 0; background-color:#f5f5f5; font-size:30px;"><a>장바구니가 비었습니다</a></th>
	                </tr>
                </c:if>
                <c:forEach var="vo" items="${clist}">
                   <tr class="cart-menu">
                    	<input type="hidden" value="${vo.cartIndex}" name="cart_hid">
						<input type="hidden" value="${vo.prdIndex}" name="cart_prd">
                        <th class="th1">
	                        <div>
	                        	<input name="cart_check" class="cart-checkbox" id="cart-check_${vo.cartIndex}" value="" type="checkbox" checked="true">
	                        </div>
                        </th>
                        <th class="th2 th7">
	                        <div>
	                        	<a href="<%=request.getContextPath()%>/product/view.do?prdIndex=${vo.prdIndex}"><img src="<%=request.getContextPath() %>/resources/prdmainimg/${vo.prdRname}"></a>
	                        </div>
                        </th>
                        <th class="th2 th6"><div>${vo.prdName}<br/><span>사이즈 : ${vo.sizeKind}</span></div></th>
                        <th class="th3"><div id="cart-price_${vo.cartIndex}"><fmt:formatNumber value="${vo.prdPrice}" pattern="#,###"/> 원</div></th>
                        <th class="th3 th5">
	                        <div>
		                        <button type="button" onclick="decrease(${vo.cartIndex})">&#45;</button>
		                        <input type="text" id="quantity_${vo.cartIndex}" value="${vo.cartStock}" oninput="this.value = this.value.replace(/[^0-9]/g, ''); totalPrice(${vo.cartIndex});" min="1" max="${vo.sizeStock}">
		                        <button type="button" onclick="increase(${vo.cartIndex})">&#43;</button>
	                        </div>
                        </th>
                        <th class="th3 th8"><div id="totalPrice_${vo.cartIndex}"></div></th>
                        <th class="th3"><!--고정--><div>무료배송</div></th>
                        <th class="th3 th4"><!--제품정보 삭제 기능 구현할 스크립트 작성 필요--><div><input type="button" value="삭제하기" onclick="del(${vo.cartIndex})"></div></th>
                    </tr>
                </c:forEach>
                </tbody><!--장바구니 상품 표시 끝-->
                <tfoot>
                    <tr class="cart-foot">
                        <th colspan="6"><div class="cash-1">총 구매금액</div></th>
                        <th colspan="2"><div class="cash-2" id="mainPrice"></div></th>
                    </tr>
                </tfoot>
            </table>
           	<div class="cart-button">
		    <a href="<%=request.getContextPath()%>/index.do"><!--메인페이지로 이동-->쇼핑 계속하기</a>
		    <a href="#"><!--결제 API연결 필요-->결제하기</a>
		</div>
        </section><!--표입력 끝-->
    </main><!--메인 끝-->
	<script>
        //수량조작
        //마이너스
        function decrease(cartindex) {
            const quantity = document.getElementById('quantity_'+cartindex);
            if (quantity.value > 1) {
            	quantity.value = parseInt(quantity.value) - 1;
            	}
            totalPrice(cartindex);
            mainPrice();
          }
          //플러스
          function increase(cartindex) {
        	const quantity = document.getElementById('quantity_'+cartindex);
        	if(quantity.value < 10){
        		quantity.value = parseInt(quantity.value) + 1;
        	}
        	totalPrice(cartindex);
        	mainPrice();
          }
          //가격 * 개수 합산 가격
          function totalPrice(cartindex) {
        	const quantity = parseInt(document.getElementById('quantity_'+cartindex).value);
        	let cartprice = document.getElementById('cart-price_'+cartindex).innerHTML;
        	var prdPrice = cartprice.replace(/,/g, '').replace(/ 원/g, '');
			var totalPrice = prdPrice * quantity;
			let checkValue = document.getElementById('cart-check_'+cartindex);
			checkValue.value = totalPrice;
			const totalPriceElement = document.getElementById('totalPrice_'+cartindex);
			totalPriceElement.innerText = new Intl.NumberFormat().format(totalPrice) + "원";
          }
          
          //총금액 계산
          function mainPrice(){
        	  let cartcheck = document.querySelectorAll('input[name="cart_check"]:checked');
			  let mainprice = 0;
        	  if(cartcheck.length != 0){
				  cartcheck.forEach(function(i){
					  mainprice += parseInt(i.value);
				  })
			  }       	
          	const mainPriceElement = document.getElementById('mainPrice');
			mainPriceElement.innerText = new Intl.NumberFormat('ko-kr').format(mainprice) + "원";
          }
          let allChecked = true;
          //체크박스 선택
          const checkboxAll = document.querySelector('#cart-checkbox-all');
          let checkboxes = document.querySelectorAll('input[name="cart_check"]');
          checkboxes.forEach(function(i){       	  
        	  i.addEventListener('change', function(){
        		  mainPrice();
        		  if(!i.checked){
        			  checkboxAll.checked = false;
        		  }
        	  })
          })
          checkboxAll.addEventListener('change', (event) => {
            checkboxes.forEach((checkbox) => {
              checkbox.checked = event.target.checked;
              mainPrice();
            });
          });
          
          function del(cartIndex){
        	  if(confirm("삭제하시겠습니까?") == 0){
        		  return false;
        	  }
        	  location.href="<%=request.getContextPath()%>/cart/cartdel.do?cartIndex="+cartIndex;
          
        	  }
        </script>
<%@ include file="../include/footer.jsp" %>
	<script type="text/javascript">
		let carthidden = document.querySelectorAll('input[name="cart_hid"]');
		if(carthidden.length != 0){
			carthidden.forEach(function(c){
				totalPrice(c.value);
			})
		}
		mainPrice();
   	</script>
</body>
</html>
