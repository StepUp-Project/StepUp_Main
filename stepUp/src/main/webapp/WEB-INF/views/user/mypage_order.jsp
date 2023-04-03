<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage order</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->

	<!-- ㅆㅁㄴㅌ 연결-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="/plugin/summernote/summernote-lite.js"></script>
    <script src="/plugin/summernote/summernote-ko-KR.min.js"></script>
    <link rel="stylesheet" href="/plugin/summernote/summernote-lite.css">
</head>
<body>
    <header id="header"><!--헤더 시작-->
        <div class="d-flex justify-content-between pt-5">
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
	</div>
    </header><!--헤더 끝--> 

    <main><!--메인 시작-->
        <div class="mypagemain">
            <div class="mypage_menu">
                <div class="mypagehi">
                    <p>안녕하세요, 배유진님!</p>
                </div>
                <div class="mypage_gnb">
                    <span><a href="#">개인정보수정</a></span>
                    <span><a href="#">주문배송조회</a></span>
                    <span><a href="#">상품후기</a></span>
                    <span><a href="#">상품 Q&A</a></span>
                    <span><a href="#">찜한 상품</a></span>
                    <span><a href="#">내가 작성한 글</a></span>
                </div>
            </div>
            <article id="mypageod_contain">
                <div id="mypage_title">
                    <h2>
                        주문배송조회
                    </h2>
                    <p>
                        <i class="xi-angle-right-min"></i>
                        [주문번호] 및 [주문상품]을 클릭하시면 주문상세 내역 및 상품별 배송상황을 조회하실 수 있으며, 취소/교환/반품 신청도 가능합니다.
                    </p>
                </div>

                <table class="order_board" style="font-family: 'SpoqaHanSansNeo-Regular';">
                    <thead>
                        <tr>
                            <th class="orderNum">주문번호</th>
                            <th class="orderwDate">주문일자</th>
                            <th class="orderproduct">주문상품</th>
                            <th class="totalPrice">총 구매금액</th>
                            <th class="orderstate">주문상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><span>22040212345</span></td>
                            <td><span>2022-04-02</span></td>
                            <td><a href="#"><div>ASICS 조그 100T</div></a></td>
                            <td><span>150,000원</span></td>
                            <td><span>배송완료</span></td>
                        </tr>
                        <tr>
                            <td><span>22040212346</span></td>
                            <td><span>2022-04-02</span></td>
                            <td><a href="#"><div>NIKE 레볼루션6 넥스트 네이처</div></a></td>
                            <td><span>80,000원</span></td>
                            <td><span>반품완료</span></td>
                           
                        </tr>
                        <tr>
                            <td><span>22040212347</span></td>
                            <td><span>2022-04-02</span></td>
                            <td><a href="#"><div>ADIDAS 브레이크넷2.0</div></a></td>
                            <td><span>230,000원</span></td>
                            <td><span>환불완료</span></td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr class="order_page" >
                            <td colspan="5">◀ 1 2 3 4 5 6 7 8 9 ▶</td>
                        </tr>
                    </tfoot>
                </table>

                <div class="orderhelp">
                    <div>HELP</div>
                    <p>
                        <i class="xi-angle-right-min"></i>
                        주문건별 배송상태에 대한 설명입니다. 각 단계에 따라 주문하신 분께 확인메일 및 SMS를 발송해드립니다.
                    </p>
                    <p>
                        <i class="xi-angle-right-min"></i>
                        주문이 정상완료 되지 않으면 내역조회가 되지 않습니다.
                    </p>
                    <p>
                        <i class="xi-angle-right-min"></i>
                        배송조회는 상품이 출고된 날의 익일 오전부터 가능합니다.
                    </p>
                    <p>
                        <i class="xi-angle-right-min"></i>
                        배송 시작일로부터 2일 경과후에도 택배추적이 되지 않을 경우, 고객센터로 연락 부탁드립니다.
                    </p>
                    <p><img src="/image/orderhelp.png"></p>

                </div>
















            </article>
        </div>
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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script><!-- 부트스트랩 자바 스크립트연결 -->
    <script src="../JS/script.js"></script><!-- 자바 스크립트 연결 -->

</body>
</html>
