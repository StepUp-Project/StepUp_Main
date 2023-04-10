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
    <title>brand</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
    <style type="text/css">
.price-range-slider {
            width: 100%;
            border: 0;
            padding: 0;
            margin: 0 auto;
            padding: 11px 20px;
        }

        .price-wrap {
            display: flex;
            padding: 1em 0;
            justify-content: space-between;
            font-size: 0.9em;
            color: #BCBCBC;
        }

        .price-range-slider .price-field {
            position: relative;
            width: 100%;
            height: auto;
            box-sizing: border-box;
        }

        .price-range-slider .price-field input[type=range] {
            position: absolute;
        }

        /* Reset style for input range */

        .price-range-slider .price-field input[type=range] {
            width: 100%;
            height: 7px;
            outline: 0;
            box-sizing: border-box;
            pointer-events: none;
            -webkit-appearance: none;
        }

        .price-range-slider .price-field input[type=range]::-webkit-slider-thumb {
            -webkit-appearance: none;
        }

        .price-range-slider .price-field input[type=range]:active,
        .price-range-slider .price-field input[type=range]:focus {
            outline: 0;
        }

        .price-range-slider .price-field input[type=range]::-ms-track {
            width: 100%;
            border: 0;
            outline: 0;
            box-sizing: border-box;
            border-radius: 5px;
            pointer-events: none;
            background: transparent;
            border-color: transparent;
        }

        /* Style toddler input range */

        .price-range-slider .price-field input[type=range]::-webkit-slider-thumb {
            /* WebKit/Blink */
            position: relative;
            -webkit-appearance: none;
            margin: 0;
            border: 0;
            outline: 0;
            border-radius: 50%;
            height: 25px;
            width: 25px;
            margin-top: -10px;
            background-color: #fff;
            cursor: pointer;
            cursor: pointer;
            pointer-events: all;
            z-index: 100;
            border: 1px solid #95989A;
        }

        .price-range-slider .price-field input[type=range]::-moz-range-thumb {
            /* Firefox */
            position: relative;
            appearance: none;
            margin: 0;
            border: 0;
            outline: 0;
            border-radius: 50%;
            height: 25px;
            width: 25px;
            margin-top: -10px;
            background-color: #fff;
            cursor: pointer;
            cursor: pointer;
            pointer-events: all;
            z-index: 100;
            border: 1px solid #95989A;
        }

        .price-range-slider .price-field input[type=range]::-ms-thumb {
            /* IE */
            position: relative;
            appearance: none;
            margin: 0;
            border: 0;
            outline: 0;
            border-radius: 50%;
            height: 25px;
            width: 25px;
            margin-top: -10px;
            background-color: #242424;
            cursor: pointer;
            cursor: pointer;
            pointer-events: all;
            z-index: 100;
            border: 1px solid #95989A;
        }

        /* Style track input range */
        .price-range-slider .price-field input[type=range]::-webkit-slider-runnable-track {
            /* WebKit/Blink */
            width: 100%;
            height: 5px;
            cursor: pointer;
            background: #2D2E2F;
            border-radius: 100px;
        }

        .price-range-slider .price-field input[type=range]::-moz-range-track {
            /* Firefox */
            width: 100%;
            height: 15px;
            cursor: pointer;
            background: #242424;
            border-radius: 100px;
        }

        .price-range-slider .price-field input[type=range]::-ms-track {
            /* IE */
            width: 100%;
            height: 15px;
            cursor: pointer;
            background: #242424;
            border-radius: 100px;
        }

        /* Style for input value block */
        .price-range-slider .price-wrap .price-min,
        .price-range-slider .price-wrap .price-max {
            pointer-events: none;
        }

        .price-range-slider .price-wrap #price-min,
        .price-range-slider .price-wrap #price-max {
            margin: 0;
            padding: 0;
            background: 0;
            border: 0;
            outline: 0;
            color: #BCBCBC;
            font-family: 'Arboria';
            font-size: 1em;
            width: 100%;
            pointer-events: none;
            text-align: center;
            width: 30%;
        }

        /* Style for active state input */

        .price-range-slider .price-field input[type=range]:hover::-webkit-slider-thumb {
            box-shadow: 0 0 0 0.5px #242424;
            transition-duration: 0.3s;
        }

        .price-range-slider .price-field input[type=range]:active::-webkit-slider-thumb {
            box-shadow: 0 0 0 0.5px #242424;
            transition-duration: 0.3s;
        }
    </style>
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
    <main class="d-flex justify-content-between "><!--메인 시작-->
        <article id="prd_filter">
            <div id="prd_addr">
                <a href="#">HOME</a>
                <span> > </span>
                <a href="#">BRAND</a>
                <span> > </span>
                <a href="#">NIKE</a>
            </div>
            <p class="filter_ttl">사이즈</p>
            <ul  id="size_check">
                <li class="size_box">
                    <input type="checkbox" name="sizeKind" value="210" id="size01">
                    <label for="size01">
                        <span>210</span>
                    </label>
                </li>
                <li class="size_box">
                    <input type="checkbox" name="sizeKind" value="220" id="size02">
                    <label for="size02">
                        <span>220</span>
                    </label>
                </li>
                <li class="size_box">
                    <input type="checkbox" name="sizeKind" value="230" id="size03">
                    <label for="size03">
                        <span>230</span>
                    </label>
                </li>
                <li class="size_box">
                    <input type="checkbox" name="sizeKind" value="240" id="size04">
                    <label for="size04">
                        <span>240</span>
                    </label>
                </li>
                <li class="size_box">
                    <input type="checkbox" name="sizeKind" value="250" id="size05">
                    <label for="size05">
                        <span>250</span>
                    </label>
                </li>
                <li class="size_box">
                    <input type="checkbox" name="sizeKind" value="260" id="size06">
                    <label for="size06">
                        <span>260</span>
                    </label>
                </li>
                <li class="size_box">
                    <input type="checkbox" name="sizeKind" value="270" id="size07">
                    <label for="size07">
                        <span>270</span>
                    </label>
                </li>
                <li class="size_box">
                    <input type="checkbox" name="sizeKind" value="280" id="size08">
                    <label for="size08">
                        <span>280</span>
                    </label>
                </li>
            </ul>
            <p class="filter_ttl">가격</p>
            <div id="prc_check">
				<fieldset class="price-range-slider">
					<div class="price-field">
						<input type="range" min="0" max="178000" value="0" id="lower">
						<input type="range" min="0" max="178000" value="178000" id="upper">
					</div>
					<div class="price-wrap align-items-baseline justify-content-end">
						<input disabled type="number" id="price-min" name="priceMin">
						<span>~</span>
						<input disabled type="number" id="price-max" name="priceMax">
						<span>원</span>
					</div>								
				</fieldset>			
            </div>
            <p class="filter_ttl">종류</p>
            <ul id="type_check">
                <li class="type_box">
                    <input type="checkbox" name="prdType" value="01" id="type01">
                    <label for="type01">
                        <span>운동화</span>
                    </label>
                </li>
                <li class="type_box">
                    <input type="checkbox" name="prdType" value="02" id="type02">
                    <label for="type02">
                        <span>스니커즈</span>
                    </label>
                </li>
                <li class="type_box">
                    <input type="checkbox" name="prdType" value="03" id="type03">
                    <label for="type03">
                        <span>크록스</span>
                    </label>
                </li>
                <li class="type_box">
                    <input type="checkbox" name="prdType" value="04" id="4">
                    <label for="type04">
                        <span>샌들</span>
                    </label>
                </li>
            </ul>
            <button type="button" onclick="search()">검색</button>
        </article>
        <article id="prd_cnt">
            <div id="brand_main"></div>
            <div id="prd_sort">
                <a href="#">최신순</a>
                <span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
                <a href="#">판매순</a> 
                <span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
                <a href="#">가격순</a>  
            </div>

            <ul id="cnt_list">
                <li class="cnt_info">
                    <a href="#">
                        <div><p class="cnt_img1" style="background-image:url(../image/brand/Brand_cnt03.jpg)"></div></p>
                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                        <P class="cnt_prc"><span>49,800원</span></P>
                    </a>
                </li>
                <li class="cnt_info">
                    <a href="#">
                        <div><p class="cnt_img1" style="background-image:url(../image/brand/Brand_cnt02.jpg)"></div></p>
                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                        <P class="cnt_prc"><span>49,800원</span></P>
                    </a>
                </li>
                <li class="cnt_info">
                    <a href="#">
                        <div><p class="cnt_img1" style="background-image:url(../image/brand/Brand_cnt01.jpg)"></div></p>
                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                        <P class="cnt_prc"><span>49,800원</span></P>
                    </a>
                </li>
                <li class="cnt_info">
                    <a href="#">
                        <div><p class="cnt_img1" style="background-image:url(../image/brand/Brand_cnt02.jpg)"></div></p>
                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                        <P class="cnt_prc"><span>49,800원</span></P>
                    </a>
                </li>
                <li class="cnt_info">
                    <a href="#">
                        <div><p class="cnt_img1" style="background-image:url(../image/brand/Brand_cnt03.jpg)"></div></p>
                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                        <P class="cnt_prc"><span>49,800원</span></P>
                    </a>
                </li>
                <li class="cnt_info">
                    <a href="#">
                        <div><p class="cnt_img1" style="background-image:url(../image/brand/Brand_cnt02.jpg)"></div></p>
                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                        <P class="cnt_prc"><span>49,800원</span></P>
                    </a>
                </li>
                <li class="cnt_info">
                    <a href="#">
                        <div><p class="cnt_img1" style="background-image:url(../image/brand/Brand_cnt01.jpg)"></div></p>
                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                        <P class="cnt_prc"><span>49,800원</span></P>
                    </a>
                </li>
                <li class="cnt_info">
                    <a href="#">
                        <div><p class="cnt_img1" style="background-image:url(../image/brand/Brand_cnt02.jpg)"></div></p>
                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                        <P class="cnt_prc"><span>49,800원</span></P>
                    </a>
                </li>
                <li class="cnt_info">
                    <a href="#">
                        <div><p class="cnt_img1" style="background-image:url(../image/brand/Brand_cnt03.jpg)"></div></p>
                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                        <P class="cnt_prc"><span>49,800원</span></P>
                    </a>
                </li>
                <li class="cnt_info">
                    <a href="#">
                        <div><p class="cnt_img1" style="background-image:url(../image/brand/Brand_cnt02.jpg)"></div></p>
                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                        <P class="cnt_prc"><span>49,800원</span></P>
                    </a>
                </li>
                <li class="cnt_info">
                    <a href="#">
                        <div><p class="cnt_img1" style="background-image:url(../image/brand/Brand_cnt01.jpg)"></div></p>
                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                        <P class="cnt_prc"><span>49,800원</span></P>
                    </a>
                </li>
                <li class="cnt_info">
                    <a href="#">
                        <div><p class="cnt_img1" style="background-image:url(../image/brand/Brand_cnt02.jpg)"></div></p>
                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                        <P class="cnt_prc"><span>49,800원</span></P>
                    </a>
                </li>
                <li class="cnt_info">
                    <a href="#">
                        <div><p class="cnt_img1" style="background-image:url(../image/brand/Brand_cnt03.jpg)"></div></p>
                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                        <P class="cnt_prc"><span>49,800원</span></P>
                    </a>
                </li>
                <li class="cnt_info">
                    <a href="#">
                        <div><p class="cnt_img1" style="background-image:url(../image/brand/Brand_cnt02.jpg)"></div></p>
                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                        <P class="cnt_prc"><span>49,800원</span></P>
                    </a>
                </li>
                <li class="cnt_info">
                    <a href="#">
                        <div><p class="cnt_img1" style="background-image:url(../image/brand/Brand_cnt01.jpg)"></div></p>
                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                        <P class="cnt_prc"><span>49,800원</span></P>
                    </a>
                </li>
                
            </ul>

        </article>
    </main><!--메인 끝-->

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
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script><!-- 부트스트랩 자바 스크립트연결 -->
    <script src="<%=request.getContextPath()%>/resources/JS/script.js"></script><!-- 자바 스크립트 연결 -->
    <script type="text/javascript">
	    var lowerSlider = document.querySelector('#lower');
	    var upperSlider = document.querySelector('#upper');
	
	    document.querySelector('#price-max').value = upperSlider.value;
	    document.querySelector('#price-min').value = lowerSlider.value;
	
	    var lowerVal = parseInt(lowerSlider.value);
	    var upperVal = parseInt(upperSlider.value);
	
	    upperSlider.oninput = function () {
	        lowerVal = parseInt(lowerSlider.value);
	        upperVal = parseInt(upperSlider.value);
	
	        if (upperVal < lowerVal + 4) {
	            lowerSlider.value = upperVal - 4;
	            if (lowerVal == lowerSlider.min) {
	                upperSlider.value = 4;
	            }
	        }
	        document.querySelector('#price-max').value = this.value
	    };
	
	    lowerSlider.oninput = function () {
	        lowerVal = parseInt(lowerSlider.value);
	        upperVal = parseInt(upperSlider.value);
	        if (lowerVal > upperVal - 4) {
	            upperSlider.value = lowerVal + 4;
	            if (upperVal == upperSlider.max) {
	                lowerSlider.value = parseInt(upperSlider.max) - 4;
	            }
	        }
	        document.querySelector('#price-min').value = this.value
	    };
	    
	    function search(){//검색 필터 ajax호출 함수
	    	let searchType = '<c:out value="${searchVO.searchType}"/>';
	    	let sizeKind = [];
	    	let prdType = [];
	    	let priceMin = $("#price-min").val();
	    	let priceMax = $("#price-max").val();	    	
	    	$('input[name=sizeKind]:checked').each(function() {
	    		sizeKind.push($(this).val());
	    	});
	    	$('input[name=prdType]:checked').each(function() {
	    		prdType.push($(this).val());
	    	});
	    	$.ajax({
	    		url:"<%=request.getContextPath()%>/ajax/search.do",
	    		type:"get",
	    		traditional : true,
	    		data:{
	    			sizeKind : sizeKind,
	    			searchType : searchType,
	    			prdType : prdType,
	    			priceMin : priceMin,
	    			priceMax : priceMax
	    			},
	    		success:function(data){
	    			console.log(data);
	    		}
	    	});
	    }
	    
	    function prdList(){
	    	
	    }
    </script>
</body>
</html>
