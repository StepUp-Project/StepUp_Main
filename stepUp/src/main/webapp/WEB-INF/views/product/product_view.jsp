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
     <header id="header"><!--헤더 시작-->
        <div class="d-flex justify-content-between pt-5"><!--d-flex 영역 시작-->
            <div class="p-2 logo-wrap" ><!-- 로고 영역 시작-->
                <h1 class="logo">
                    <a href="/">
                        <span>kikshub</span>
                    </a>    
                </h1>
            </div><!-- 로고 영역 끝-->
            <nav><!--메인 네비게이션 영역 시작-->
                <ul class="d-flex" id="gnb">
                    <li>
                        <a href="#">WE ARE</a>
                        <ul class="mt-5"><!--sub 네비게이션 -->
                            <li><a href="#">소개</a></li>
                            <li><a href="#">위치</a></li>
                        </ul><!--sub 네비게이션 끝-->
                    </li>
                    <li>
                        <a href="#">BRAND</a>
                        <ul class="mt-5"><!--sub 네비게이션 -->
                            <li><a href="#">나이키</a></li>
                            <li><a href="#">뉴발란스</a></li>
                            <li><a href="#">아디다스</a></li>
                            <li><a href="#">반스</a></li>
                            <li><a href="#">푸마</a></li>
                            <li><a href="#">크록스</a></li>
                            <li><a href="#">컨버스</a></li>
                            <li><a href="#">휠라</a></li>
                        </ul><!--sub 네비게이션 -->
                    </li>
                    <li>
                        <a href="#">NEW</a>
                    </li>
                    <li><a href="#">BEST</a></li>
                    <li><a href="#">EVENT</a></li>
                    <li>
                        <a href="#">COMMUNITY</a>
                        <ul class="mt-5"><!--sub 네비게이션 -->
                            <li><a href="#">자유게시판</a></li>
                            <li><a href="#">중고거래</a></li>
                            <li><a href="#">경매</a></li>
                        </ul><!--sub 네비게이션 -->
                    </li>
                    <li>
                        <a href="#">CUSTOMER</a>
                        <ul class="mt-5"><!--sub 네비게이션 -->
                            <li><a href="#">공지사항</a></li>
                            <li><a href="#">QnA</a></li>
                        </ul><!--sub 네비게이션 -->
                    </li>
                </ul>
            </nav><!--메인 네비게이션 영역 끝-->
            <div class="p-2 me-4" id="user"><!-- 로그인, 장바구니, 마이페이지 영역 시작-->
                <a href="#"><i class="xi-search"></i></a>
                <a href="#"><i class="xi-user-o"></i></a>
                <a href="#"><i class="xi-cart-o"></i></a>
            </div><!-- 로그인, 장바구니, 마이페이지 영역 끝-->
	    </div><!--d-flex 영역 끝-->
    </header><!--헤더 끝-->   

    <main><!--메인 시작-->
      <article id="prd_view"><!-- 상품 사진 + 선택 영역-->
        <div id="prd_pic">
            <ul>
                <li class="small_img" style="background-image:url(<%=request.getContextPath() %>/resources/prdmainimg/${prdVO.prdRname})"></li>
                <c:forEach var="subImg" items="${prdImgVO}">
                	<li class="small_img" style="background-image:url(<%=request.getContextPath() %>/resources/prdsubimg/${subImg.prdImgRname})"></li>
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
                <li id="prd_name"><span>${prdVO.prdName}</span><span>♥</span></li>
                <li id="prd_code"><span>상품코드:${prdVO.prdCode}</span></li>
                <li id="prd_price"><fmt:formatNumber value="${prdVO.prdPrice}" pattern="#,###"/>원</li>
           </ul>
           <div id="size_ttl">사이즈</div>
           <ul  id="select_box">
                <li class="select_size">
                    <input type="checkbox" name="size" value="210" id="size210" onclick="updateSizeSelected(this)">
                    <label for="size210">
                        <span>210</span>
                    </label>
                </li>
                <li class="select_size">
                    <input type="checkbox" name="size" value="220" id="size220" onclick="updateSizeSelected(this)">
                    <label for="size220">
                        <span>220</span>
                    </label>
                </li>
                <li class="select_size">
                    <input type="checkbox" name="size" value="230" id="size230" onclick="updateSizeSelected(this)">
                    <label for="size230">
                        <span>230</span>
                    </label>
                </li>
                <li class="select_size">
                    <input type="checkbox" name="size" value="240" id="size240" onclick="updateSizeSelected(this)">
                    <label for="size240">
                        <span>240</span>
                    </label>
                </li>
                <li class="select_size">
                    <input type="checkbox" name="size" value="250" id="size250" onclick="updateSizeSelected(this)">
                    <label for="size250">
                        <span>250</span>
                    </label>
                </li>
                <li class="select_size">
                    <input type="checkbox" name="size" value="260" id="size260" onclick="updateSizeSelected(this)">
                    <label for="size260">
                        <span>260</span>
                    </label>
                </li>
                <li class="select_size">
                    <input type="checkbox" name="size" value="270" id="size270" onclick="updateSizeSelected(this)">
                    <label for="size270">
                        <span>270</span>
                    </label>
                </li>
                <li class="select_size">
                    <input type="checkbox" name="size" value="280" id="size280"  onclick="updateSizeSelected(this)">
                    <label for="size280">
                        <span>280</span>
                    </label>
                </li>
           </ul>
           <ul class="size_selected">
           </ul>
           <div class="total_price"></div>
           <button id="cart_btn">장바구니</button>
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
                    <td>2023-03-17</td>
                </tr>
                <tr>
                    <td class="prd_table1">제품제조국</td>
                    <td>NIKE / 베트남</td>
                </tr>                
                <tr>
                    <td class="prd_table1">제품소재</td>
                    <td>갑피 : 천연가죽(소가죽) / 폴리에스터 100% / 합성수지, 안감 : 폴리에스터 100%, 창 : 합성고무</td>
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
            <div class="prd_infoPic" style="background-image:url(../image/product/NK01020/NK01020-main1.jpg)" ></div>
            <p></p>
            <div class="prd_infoPic" style="background-image:url(../image/product/NK01020/NK01020-main2.jpg)" ></div>
            <p></p>
            <div class="prd_infoPic" style="background-image:url(../image/product/NK01020/NK01020-main3.jpg)" ></div>
            <div class="prd_infoPic" style="background-image:url(../image/product/NK01020/NK01020-main4.jpg)" ></div>
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
                <div>
                    <form>
                        <textarea id="review_writeCnt"  placeholder="상품평을 남겨주세요"></textarea>
                        <div id="rating_ctn">
                            <span>별점을 남겨주세요</span>
                            <div class="star-rating">
                                <input type="radio" id="5-stars" name="rating" value="5" />
                                <label for="5-stars" class="star">&#9733;</label>
                                <input type="radio" id="4-stars" name="rating" value="4" />
                                <label for="4-stars" class="star">&#9733;</label>
                                <input type="radio" id="3-stars" name="rating" value="3" />
                                <label for="3-stars" class="star">&#9733;</label>
                                <input type="radio" id="2-stars" name="rating" value="2" />
                                <label for="2-stars" class="star">&#9733;</label>
                                <input type="radio" id="1-star" name="rating" value="1" />
                                <label for="1-star" class="star">&#9733;</label>
                            </div>
                            <button>등록</button>
                        </div>
                    </form>
                </div>
            </div> 
            <ul id="review_ctn">
                <li><!-- 리뷰 보여주는 곳 -->
                    <div class="review_winfo">
                        <span class="review_star">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
                        <span class="review_writer">작성자</span>
                        <span class="review_wdate">2023.03.17</span>
                        <input class="review_del"  type="button" value="삭제">
                        <input class="review_edit"  type="button" value="수정">
                    </div>
                    <div class="review_note">리뷰 작성 내용</div>
                </li>
                <li>
                    <div class="review_winfo">
                        <span class="review_star">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
                        <span class="review_writer">작성자</span>
                        <span class="review_wdate">2023.03.17</span>
                        <input class="review_del"  type="button" value="삭제">
                        <input class="review_edit"  type="button" value="수정">
                    </div>
                    <div class="review_note">리뷰 작성 내용</div>
                </li>
            </ul>
            <ul id="reeview_page">
                <li>
                    <a><< < 1 2 3 4 > >></a>
                </li>
            </ul>
        </article> 
	</main>
    <footer class="d-flex justify-content-between pt-2"> <!-- 하단 시작-->
        <div class="d-flex justify-content-between pt-3, footinfo"> <!-- 회사 정보 -->
            <ul>
                <li>(주)스텝업 / 대표자: 이상훈, 곽진훈, 조범준 / 사업장소재지 : 전라북도 전주시 덕진구 백제대로 572 5층</li>
                <li>사업자등록번호 : 257-67-74617 / 통신판매업 신고번호: 제2022-2875호</li>
                <li>이메일: service@kickshub.com / 개인정보관리책임자 : 배유진</li>
                <li></li>
                <li>Copyright Ⓒ kickshub All rights reserved,</li>
            </ul>
            <ul>
                <li>고객센터 : 1660-2875</li>
                <li>운영시간 : 10:00 ~ 17:00 (주말/공휴일 휴무)</li>
                <li>점심시간 : 11:50 ~ 13:00</li>
                <li>반품주소 : 전라북도 전주시 덕진구 백제대로 572 5층</li>
                <li></li>
            </ul>
            <ul>
                <li><a href="#">회사소개</a></li>
                <li><a href="#">공지사항</a></li>
                <li><a href="#">QnA</a></li>
                <li><a href="#">운영정책관리자</a></li>
                <li></li>
            </ul>
        </div> <!-- 회사 정보 끝 -->
        <div id="footlogosns"> <!--로고 및 sns 연결 시작-->
            <h1 id="footlogo"><a href="#">
                <span>kickshub</span>
            </a></h1>
            <ul id="footsns" class="d-flex justify-content-between "> <!--SNS 링크 부분-->
                <li id="sns_fb"><a href="#"><span>facebook</span></a></li>
                <li id="sns_tw"><a href="#"><span>twitter</span></a></li>
                <li id="sns_ist"><a href="#"><span>instagram</span></a></li>
                <li id="sns_ytb"><a href="#"><span>Youtube</span></a></li>
            </ul>
        </div> <!--로고 및 sns 연결 끝-->
    </footer> <!-- 하단 끝-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script><!-- 부트스트랩 자바 스크립트연결 -->
    <script src="<%=request.getContextPath()%>/resources/JS/script.js"></script><!-- 자바 스크립트 연결 -->
        <script>
            function updateSizeSelected(obj) { 
                const selectedSizes = document.querySelectorAll('input[name="size"]:checked');
                console.log(selectedSizes.length);
                if ( selectedSizes.length <=3 ){
                    const sizeSelected = document.querySelector('.size_selected');
                    sizeSelected.innerHTML = '';
                    selectedSizes.forEach(function(size) {
                    const price = parseInt(document.getElementById('prd_price').textContent);
                    const formattedPrice = price.toLocaleString();
                    const li = document.createElement('li');
                    li.innerHTML = `
                        <div class="select_prdName"><span>레볼루션6 넥스트 네이처 /</span> <span>사이즈 ${size.value}</span></div>
                        <button class="decrease-btn" onclick="decreaseQuantity('${size.value}'); totalPrice();">-</button>
                        <input class="qnt_numb" id="quantity_${size.value}" type="text" value="1" disabled>
                        <button class="increase-btn" onclick="increaseQuantity('${size.value}'); totalPrice();">+</button>
                        
                        <div class="selec_PrdPrice">
                            <span  id="price_${size.value}">${formattedPrice}원</span>
                            <label for="size${size.value}">
                                <div class="x-btn, xi-close" ></div>
                            </label>
                        </div>
                    `;
                    sizeSelected.appendChild(li);
                });
                totalPrice();
                }else if( selectedSizes.length >=4 ){
                    alert("사이즈는 최대 3개까지 선택 가능합니다.");
                    $(obj).prop("checked",false);
                }
            }

            function increaseQuantity(size) {
                const quantityInput = document.getElementById(`quantity_${size}`);
                let quantity = parseInt(quantityInput.value);
                quantity++;
                quantityInput.value = quantity;
                totalPrice();
                sizePrice(quantity, size);
                }

            function decreaseQuantity(size) {
                const quantityInput = document.getElementById(`quantity_${size}`);
                let quantity = parseInt(quantityInput.value);
                if (quantity > 1) {
                    quantity--;
                    quantityInput.value = quantity;
                totalPrice();
                sizePrice(quantity, size);
                }
            }

            function sizePrice(quantity, size) {   
                const price = parseInt(document.getElementById('prd_price').textContent);
                sizeQntPrice = (price * quantity).toLocaleString();
                document.querySelector(`#price_${size}`).textContent = `${sizeQntPrice}원`;
            }
           

            function totalPrice() {
                const selectedSizes = document.querySelectorAll('input[name="size"]:checked');
                    if(  selectedSizes.length !=0 ){
                        let total = 0;
                        selectedSizes.forEach(function(size) {
                        const quantityInput = document.getElementById(`quantity_${size.value}`);
                        const quantity = parseInt(quantityInput.value);
                        const price = parseInt(document.getElementById('prd_price').textContent);
                        total += quantity * price;
                        const formattedPrice ='총 금액 : '+ total.toLocaleString()+' 원';
                        document.querySelector('.total_price').textContent = formattedPrice;             
                    });
                    }else{
                        document.querySelector('.total_price').textContent = '';
                    }
            }
            var bigimg = document.querySelector(".big_img");
            
            function chgimg(element){
              var newimg = element.style.backgroundImage;
              bigimg.style.backgroundImage = newimg;
            }
            </script>
</body>
</html>
