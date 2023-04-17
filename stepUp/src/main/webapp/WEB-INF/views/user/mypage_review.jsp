<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage review</title>
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
                    <p>안녕하세요, ${login.getUserNick()} 님!</p>
                </div>
                <div class="mypage_gnb">
                    <span><a href="#">주문배송조회</a></span>
                    <span><a href="#">상품후기</a></span>
                    <span><a href="#">관심목록</a></span>
                    <span><a href="#">QnA</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_posting.do">내가 작성한 글</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_modify_check.do">개인정보수정</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_withdrawal.do">회원탈퇴</a></span>
                </div>
            </div><!--마이페이지 메뉴 끝-->
            
            <article id="mypage_contain"><!--상품후기 페이지 시작-->
                <div id="mypage_title">
                    <h2>
                        	상품후기
                    </h2>
                    <p>
                        <i class="xi-angle-right-min"></i>
                       	 구매하신 상품에 대한 유용한 정보를 다른 고객과 공유하는 곳으로 솔직 담백한 상품후기를 올려주세요.
                    </p>
                    <p>
                        <i class="xi-angle-right-min"></i>
                        	배송정보[출고완료]이후부터 작성하실 수 있습니다.
                    </p>
                    <p>
                        <i class="xi-angle-right-min"></i>
                        	취소/반품/교환의 경우 해당상품의 후기 및 적립된 마일리지는 자동삭제 됩니다.
                    </p>
                </div>

                <article><!--구매내역 및 후기작성-->
                    <table class="review_board" style="font-family: 'SpoqaHanSansNeo-Regular';">
                        <thead>
                            <tr>
                                <th class="revinfo" colspan="2">상품정보</th>
                                <th class="revwDate">구매일</th>
                                <th class="revprice">구매금액</th>
                                <th class="revwrite">후기 작성</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                    <td class="cnt_info">
                                        <a href="#">
                                            <div><p class="cnt_img1" style="background-image:url(../../image/brand/Brand_cnt03.jpg)"></p></div>
                                        </a>
                                    </td>
                                    <td class="cnt_info">
                                        <a href="#">
                                            <P class="cnt_brand"><span>NIKE</span></P>
                                            <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                                            <P class="cnt_size"><span>사이즈 250</span></P>
                                        </a>
                                    </td>
                                    <td><span>2022-04-02</span></td>
                                    <td><span>150,000원</span></td>
                                    <td><input class="review_write" type="button" value="작성하기" onclick="showPopupWrite();"></td>
                            </tr>
                            <tr>
                                    <td class="cnt_info">
                                        <a href="#">
                                            <div><p class="cnt_img1" style="background-image:url(../../image/brand/Brand_cnt03.jpg)"></p></div>
                                        </a>
                                    </td>
                                    <td class="cnt_info">
                                        <a href="#">
                                            <P class="cnt_brand"><span>NIKE</span></P>
                                            <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                                            <P class="cnt_size"><span>사이즈 250</span></P>
                                        </a>
                                    </td>
                                    <td><span>2022-04-02</span></td>
                                    <td><span>150,000원</span></td>
                                    <td><input class="review_write" type="button" value="작성하기" onclick="showPopupWrite();"></td>
                            </tr>
                            <tr>
                                    <td class="cnt_info">
                                        <a href="#">
                                            <div><p class="cnt_img1" style="background-image:url(../../image/brand/Brand_cnt03.jpg)"></p></div>
                                        </a>
                                    </td>
                                    <td class="cnt_info">
                                        <a href="#">
                                            <P class="cnt_brand"><span>NIKE</span></P>
                                            <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                                            <P class="cnt_size"><span>사이즈 250</span></P>
                                        </a>
                                    </td>
                                    <td><span>2022-04-02</span></td>
                                    <td><span>150,000원</span></td>
                                    <td>
                                        <input class="review_edit" type="button" value="수정" onclick="showPopupChange();">
                                        <input class="review_del" type="button" value="삭제">
                                    </td>
                            </tr>
                        </tbody>

                        <tfoot>
                            <tr class="order_page" >
                                <td colspan="5">◀ 1 2 3 4 5 6 7 8 9 ▶</td>
                            </tr>
                        </tfoot>
                    </table>
                </article>

            </article>
        </div>
	</main>
	
	<%@ include file="../include/footer.jsp" %>
    <script>
        function showPopupWrite() { window.open("review.jsp", "a", "width=800, height=500, left=200, top=50"); }
        function showPopupChange() { window.open("reviewmodify.jsp", "a", "width=800, height=500, left=200, top=50"); }
    </script>

</body>
</html>