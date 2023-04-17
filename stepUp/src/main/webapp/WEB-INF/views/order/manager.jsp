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
    <style>

        .magSearch .btns{
            height: 100%;
            width: 100%;
        }
        .al-c{
            text-align: center;
        }
    </style>
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

            <article id="mypageod_contain"><!--주문배송조회 페이지 시작-->
                <div id="mypage_title">
                    <h2>
                       	주문관리
                    </h2>
                </div>
                <div class="row gx-3 gy-2 align-items-center">
                    <div class="d-flex mb-3 magSearch">
                        <div class="d-flex">
                            <div >
                                <label class="visually-hidden" for="specificSizeSelect">Preference</label>
                                <select class="form-select" id="searchType" name="searchType">
                                    <option value="code">상품코드</option>
                                    <option value="name">상품명</option>
                                </select>
                            </div>
                            <div >
                                <label class="visually-hidden" for="specificSizeInputName">Name</label>
                                <input type="text" class="form-control" id="searchValue" name="searchValue" placeholder="검색창">
                            </div>
                            <div>
                                <button type="button" class="btns mx-2" onclick="searchPrdList(1)">검색</button>
                            </div>
                        </div>
                    </div>
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
                    <tbody id="orderList">

                    </tbody>
                </table>
				<div id="order_paging" class="mt-3"></div>
                <div class="orderhelp"><!--도움말?-->
            </article><!--주문배송조회 페이지 끝-->
        </div>
	</main>

	<%@ include file="../include/footer.jsp" %>
	
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script><!-- 부트스트랩 자바 스크립트연결 -->
    <script src="<%=request.getContextPath()%>/resources/JS/script.js"></script><!-- 자바 스크립트 연결 -->
    <script type="text/javascript">
    	function orderList(nowPage){
    		console.log("ajax 진입");
    		$.ajax({
    			url:"<%=request.getContextPath()%>/ajax/orderList.do",
    			type:"get",
    			data:{
    				nowPage : nowPage
    			},
    			success:function(data){
    				let orderHtml='';
	    			for(let i=0; i < data.length; i++){
	    				let orderList = data[i];
	    				let totalPrice = new Intl.NumberFormat('ko-kr').format(orderList.orderTotalPrice);
	    				orderHtml += '<tr>';
	    				orderHtml += '<td><span>'+orderList.orderNum+'</span></td>';
	    				orderHtml += '<td><span>'+orderList.orderDate+'</span></td>';
	    				orderHtml += '<td><a href="javascript:void(0);" onclick="orderInfo('+orderList.orderIndex+')"><div>'+orderList.orderName+'</div></a></td>';
	    				orderHtml += '<td><span>'+totalPrice+'원</span></td>';
	    				if(orderList.orderStatus == "Y"){
	    					orderHtml += '<td><span>발송완료</span></td>';
	    				}else{
	    					orderHtml += '<td><span>미발송</span></td>';
	    				}
	    				
	    				orderHtml += '</tr>';	    					    				    					    				
	    			}
	    			paging(nowPage);
	    			$("#orderList").html(orderHtml);
    			}
    		})
    	}
	    function paging(nowPage){//페이징 버튼 ajax 처리 함수
	    	let pagingHtml = '';
	    	$.ajax({
	    		url:"<%=request.getContextPath()%>/ajax/orderListPaging.do",
	    		type:"get",
	    		traditional : true,
	    		data:{
	    			nowPage : nowPage,
	    			},
	    		success: function(data) {
				let startPage = Number(data.startPage);
				let endPage = Number(data.endPage);
				let perPage = Number(data.perPage);
				let total = Number(data.total);
				let now = Number(data.nowPage);
				let lastPage = Number(data.lastPage);
		    	pagingHtml += '<li class="d-flex justify-content-center">';
		    	pagingHtml += '<a href="javascript:void(0);" class="xi-angle-left"  onclick="orderList('+(now - 1)+')" style= "display:'+(now != 1 ? 'block' : 'none')+'"></a>';
		    	pagingHtml += '<div id="pagingNumBtn">';
		    	for(let i = startPage; i <= endPage; i ++){
		    		if(now != i){
		    			pagingHtml += '<a href="javascript:void(0);" class="pe-1" onclick="orderList('+i+')">'+i+'</a>';
		    		}else{
		    			pagingHtml += '<span class="pe-1 text-primary">'+i+'</span>';
		    		}
		    	}
		    	pagingHtml += '</div> ';
		    	pagingHtml += '<a href="javascript:void(0);" class="xi-angle-right" onclick="orderList('+(now+ 1)+')" style= "display:'+(now != lastPage && lastPage != 0 ? 'block' : 'none')+'"></a>';
		    	pagingHtml += '</li>';
		    	$("#order_paging").html(pagingHtml);
 	    		}
	    	});
	    }
	    
	    function orderInfo(orderindex){
	    	window.open("<%=request.getContextPath()%>/order/managerInfo.do?orderindex="+orderindex+"", "상품재고", "width=900,height=1000%, top=50, left=600");
	    	console.log(orderindex);
	    }
	    
	 	//페이지 로드시 호출
	    $(document).ready(function(){
	    	orderList(1);
	    });
    </script>
</body>
</html>
