<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div id="aaaa">
        <ul class="p-2 me-4" id="user"><!-- 로그인, 장바구니, 마이페이지 영역 시작-->
            <li>
                <a href="#"><i class="xi-search"></i></a>
            </li>
            <li>
                <a href="#"><i class="xi-user-o"></i></a>
                <div class="sub">
                    <ul><!-- 서브메뉴 -->
                        <li class="blank"><a href="#">주문배송조회</a></li>
                        <li class="blank"><a href="#">관심있는 상품</a></li>
                        <hr/>
                        <li class="blank"><a href="#">상품후기</a></li>
                        <li class="blank"><a href="#">QnA</a></li>
                        <li class="blank"><a href="#">내가 작성한 글</a></li>
                        <hr/>
                        <li class="blank"><a href="#">개인정보수정</a></li>
                        <li><a href="#">로그아웃</a></li>
                    </ul>
                </div><!--//.sub-->
            </li>
            <li>
                <a href="#"><i class="xi-cart-o"></i></a>
            </li>
        </ul><!-- 로그인, 장바구니, 마이페이지 영역 끝-->
    </div>
    
    <header id="header"><!--헤더 시작-->
        <div class="d-flex justify-content-between pt-5">
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
            <ul class="p-2 me-4" id="iop"><!-- 안보이는 로그인, 장바구니, 마이페이지 영역 시작-->
                <li>
                    <a href="#"><i class="xi-search"></i></a>
                </li>
                <li>
                    <a href="#"><i class="xi-user-o"></i></a>
                </li>
                <li>
                    <a href="#"><i class="xi-cart-o"></i></a>
                </li>
            </ul><!-- 안보이는  로그인, 장바구니, 마이페이지 영역 끝-->
    </header><!--헤더 끝-->
   