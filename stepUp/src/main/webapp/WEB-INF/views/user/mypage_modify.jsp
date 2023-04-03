<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage modify</title>
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
            <article id="mypage_contain">
                <div id="mypage_title">
                    <h2>
                        개인정보수정
                    </h2>
                    <p>
                        <i class="xi-angle-right-min"></i>
                        고객님의 주소와 연락처 등 개인정보를 수정하실 수 있습니다.
                    </p>
                </div>
                <form action="" method="post">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="UserName"  name="UserName"  placeholder="이름">
                        <label for="UserName">이름</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="UserNick" name="UserNick" placeholder="닉네임">
                        <label for="UserNick">닉네임</label>
                    </div>
                    <div class="form-floating mb-3" >
                        <input type="password" class="form-control" id="UserPw" name="UserPw" placeholder="UserPw">
                        <label for="UserPw">기존 비밀번호</label>
                    </div>
                    <div class="form-floating mb-3" >
                        <input type="password" class="form-control" id="UserNPw" name="UserNPw" placeholder="UserNPw">
                        <label for="UserNPw">새 비밀번호</label>
                        <div id="eyes">
                            <i class="xi-eye-o" id="i-eyes"></i>
                        </div>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="password" class="form-control" id="UserNPwc" name="UserNPwc"  placeholder="UserNPwc">
                        <label for="UserNPwc">새 비밀번호 확인</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="UserPhone" name="UserPhone" placeholder="연락처">
                        <label for="UserPhone">연락처</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control" id="UserMail" id="UserMail" placeholder="이메일">
                        <label for="UserMail">이메일</label>
                    </div>
                    <div class="form-floating mb-3 mt-3 massagr">
                        <input type="radio" id="UserPhAc"  name="UserPhAc" value="Y"> 연락처 수신동의
                        <input type="radio" id="UserPhAc" class="upa2"  name="UserPhAc" value="N"> 연락처 수신비동의
                    </div>
                    <div class="form-floating mb-3 mt-3 d-flex justify-content-between">
                        <input type="text" class="form-control" id="UserZipCode" placeholder="우편번호"  readonly>
                        <label for="UserZipCode">우편번호</label>
                        <button type="button" onclick="sample6_execDaumPostcode()" class="btn btn-secondary btn-sm">우편번호 찾기</button>
                    </div>
                    <div class="form-floating mb-3 mt-3">
                        <input type="text" class="form-control" id="UserAddr" placeholder="주소" readonly>
                        <label for="UserAddr">주소</label>
                    </div>
                    <div class="form-floating mb-3 mt-3">
                        <input type="text" class="form-control" id="UserAddr_extra" placeholder="참고항목" readonly>
                        <label for="UserAddr_extra">참고항목</label>
                    </div>
                    <div class="form-floating mb-3 mt-3">
                        <input type="text" class="form-control" id="UserAddr_detail" placeholder="상세주소">
                        <label for="UserAddr_detail">상세주소</label>
                    </div>
                    <div class="mb-3 mt-3" id="mypage_btn">
                        <input type="button" value="취소">
                        <input type="submit" value="적용">
                    </div>
                </form>
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
    <script>
        let eyes = document.getElementById("eyes");
        let iEyes = document.getElementById("i-eyes");
        let UserPw = document.getElementById("UserPw");
        eyes.addEventListener("click", function(){
            if(iEyes.classList.contains("xi-eye-o")){
                iEyes.classList.replace("xi-eye-o", "xi-eye-off-o");
                UserPw.setAttribute("type", "text");
            }else{
                iEyes.classList.replace("xi-eye-off-o", "xi-eye-o");
                UserPw.setAttribute("type", "password");
            }
        });

        let pwcEyes = document.getElementById("pwceyes");
        let cEyes = document.getElementById("c-eyes");
        let UserPwc = document.getElementById("UserPwc");
        pwcEyes.addEventListener("click", function(){
            if(cEyes.classList.contains("xi-eye-o")){
                cEyes.classList.replace("xi-eye-o", "xi-eye-off-o");
                UserPwc.setAttribute("type", "text");
            }else{
                cEyes.classList.replace("xi-eye-off-o", "xi-eye-o");
                UserPwc.setAttribute("type", "password");
            }
        });



        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수
    
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
    
                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("UserAddr_extra").value = extraAddr;
                    
                    } else {
                        document.getElementById("UserAddr_extra").value = '';
                    }
    
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('UserZipCode').value = data.zonecode;
                    document.getElementById("UserAddr").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("UserAddr_detail").focus();
                }
            }).open();
        }
    </script>
</body>
</html>