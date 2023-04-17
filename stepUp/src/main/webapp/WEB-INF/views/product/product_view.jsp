<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>        
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>productView</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<%@ include file="../include/header.jsp" %>

    <main><!--메인 시작-->
      <article id="prd_view"><!-- 상품 사진 + 선택 영역-->
        <div id="prd_pic">
            <ul>
                <li class="small_img" style="background-image:url(<%=request.getContextPath() %>/resources/prdmainimg/${prdVO.prdRname})" onclick="chgimg(this)"></li>
                <c:forEach var="subImg" items="${prdImgVO}">
                	<li class="small_img" style="background-image:url(<%=request.getContextPath() %>/resources/prdsubimg/${subImg.prdImgRname})" onclick="chgimg(this)"></li>
                </c:forEach>       
            </ul>
            <div class="big_img" style="background-image:url(<%=request.getContextPath() %>/resources/prdmainimg/${prdVO.prdRname}"></div>
        </div>
        <div id="prd_select">
           <ul id="prd_info">
                <li id="prd_brand"><span>
	               <c:set var="BrandCode" value="${fn:substring(prdVO.prdCode,0,2)}"/>
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
                </span></li>
                <li id="prd_name">
                <span>${prdVO.prdName}</span>
                <c:if test="${not empty login}">     
	                <c:choose>
		                <c:when test="${not empty markResult}">
		                	<span class="xi-heart" id="mark">
		                </c:when>
		     			<c:otherwise>
		     				<span class="xi-heart-o" id="mark">
		     			</c:otherwise>
	                </c:choose>
                </c:if>
                </li>
                <li id="prd_code"><span>상품코드:${prdVO.prdCode}</span></li>
                <li id="prd_price"><fmt:formatNumber value="${prdVO.prdPrice}" pattern="#,###"/>원</li>
           </ul>
           <div id="size_ttl">사이즈</div>
           <ul  id="select_box">
           		<c:forEach var="sizeList" items="${sizeVO}">
	                <li class="select_size">
	                    <input type="checkbox" name="size" value="${sizeList.sizeKind}" id="size${sizeList.sizeKind}" onclick="updateSizeSelected(this)">
	                    <input type="hidden" name="sizeNum" id="sizeNum" value="${sizeList.sizeIndex}" />
	                    <label for="size${sizeList.sizeKind}">
	                        <span>${sizeList.sizeKind}</span>
	                    </label>
	                </li>           		
           		</c:forEach>
           </ul>
	           <ul class="size_selected" id="prdSizeArea">
	           </ul>
           <div class="total_price"></div>
           <button id="cart_btn" onclick="inputCart()">장바구니</button>
           <button id="buy_btn">바로구매</button>
        </article>
        <article id="info_link"> <!--상품 관련 링크 탭-->
            <div><a href="#prdinfo_tap1">상품정보</a></div>
            <span>|</span>
            <div><a href="#prdinfo_tap2">상품설명</a></div>
            <span>|</span>
            <div><a href="#prdinfo_tap3">반품/교환정보</a></div>
            <span>|</span>
            <div><a href="#prdinfo_tap4">상품평</a></div>

        </article>
        <article id="prdinfo_tap1"> <!--상품정보-->
           <table>
                <tr>
                    <td class="prd_table1">상품등록일</td>
                    <td>
                    	<fmt:parseDate value="${prdVO.prdDate}" var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"/>
                    	<fmt:formatDate value="${dateFmt}" type="date" pattern="yyy-MM-dd"/>
                    </td>
                </tr>
                <tr>
                    <td class="prd_table1">제품제조국</td>
                    <td>${prdVO.prdMadeIn}</td>
                </tr>                
                <tr>
                    <td class="prd_table1">제품소재</td>
                    <td>${prdVO.prdMt}</td>
                </tr>
                <tr>
                    <td class="prd_table2">품질보증기준</td>
                    <td>구입 후 6개월. 유통 중 손상되었거나 품질에 이상이 있는 제품에 한하여 소비자피해보상규정에 의거 보상하여 드립니다.  제품에
                        부착되어 있는 사용방법 및 취급시 주의사항에 따라 제품을 관리해주시기 바랍니다.</td>
                </tr>
                <tr>
                    <td class="prd_table2">소재관리 방법</td>
                    <td>1. 신발의 외형보호를 위해 뒤꿈치를 꺾어 신지마세요. 
                         2. 화기에 절대로 가까이 두지 마세요.
                         3. 천연가죽이나 천소재 상품은 물기 및 마찰에 의해 색깔이 변할 가능성이 있습니다. 
                         4. 가벼운 오염물이 묻었을 경우 마른 천으로 닦거나, 부드러운 솔로 털어 주세요.
                         5. 신발에 기름기가 묻지 않도록 주의해주세요.</td>
                </tr>
           </table>
        </article>
        <article id="prdinfo_tap2"> <!--상품 설명-->
            ${prdVO.prdCnt}
        </article>

        <article id="prdinfo_tap3"><!--반품/교환정보-->
            <table>
                <tr>
                    <td class="prd_table1">배송사</td>
                    <td>CJ대한통운 (상품 준비 기간이 소요될 수 있습니다.)</td>
                </tr>
                <tr>
                    <td class="prd_table1">배송안내</td>
                    <td>- 전상품 무료배송입니다.<br>
                        - 상품 출고 후 영업일 기준 평균 배송일 2~3일내 받을 수 있습니다.(공휴일/주말 제외, 배송사 사정에 따라 지연될 수 있음)<br>
                        - 지정된 택배 이외의 타 택배사 이용시 추가되는 비용은 고객님께서 부담하셔야 합니다.<br>
                        [ 반송지 주소 : 전라북도 전주시 덕진구 백제대로 572 5층 ]</td>
                </tr>                
                <tr>
                    <td class="prd_table1">반품/교환 정보</td>
                    <td>- 상품이 이미 출고 되었을 때 수취 거부가 불가합니다.<br>
                        - 반품은 상품 수령일로부터 7일 이내에 반품접수를 하셔야 하며, 접수 후 (업무일) 3일이내에 본사 반송지에 도착하여야 합니다.<br>
                        - 반품/교환시, 반스 온라인몰에서 꼭 반품접수를 하신 후 진행하셔야 합니다.<br>
                        - AS 문의는 고객센터에 문의를 하여야 합니다.<br>
                        - 상품포장이 훼손되거나 상품가치가 상실된 경우 반품/교환이 불가합니다.<br>
                        - 교환 접수가 되었더라도, 교환 제품이 재 출고될 시점에 재고가 품절인 경우 반품으로 전환될 수 있습니다.</td>
                </tr>
                <tr>
                    <td class="prd_table2">반품 배송비</td>
                    <td>- 고객단순변심 시, 배송비는 고객 부담입니다.<br>
                        - 상품불량 및 오배송 시, 배송비는 판매자 부담입니다.<br>
                        - 주문시 무료배송으로 수령하신 경우, 고객단순 변심시 최초 배송비가 포함 부과됩니다.<br>
                        - 개별 반송 시, 추가적으로 발생하는 비용은 고객 부담입니다.</td>
                </tr>
                <tr>
                    <td class="prd_table2">교환 배송비</td>
                    <td>- 고객 단순 변심 시, 왕복 배송비는 고객 부담입니다.<br>
                        - 상품불량 및 오배송 시, 왕복 배송비는 판매자 부담입니다.<br>
                        - 단, 교환 상품에 대해 검수 시, 교환 사유가 당사 귀책 사유에 부합하지 않을 경우 배송비 결제 후 교환 처리가 가능합니다.</td>
                </tr>                
                <tr>
                    <td class="prd_table2">반품/교환 불가 경우</td>
                    <td>
                        - 반품/교환요청 기간(7일)이 지난 경우<br>
                        - 포장을 개봉하였거나 포장이 훼손되어(상품의 Tag분리/분실, 비닐포장 훼손, 신발박스 훼손 등) 상품가치가 현저히 감소한 경우<br>
                        - 악세서리 고유의 포장을 개봉 하였으나 단순 변심으로 교환, 반품 원하는 경우<br>
                        - 구매자의 책임있는 사유로 상품 등이 멸실 또는 훼손된 경우<br>
                        - 구매자의 사용 또는 일부 소비에 의하여 상품가치가 현저히 감소한 경우<br>
                        - 기간의 경과에 의하여 재판매가 곤란할 정도로 상품가치가 현저히 감소한 경우<br>
                        - 복제가 가능한 상품 등의 포장을 훼손한 경우<br>
                        - 단, 재화 등의 내용이 표시 (이미지 또는 기능을 포함) 및 광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급<br>
                        &nbsp;&nbsp;받은 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약 철회 등을 할 수 있습니다.
                    </td>
                </tr>
            </table>
        </article> 
        <article id="prdinfo_tap4"><!--상품평-->
            <div id="review_write">
                <p id="review_formTtl">상품평(작성된 상품평의 갯수)</p>
                <c:if test="${not empty login}">
	                <div>
	                    <form name="reviewFrm" action="<%=request.getContextPath()%>/review/insert.do" method="post">
	                    	<input type="hidden" name="userIndex" value="${login.userIndex}"/>
	                    	<input type="hidden" name="prdIndex" value="${prdVO.prdIndex}"/>
	                        <textarea id="review_writeCnt" name="reviewContent" placeholder="상품평을 남겨주세요"></textarea>
	                        <div id="rating_ctn">
	                            <span>별점을 남겨주세요</span>
	                            <div class="star-rating">
	                                <input type="radio" id="5-stars" name="reviewScore" value="5" />
	                                <label for="5-stars" class="star">&#9733;</label>
	                                <input type="radio" id="4-stars" name="reviewScore" value="4" />
	                                <label for="4-stars" class="star">&#9733;</label>
	                                <input type="radio" id="3-stars" name="reviewScore" value="3" />
	                                <label for="3-stars" class="star">&#9733;</label>
	                                <input type="radio" id="2-stars" name="reviewScore" value="2" />
	                                <label for="2-stars" class="star">&#9733;</label>
	                                <input type="radio" id="1-star" name="reviewScore" value="1" />
	                                <label for="1-star" class="star">&#9733;</label>
	                            </div>
	                            <button>등록</button>
	                        </div>
	                    </form>
	                </div>
                </c:if>
            </div> 
            <ul id="review_ctn"><!-- 리뷰 보여주는 곳 -->	
            </ul>
            <ul id="reeview_page">
            </ul>
        </article> 
	</main>
<%@ include file="../include/footer.jsp" %>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script>
		function updateSizeSelected(obj) { 
		    const selectedSizes = document.querySelectorAll('input[name="size"]:checked');
		    console.log(selectedSizes.length);
		    if ( selectedSizes.length <=3 ){
		        const sizeSelected = document.querySelector('.size_selected');
		        sizeSelected.innerHTML = '';
		        selectedSizes.forEach(function(size) {
		            const price = ${prdVO.prdPrice};
		            const formattedPrice = price.toLocaleString();
		            const li = document.createElement('li');
		            const sizeIndex = size.nextElementSibling;
		            li.innerHTML = '<div class="select_prdName"><span>${prdVO.prdName}</span> <span>사이즈 ' + size.value + '</span></div>' +
		            '<input type="hidden" id="sizeIndex" value="'+sizeIndex.value+'" name="sizeIndex">'+
		            '<button class="decrease-btn" onclick="decreaseQuantity(\'' + size.value + '\'); totalPrice();">-</button>' +
		            '<input class="qnt_numb" name="cartStock"  id="quantity_' + size.value + '" type="text" value="1" disabled>' +
		            '<button class="increase-btn" onclick="increaseQuantity(\'' + size.value + '\'); totalPrice();">+</button>' +
		            '<div class="selec_PrdPrice">' +
		            '<span id="price_' + size.value + '">' + formattedPrice + '원</span>' +
		            '<label for="size' + size.value + '">' +
		            '<div class="x-btn, xi-close" ></div>' +
		            '</label>' +
		            '</div>';
		            sizeSelected.appendChild(li);
		        });
		        totalPrice();
		    } else if (selectedSizes.length >= 4) {
		        alert("사이즈는 최대 3개까지 선택 가능합니다.");
		        $(obj).prop("checked",false);
		    }
		}
		
		function increaseQuantity(size) {
		    const quantityInput = document.getElementById('quantity_' + size);
		    let quantity = parseInt(quantityInput.value);
		    quantity++;
		    quantityInput.value = quantity;
		    totalPrice();
		    sizePrice(quantity, size);
		}
		
		function decreaseQuantity(size) {
		    const quantityInput = document.getElementById('quantity_' + size);
		    let quantity = parseInt(quantityInput.value);
		    if (quantity > 1) {
		        quantity--;
		        quantityInput.value = quantity;
		        totalPrice();
		        sizePrice(quantity, size);
		    }
		}
		
		function sizePrice(quantity, size) {   
		    const price = ${prdVO.prdPrice};
		    const sizeQntPrice = (price * quantity).toLocaleString();
		    document.querySelector('#price_' + size).textContent = sizeQntPrice + '원';
		}
		       
		function totalPrice() {
		    const selectedSizes = document.querySelectorAll('input[name="size"]:checked');
		    if (selectedSizes.length !== 0) {
		        let total = 0;
		        selectedSizes.forEach(function(size) {
		            const quantityInput = document.getElementById('quantity_' + size.value);
		            const quantity = parseInt(quantityInput.value);
		            const price = ${prdVO.prdPrice};
		            total += quantity * price;
		        });
		        const formattedPrice = '총 금액 : ' + total.toLocaleString() + ' 원';
		        document.querySelector('.total_price').textContent = formattedPrice;             
		    } else {
		        document.querySelector('.total_price').textContent = '';
		    }
		}
		    
		    
	    var bigimg = document.querySelector(".big_img");
	    
	    function chgimg(element){
	      var newimg = element.style.backgroundImage;
	      bigimg.style.backgroundImage = newimg;
	    } 
	    
		
	    //찜버튼 변경 스크립트
	    $("#mark").click(function(){
	    	let userIndex = "<c:out value='${login.userIndex}'/>";
	    	let prdIndex = "<c:out value='${prdVO.prdIndex}'/>";
	    	if($("#mark").hasClass("xi-heart-o")){
	    		$.ajax({
	    			url:"<%=request.getContextPath()%>/ajax/addMark.do",
	    			type:"post",
	    			data:{userIndex : userIndex , prdIndex : prdIndex},
	    			success : function(){
	    				$("#mark").attr("class", "xi-heart");
	    			}
	    		});
	    	}else if($("#mark").hasClass("xi-heart")){
	    		$.ajax({
	    			url:"<%=request.getContextPath()%>/ajax/removeMark.do",
	    			type:"post",
	    			data:{userIndex : userIndex, prdIndex : prdIndex},
	    			success : function(){
	    				$("#mark").attr("class", "xi-heart-o");
	    			}
	    		});
	    	}
			
	    });
	    
	    //장바구니 상품추가 ajax
	    function inputCart(){
	    	let userIndex =  "<c:out value='${login.userIndex}'/>";
	    	let sizeIndex = [];
	    	let sizeStock = [];
	    	const sIndex = document.querySelectorAll("input#sizeIndex");
	    	sIndex.forEach(function(sIndex) {
	    		sizeIndex.push(sIndex.value);
	    	});
	    	
	    	const selectedSizes = document.querySelectorAll('input[name="size"]:checked');
	    	if (selectedSizes.length !== 0) {
		    	selectedSizes.forEach(function(size){
		    	const sStock = document.querySelectorAll("input#quantity_"+size.value);	
			    	sStock.forEach(function(sStock){
			    		sizeStock.push(sStock.value);
			    	});
		    		
		    	});
	    	}
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/inputCart.do",
				type:"post",
				traditional : true,
				data:{
					sizeIndex : sizeIndex,
					sizeStock : sizeStock,
					userIndex : userIndex
				},
				success:function(){
					
				}
			})
	    }
        
	    //상품 리뷰 paging ajax
	    function goPage(nowPage){
	    	let prdIndex = <c:out value="${prdVO.prdIndex}"/>
	    	let loginIndex = <c:out value="${login.userIndex}"/>
	    	$.ajax({
	    		url:"<%=request.getContextPath()%>/ajax/prdPaging.do",
	    		type:"get",
	    		data:{nowPage : nowPage, prdIndex : prdIndex},
	    	    success: function(data) { // Ajax 요청이 성공한 경우 실행될 콜백 함수
	    	    	let reviewHtml = '';
	    	    	console.log(data);
	    	    	for(let i = 0; i < data.length; i++){
	    	    		let reviewList = data[i];
	    	    		let reviewDate = moment(reviewList.reviewDate).format('YYYY-MM-DD');
	    	    		reviewHtml += '<li>';
	    	    		reviewHtml += '<form name="rfrm" action="<%=request.getContextPath()%>/review/delete.do" method="post" onsubmit="reviewDel()">';
	    	    		reviewHtml += '<input type="hidden" name="reviewIndex" value="'+reviewList.reviewIndex+'">';
	    	    		reviewHtml += '<input type="hidden" name="prdIndex" value="'+reviewList.prdIndex+'">';
	    	    		reviewHtml += '<span class="review_star">';
	    	    		for(let j = 1; j <= reviewList.reviewScore; j++){
	    	    			reviewHtml += '&#9733;';
	    	    		}
	    	    		for(let j = 1; j <= (5 - reviewList.reviewScore); j++){
	    	    		reviewHtml += '&#9734;';
	    	    		}
	    	    		reviewHtml += '</span>';
	    	    		reviewHtml += '<span class="review_writer">'+reviewList.userNick+'</span>';
	    	    		reviewHtml += '<span class="review_wdate">';
	    	    		reviewHtml += ''+reviewDate+''
	    	    		reviewHtml += '</span>';
	    	    		if(loginIndex == reviewList.userIndex){
		    	    		reviewHtml += '<input class="review_del" type="submit" value="삭제">';
		    	    		reviewHtml += '<input class="review_edit"  type="button" value="수정"  onclick="reviewModify('+reviewList.reviewIndex+')">';
	    	    		}
	    	    		reviewHtml += '</div>';
	    	    		reviewHtml += '<div class="review_note">'+reviewList.reviewContent+'</div>';
	    	    		reviewHtml += '</form>'
	    	    		reviewHtml += '</li>'
	    	    		paging(nowPage, prdIndex);
	    	    	}
	    	    	$("#review_ctn").html(reviewHtml);
	    	    	
	    	    }
	    	})
	    }

	    //리뷰 페이징 버튼 ajax 처리
	    function paging(nowPage, prdIndex){
	    	let pagingHtml = '';
	    	$.ajax({
	    		url:"<%=request.getContextPath()%>/ajax/prdPaging.do",
	    		type:"post",
	    		data:{nowPage : nowPage, prdIndex : prdIndex},
	    		success: function(data) {
				let startPage = Number(data.startPage);
				let endPage = Number(data.endPage);
				let perPage = Number(data.perPage);
				let total = Number(data.total);
				let now = Number(data.nowPage);
				let lastPage = Number(data.lastPage);
		    	pagingHtml += '<li class="d-flex justify-content-center">';
		    	pagingHtml += '<a href="javascript:void(0);" class="xi-angle-left"  onclick="goPage('+(now - 1)+')" style= "display:'+(now != 1  ? 'block' : 'none')+'"></a>';
		    	pagingHtml += '<div id="pagingNumBtn">';
		    	for(let i = startPage; i <= endPage; i ++){
		    		if(now != i){
		    			pagingHtml += '<a href="javascript:void(0);" class="pe-1" onclick="goPage('+i+')">'+i+'</a>';
		    		}else{
		    			pagingHtml += '<span class="pe-1 text-primary">'+i+'</span>';
		    		}
		    	}
		    	pagingHtml += '</div> ';
		    	pagingHtml += '<a href="javascript:void(0);" class="xi-angle-right" onclick="goPage('+(now+ 1)+')" style= "display:'+(now != lastPage ? 'block' : 'none')+'"></a>';
		    	pagingHtml += '</li>';
		    	$("#reeview_page").html(pagingHtml);
 	    		}
	    	}) 
	    }
	    
	 	//상품 리뷰 paging 페이지 로드시 호출
	    $(document).ready(function(){
	    	goPage(1);
	    });
	    
	    
	 	function reviewDel(){
	    	if(confirm("해당 리뷰를 삭제하시겠습니까?") == 0){
	    		return false;
	    	}
	    		return true;
	    }
	    
	    function reviewModify(reviewIndex){
	    	 window.open("<%=request.getContextPath()%>/review/modify.do?reviewIndex="+reviewIndex, "리뷰수정", "width=900%,height=150%, top=250%, left=300%");
	    }
	</script>
</body>
</html>
