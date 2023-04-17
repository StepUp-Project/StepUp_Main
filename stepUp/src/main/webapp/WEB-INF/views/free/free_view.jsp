<%@page import="proj.stepUp.vo.ReVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	List<ReVO> rList = (List<ReVO>)request.getAttribute("rList");
%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
</head>

<body>
<%@ include file="../include/header.jsp" %>
    <main><!--메인 시작-->
        <article id="board_viewcontain">
            <ul id="board_view">
                <li id="board_viewTtl"><div>${vo.freeTitle}</div></li>
                <li id="board_winfo">
                    <div>${vo.userNick}</div><span>|</span><div>조회수 : ${vo.freeHit}</div><p>${vo.freeWdate}</p>
                </li>
                <li id="board_wctn">
                   	 ${vo.freeCnt}	
                </li>
            </ul>
            <div>
   	           <input type="button" class="board_btn" value="돌아가기"	 onclick="location.href='free.do'">
   	           <c:if test="${not empty login and login.userIndex eq vo.userIndex}">
					<input type="button" class="board_btn" value="수 정" onclick="if(confirm('수정하시겠습니까?')) {location.href='free_modify.do?freeIndex=${vo.freeIndex}'}">
					<input type="button" class="board_btn" value="삭 제" onclick="if(confirm('정말로 삭제하시겠습니까?')) {document.delfrm.submit();}">
		            <form  name="delfrm" action="free_delete.do" method="post">
		           		<input type="hidden" name="freeIndex" value="${vo.freeIndex}">
		           	</form>
	           </c:if>
            </div>
        </article>
        <article id=""><!--댓글란-->
            <div id="re_write">
                <p id="re_formTtl"><c:if test="${not empty rList}">댓 글  : ${rList.get(0).total}</c:if>  
                <div>
                <c:if test="${not empty login}">
   	                <form name="refrm" action="re_write.do" method="post">
                        <textarea id="re_writeCnt" name="reCnt" placeholder="댓글을 남겨주세요"></textarea>
                        <input name="userIndex" value="${login.userIndex}"	type="hidden">
                        <input name="freeIndex" value="${vo.freeIndex}"		type="hidden">
                        <div id="re_btn">
                            <button>등록</button>
                        </div>
                    </form>
                </c:if>
                </div>
            </div> 
            <ul id="re_ctn">
            <c:if test="${not empty rList}">
	            <c:forEach var="rList" items="${rList}" >
	                <li><!-- 작성된 댓글 보여주는 곳 -->
	                    <div class="re_winfo">
	                        <span class="re_writer">${rList.userNick}</span>
	                        <span class="re_wdate">${rList.reWdate}</span>
	                        <c:if test="${login.userIndex eq rList.userIndex}">
	                        	<form action="re_del.do" method="post" onsubmit="return confirm('삭제하시겠습니까?')">
	                        		<div></div>
   									<input type="hidden" name="reIndex" value="${rList.reIndex}">
   									<input type="hidden" name="freeIndex" value="${rList.freeIndex}">
   									<input class="re_del" type="submit" value="삭제">
		                        </form>
								<input class="re_edit" type="button" value="수정" onclick="openPopup(${rList.reIndex})">
		                        
		                        <div id="popup">
								  <form name="editForm" action="re_edit.do" method="post" onsubmit="return confirm('수정하시겠습니까?')">
								    <p>댓글 수정</p>
								    <textarea id="re_editCnt" name="reCnt">${rList.reCnt}</textarea>
								    <input name="reIndex" value="${rList.reIndex}" type="hidden">
   									<input type="hidden" name="freeIndex" value="${rList.freeIndex}">
								    <input class="re_edit" type="submit" value="수정">
								    <input class="re_edit" type="button" value="취소" onclick="closePopup(${rList.reIndex})">
								  </form>
								</div>
		                        <script>
									function openPopup(reIndex) {
									  // 팝업 열기
									  document.getElementById("popup").style.display = "block";
									
									  // 수정할 댓글 내용 가져오기
									  var reCnt = document.querySelector("li[data-reIndex='" + reIndex + "'] .re_note").innerHTML.trim();
									  document.getElementById("re_editCnt").value = reCnt;
									
									  // 수정할 댓글 인덱스 설정
									  document.editForm.reIndex.value = reIndex;
									}
									
									function closePopup() {
									  // 팝업 닫기
									  document.getElementById("popup").style.display = "none";
									}
							</script>
	                        </c:if>
	                    </div>
	                    <div class="re_note">${rList.reCnt}</div>
	                </li>
	            </c:forEach>
            </c:if>
            </ul>
        </article>
	</main>
<%@ include file="../include/footer.jsp" %>
</body>
</html>