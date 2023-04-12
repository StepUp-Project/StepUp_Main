<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage modify check</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
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
            <div class="mypage_menu"><!--마이페이지 메뉴 시작-->
                <div class="mypagehi">
                    <p>안녕하세요, 배유진님!</p>
                </div>
                <div class="mypage_gnb">
                    <span><a href="#">주문배송조회</a></span>
                    <span><a href="#">상품후기</a></span>
                    <span><a href="#">관심목록</a></span>
                    <span><a href="#">QnA</a></span>
                    <span><a href="#">내가 작성한 글</a></span>
                    <span><a href="#">개인정보수정</a></span>
                    <span><a href="#">회원탈퇴</a></span>
                </div>
            </div><!--마이페이지 메뉴 끝-->
            
            <article id="mypage_contain"><!--개인정보수정-비번확인 페이지 시작-->
                <div id="mypage_title">
                    <h2>
                       	 개인정보수정
                    </h2>
                </div>

                <div id="mypage_subtitle">
                    <h3>비밀번호 확인</h3>
                    <p>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인합니다.</p>
                </div>
                <form action="" method="post" class="mpmc">
                    <div class="form-floating mb-3">
                    	<input type="hidden" name="userId" value="${login.userId}">
                        <input type="password" class="form-control" id="userPw" name="userPw" placeholder="userPw">
                        <label for="userPw">비밀번호</label>
                    </div>
                    <div class="mb-3 mt-3" id="mypage_btn">
                        <input type="submit" value="확인">
                    </div>
                </form>
                <p class="modifypre">회원님의 개인정보를 신중히 취급하며, 회원님의 동의 없이는<br/>
                    기재하신 회원정보를 공개 및 변경하지 않습니다.</p>
            </article><!--개인정보수정-비번확인 페이지 끝-->
        </div>
	</main>
</body>
</html>
