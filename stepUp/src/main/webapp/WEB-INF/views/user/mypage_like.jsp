<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage like</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
</head>
<body>
<%@ include file="../include/header.jsp" %>

    <main><!--메인 시작-->
        <div class="mypagemain">
            <div class="mypage_menu"><!--마이페이지 메뉴 시작-->
                <div class="mypagehi">
                    <p>안녕하세요, 배유진님!</p>
                </div>
                <div class="mypage_gnb">
                    <span><a href="<%=request.getContextPath()%>/user/mypage_order.do">주문배송조회</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_review.do">상품후기</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_like.do">관심목록</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_qna.do">QnA</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_posting.do">내가 작성한 글</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_modify_check.do">개인정보수정</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_withdrawal.do">회원탈퇴</a></span>
                </div>
            </div><!--마이페이지 메뉴 끝-->

            <article id="mypage_contain"><!--관심목록 페이지 시작-->
                <div id="mypage_title">
                    <h2>
                      	  관심목록
                    </h2>
                    <p>
                        <i class="xi-angle-right-min"></i>
                       	 관심있는 상품을 모아볼 수 있습니다.
                    </p>
                </div>

                <div class="mplikecontain">
                    <div class="like-items">
                        <div class="main-brandBest-items-area">
                            <ul id="cnt_list">
                                <li class="cnt_info">
                                    <div class="likeheart">
                                        <span>♥</span>
                                    </div>
                                    <a href="#">
                                    <div><p class="cnt_img1" style="background-image:url(../../image/brand/Brand_cnt03.jpg)"></div></p>
                                        <P class="cnt_brand"><span>NIKE</span></P>
                                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                                        <P class="cnt_prc"><span>49,800원</span></P>
                                    </a>
                                </li>
                                <li class="cnt_info">
                                    <div class="likeheart">
                                        <span>♥</span>
                                    </div>
                                    <a href="#">
                                        <div><p class="cnt_img1" style="background-image:url(../../image/brand/Brand_cnt02.jpg)"></div></p>
                                        <P class="cnt_brand"><span>NIKE</span></P>
                                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                                        <P class="cnt_prc"><span>49,800원</span></P>
                                    </a>
                                </li>
                                <li class="cnt_info">
                                    <div class="likeheart">
                                        <span>♥</span>
                                    </div>
                                    <a href="#">
                                        <div><p class="cnt_img1" style="background-image:url(../../image/brand/Brand_cnt01.jpg)"></div></p>
                                        <P class="cnt_brand"><span>NIKE</span></P>
                                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                                        <P class="cnt_prc"><span>49,800원</span></P>
                                    </a>
                                </li>
                                <li class="cnt_info">
                                    <div class="likeheart">
                                        <span>♥</span>
                                    </div>
                                    <a href="#">
                                        <div><p class="cnt_img1" style="background-image:url(../../image/brand/Brand_cnt02.jpg)"></div></p>
                                        <P class="cnt_brand"><span>NIKE</span></P>
                                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                                        <P class="cnt_prc"><span>49,800원</span></P>
                                    </a>
                                </li>
                                <li class="cnt_info">
                                    <div class="likeheart">
                                        <span>♥</span>
                                    </div>
                                    <a href="#">
                                        <div><p class="cnt_img1" style="background-image:url(../../image/brand/Brand_cnt03.jpg)"></div></p>
                                        <P class="cnt_brand"><span>NIKE</span></P>
                                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                                        <P class="cnt_prc"><span>49,800원</span></P>
                                    </a>
                                </li>
                                <li class="cnt_info">
                                    <div class="likeheart">
                                        <span>♥</span>
                                    </div>
                                    <a href="#">
                                        <div><p class="cnt_img1" style="background-image:url(../../image/brand/Brand_cnt02.jpg)"></div></p>
                                        <P class="cnt_brand"><span>NIKE</span></P>
                                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                                        <P class="cnt_prc"><span>49,800원</span></P>
                                    </a>
                                </li>
                                <li class="cnt_info">
                                    <div class="likeheart">
                                        <span>♥</span>
                                    </div>
                                    <a href="#">
                                        <div><p class="cnt_img1" style="background-image:url(../../image/brand/Brand_cnt01.jpg)"></div></p>
                                        <P class="cnt_brand"><span>NIKE</span></P>
                                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                                        <P class="cnt_prc"><span>49,800원</span></P>
                                    </a>
                                </li>
                                <li class="cnt_info">
                                    <div class="likeheart">
                                        <span>♥</span>
                                    </div>
                                    <a href="#">
                                        <div><p class="cnt_img1" style="background-image:url(../../image/brand/Brand_cnt02.jpg)"></div></p>
                                        <P class="cnt_brand"><span>NIKE</span></P>
                                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                                        <P class="cnt_prc"><span>49,800원</span></P>
                                    </a>
                                </li>
                                <li class="cnt_info">
                                    <div class="likeheart">
                                        <span>♥</span>
                                    </div>
                                    <a href="#">
                                        <div><p class="cnt_img1" style="background-image:url(../../image/brand/Brand_cnt03.jpg)"></div></p>
                                        <P class="cnt_brand"><span>NIKE</span></P>
                                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                                        <P class="cnt_prc"><span>49,800원</span></P>
                                    </a>
                                </li>
                                <li class="cnt_info">
                                    <div class="likeheart">
                                        <span>♥</span>
                                    </div>
                                    <a href="#">
                                        <div><p class="cnt_img1" style="background-image:url(../../image/brand/Brand_cnt02.jpg)"></div></p>
                                        <P class="cnt_brand"><span>NIKE</span></P>
                                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                                        <P class="cnt_prc"><span>49,800원</span></P>
                                    </a>
                                </li>
                                <li class="cnt_info">
                                    <div class="likeheart">
                                        <span>♥</span>
                                    </div>
                                    <a href="#">
                                        <div><p class="cnt_img1" style="background-image:url(../../image/brand/Brand_cnt01.jpg)"></div></p>
                                        <P class="cnt_brand"><span>NIKE</span></P>
                                        <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                                        <P class="cnt_prc"><span>49,800원</span></P>
                                    </a>
                                </li>
                            </ul>  
                        </div>
                    </div>
                </div>

                <article id="mplikepage">
                        	◀ 1 2 3 4 5 6 7 8 9 ▶
                </article>

            </article><!--관심목록 페이지 끝-->
        </div>
	</main>
	<%@ include file="../include/footer.jsp" %>

</body>
</html>
