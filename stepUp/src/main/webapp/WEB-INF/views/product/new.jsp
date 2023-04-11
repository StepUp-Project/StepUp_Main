<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>registration</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
    
</head>
<body>
    <header id="header"><!--헤더 시작-->
        <div class="d-flex justify-content-between pt-5"><!--d-flex영역시작-->
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
            </div><!--d-flex영역 -->
    </header><!--헤더 끝-->  
    
    <main id="newjsp"><!--메인 시작-->

        <div class="new-banner-area d-flex" id="new-banner">
            <a href="#">
                <div class="newlogo"></div>
            </a>
            <a href="#">
                <div class="newlogo"></div>
            </a>
            <a href="#">
                <div class="newlogo"></div>
            </a>
            <a href="#">
                <div class="newlogo"></div>
            </a>
        </div>

        <article id="brandlist">
            <li class="brandlogo">
                <a href="#"><p class="bl_img" onclick="colorchange()" id="colall"></p></a>
            </li>
            <li class="brandlogo">
                <a href="#"><p class="bl_img" onclick="colorchange()" id="colnk"></p></a>
            </li>
            <li class="brandlogo">
                <a href="#"><p class="bl_img"></p></a>
            </li>
            <li class="brandlogo">
                <a href="#"><p class="bl_img"></p></a>
            </li>
            <li class="brandlogo">
                <a href="#"><p class="bl_img"></p></a>
            </li>
            <li class="brandlogo">
                <a href="#"><p class="bl_img"></p></a>
            </li>
            <li class="brandlogo">
                <a href="#"><p class="bl_img"></p></a>
            </li>
            <li class="brandlogo">
                <a href="#"><p class="bl_img"></p></a>
            </li>
            <li class="brandlogo">
                <a href="#"><p class="bl_img"></p></a>
            </li>
        </article>

        <div class="d-flex justify-content-between">
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
                        <input type="checkbox" name="size" value="210" id="size01">
                        <label for="size01">
                            <span>210</span>
                        </label>
                    </li>
                    <li class="size_box">
                        <input type="checkbox" name="size" value="220" id="size02">
                        <label for="size02">
                            <span>220</span>
                        </label>
                    </li>
                    <li class="size_box">
                        <input type="checkbox" name="size" value="230" id="size03">
                        <label for="size03">
                            <span>230</span>
                        </label>
                    </li>
                    <li class="size_box">
                        <input type="checkbox" name="size" value="240" id="size04">
                        <label for="size04">
                            <span>240</span>
                        </label>
                    </li>
                    <li class="size_box">
                        <input type="checkbox" name="size" value="250" id="size05">
                        <label for="size05">
                            <span>250</span>
                        </label>
                    </li>
                    <li class="size_box">
                        <input type="checkbox" name="size" value="260" id="size06">
                        <label for="size06">
                            <span>260</span>
                        </label>
                    </li>
                    <li class="size_box">
                        <input type="checkbox" name="size" value="270" id="size07">
                        <label for="size07">
                            <span>270</span>
                        </label>
                    </li>
                    <li class="size_box">
                        <input type="checkbox" name="size" value="280" id="size08">
                        <label for="size08">
                            <span>280</span>
                        </label>
                    </li>
                </ul>
                <p class="filter_ttl">가격</p>
                <ul id="prc_check">
                    <li class="prc_box">
                        <input type="checkbox" name="price" value="50000" id="price01">
                        <label for="price01">
                            <span>0 ~ 50,000원</span>
                        </label>
                    </li>
                    <li class="prc_box">
                        <input type="checkbox" name="price" value="100000" id="price02">
                        <label for="price02">
                            <span>50,000 ~ 100,000원</span>
                        </label>
                    </li>
                    <li class="prc_box">
                        <input type="checkbox" name="price" value="150000" id="price03">
                        <label for="price03">
                            <span>100,000 ~ 150,000원</span>
                        </label>
                    </li>
                    <li class="prc_box">
                        <input type="checkbox" name="price" value="200000" id="price04">
                        <label for="price04">
                            <span>150,000 ~ 200,000원</span>
                        </label>
                    </li>
                </ul>
                <p class="filter_ttl">종류</p>
                <ul id="type_check">
                    <li class="type_box">
                        <input type="checkbox" name="type" value="" id="type01">
                        <label for="type01">
                            <span>운동화</span>
                        </label>
                    </li>
                    <li class="type_box">
                        <input type="checkbox" name="type" value="" id="type02">
                        <label for="type02">
                            <span>스니커즈</span>
                        </label>
                    </li>
                    <li class="type_box">
                        <input type="checkbox" name="type" value="" id="type03">
                        <label for="type03">
                            <span>크록스</span>
                        </label>
                    </li>
                    <li class="type_box">
                        <input type="checkbox" name="type" value="" id="4">
                        <label for="type04">
                            <span>샌들</span>
                        </label>
                    </li>
                </ul>
            </article>

            <article id="prd_cnt">
                <div id="prd_sort">
                    <div id="new_title">
                        NEW
                    </div>
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
        </div>
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

    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script><!-- swiper JS 연결 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script><!-- 부트스트랩 자바 스크립트연결 -->
    <script src="../JS/script.js"></script><!-- 자바 스크립트 연결 -->
    <script>
        function colorchange(){
            document.getElementById("colnk").style.background = "url('../image/new/new_logo_nk.png') no-repeat 0 0";
        }

    </script>
</body>
</html>
