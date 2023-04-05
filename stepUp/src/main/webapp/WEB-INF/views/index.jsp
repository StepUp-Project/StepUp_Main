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
    <title>KICKSHUB</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/><!-- swiper CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
    
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
            
            <aside id="search"><!--돋보기 누르면 뜨는 창-->
                <div class="inner">
                    <form class="searchbox">
                        <input type="text" placeholder="  검색">
                        <a href="#" class="searchicon"><i class="xi-search"></i></a>
                    </form>
                </div>
                <a class="close_search show"><i class="xi-close"></i></a>
            </aside><!--//#search-->
            
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

    <main><!-- 메인 시작 -->
        <div class="swiper"><!-- 메인 베너 시작 -->
            <!-- Additional required wrapper -->
            <div class="swiper-wrapper">
                <!-- Slides -->
                <div class="swiper-slide">
                    <a href="#" class="banner-link"></a>
                </div>
                <div class="swiper-slide">
                    <a href="#" class="banner-link"></a>
                </div>
                <div class="swiper-slide">
                    <a href="#" class="banner-link"></a>
                </div>
                <div class="swiper-slide">
                    <a href="#" class="banner-link"></a>
                </div>
            </div>
            <!-- If we need pagination -->
            <div class="swiper-pagination"></div>
        
            <!-- If we need navigation buttons -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        
        </div><!-- 메인 베너 끝 -->

        <div><!-- 메인 콘텐츠 영역 시작 -->
            <div class="main-new"><!-- NEW 영역 시작-->
                <div class="main-new-title">
                    <h2>NEW</h2>
                </div>
                <div class="swiperSmall"><!-- 메인 슬라이더 시작 -->
                    <!-- Additional required wrapper -->
                    <div class="swiper-wrapper" id="autoStop">
                        <!-- Slides -->
                        <c:forEach var="newPrd" items="${newProduct}">
                        <div class="swiper-slide">
                            <a href="<%=request.getContextPath()%>/product/view.do?prdIndex=${newPrd.prdIndex}">
                                <div><p class="cnt_img1" style="background-image:url(<%=request.getContextPath() %>/resources/prdmainimg/${newPrd.prdRname})"></p></div>
                                <P class="cnt_brand"><span>
                                <c:set var="newBrandCode" value="${fn:substring(newPrd.prdCode,0,2)}"/>
                                <c:choose>
                                	<c:when test='${newBrandCode eq "NK"}'>나이키</c:when>
                                	<c:when test='${newBrandCode eq "AD"}'>아디다스</c:when>
                                	<c:when test='${newBrandCode eq "VS"}'>반스</c:when>
                                	<c:when test='${newBrandCode eq "CV"}'>컨버스</c:when>
                                	<c:when test='${newBrandCode eq "PM"}'>퓨마</c:when>
                                	<c:when test='${newBrandCode eq "FL"}'>휠라</c:when>
                                	<c:when test='${newBrandCode eq "CR"}'>크록스</c:when>
                                	<c:when test='${newBrandCode eq "NB"}'>뉴발란스</c:when>
                                </c:choose>
                                </span></P>
                                <P class="cnt_name"><span>${newPrd.prdName}</span></P>
                                <P class="cnt_prc"><span><fmt:formatNumber value="${newPrd.prdPrice}" pattern="#,###"/>원</span></P>
                            </a>
                        </div>
                        </c:forEach>
                    </div>
                    <div class="swiper-scrollbar"></div>
                </div><!-- 메인 슬라이더 끝 -->
            </div>
            <!-- NEW 영역 끝-->
            
            
               <div class="main-brand"><!-- BRAND 영역 시작-->
                <div class="main-brand-title">
                    <h2>BRAND</h2>
                </div>
                <div class="main-brand-img d-flex">
                    <a href="#"></a>
                    <a href="#"></a>
                    <a href="#"></a>
                </div>
                <div class="main_brand_int">
                    <span>탁월한 성능과 유니크한 디자인</span>
                    <span>성공적인 러닝을 위한 정답 그 자체</span>
                    <span>70년대 패션과 문화를 담아낸 슈즈</span>
                </div>
            </div><!-- BRAND 영역 끝-->
            
            <div class="main-event d-flex justify-content-between"><!-- Event 영역 시작-->
                    <a href="#"></a>
                    <a href="#"></a>
            </div><!-- Event 영역 끝-->

            <div class="main-brandBest d-flex justify-content-between"><!-- brand-best 영역 시작-->
                <div class="main-brandBest-img"></div>
                <div class="main-brandBest-items">
                    <div class="main-brandBest-items-title">
                        <h3>BEST</h3>
                    </div>
                    <div class="main-brandBest-items-area">
                        <ul id="cnt_list">
                        	<c:set var="rank" value="1"/>
                        	<c:forEach var="bestPrd" items="${bestProduct}">                   
                        	<c:set var="bestBrandCode" value="${fn:substring(bestPrd.prdCode,0,2)}" />
	                            <li class="cnt_info">
	                                <div class="best-rank">
	                                    <span>${rank}</span>
	                                </div>
	                                <c:set var="rank" value="${rank+1}"/>
	                                <a href="<%=request.getContextPath()%>/product/view.do?prdIndex=${bestPrd.prdIndex}">
	                                <div><p class="cnt_img1" style="background-image:url(<%=request.getContextPath() %>/resources/prdmainimg/${bestPrd.prdRname})"></div></p>
	                                    <P class="cnt_brand"><span>
		                                <c:choose>
		                                	<c:when test='${bestBrandCode eq "NK"}'>나이키</c:when>
		                                	<c:when test='${bestBrandCode eq "AD"}'>아디다스</c:when>
		                                	<c:when test='${bestBrandCode eq "VS"}'>반스</c:when>
		                                	<c:when test='${bestBrandCode eq "CV"}'>컨버스</c:when>
		                                	<c:when test='${bestBrandCode eq "PM"}'>퓨마</c:when>
		                                	<c:when test='${bestBrandCode eq "FL"}'>휠라</c:when>
		                                	<c:when test='${bestBrandCode eq "CR"}'>크록스</c:when>
		                                	<c:when test='${bestBrandCode eq "NB"}'>뉴발란스</c:when>
		                                </c:choose>	                                    
	                                    </span></P>
	                                    <P class="cnt_name"><span>${bestPrd.prdName}</span></P>
	                                    <P class="cnt_prc"><span><fmt:formatNumber value="${bestPrd.prdPrice}" pattern="#,###"/>원</span></P>
	                                </a>
	                            </li>
                            </c:forEach>
                        </ul>  
                    </div>
                </div>
            </div><!-- brand-best 영역 끝-->
        </div><!-- 메인 콘텐츠 영역 끝 -->
    </main><!-- 메인 끝 -->

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
    <script src="<%=request.getContextPath()%>/resources/JS/jquery-3.6.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script><!-- swiper JS 연결 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script><!-- 부트스트랩 자바 스크립트연결 -->
    <script src="<%=request.getContextPath()%>/resources/JS/script.js"></script><!-- 자바 스크립트 연결 -->
    <script>
                //메인뷰
                const swiper = new Swiper('.swiper', {
                // Default parameters
                slidesPerView: 1,//한 화면에 나타낼 뷰 숫자
                spaceBetween: 0,//뷰 와 뷰 사이의 간격
                speed : 600,  //슬라이드 전환시간 0.6초
                autoplay : {  //자동으로 슬라이드
                    delay: 5000,  //슬라이드 하나가 보여지는 시간 5초
                    disableOnInteraction:false  //자동재생 재실행
                },
                pagination: {//페이지 네이션 설정
                    el: '.swiper-pagination',
                    type: 'bullets',
                    clickable : "true"//클릭시 페이지 이동 여부 값: true or false
                },
                navigation: {//페이지 버튼 설정
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                }
            });

            //new
            const swiperSmall = new Swiper('.swiperSmall', {
            // Default parameters
                slidesPerView: 4,
                spaceBetween: 10,
                speed:5000,
                loop : true,
                autoplay: {
                    delay: 0,
                    disableOnInteraction: false
                    },
                scrollbar: {
			        el: '.swiper-scrollbar',  //스크롤바를 만들어주는 클래스
			        draggable: true,
		        },
                dragSize : 5,  //드래그 사이즈
		        dragClass : 'swiper-scrollbar-drag',  //드래그를 만들어주는 클래스
		        hide : false,  //스크롤이 사라지지 않게 해줌
            });


            let slider = document.getElementById("autoStop");
            slider.addEventListener("mouseover", function(){
                swiperSmall.autoplay.stop()
                let pos = swiperSmall.getTranslate();
                slider.style.transform = `translate3d(${pos}px, 0px, 0px)`;
                
            });

            slider.addEventListener("mouseout", function(){ 
                swiperSmall.autoplay.start()
                setTimeout(function() {
                    swiperSmall.update();
                    swiperSmall.slideNext();
                }, 1000); // 3초 후에 업데이트
            });
    </script>
</body>
</html>
