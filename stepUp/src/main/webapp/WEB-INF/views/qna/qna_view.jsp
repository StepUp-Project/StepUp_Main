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
                <li id="board_viewTtl"><div>${vo.qnaTitle}</div></li>
                <li id="board_winfo">
                    <div>${vo.userNick}</div><span>|</span><div>답변여부 : ${vo.qnaRsp}</div><p>${vo.qnaWdate}</p>
                </li>
                <li id="board_wctn">
                   	 ${vo.qnaCnt}	
                </li>
            </ul>
            <div>
   	           <input type="button" class="board_btn" value="돌아가기"	 onclick="location.href='qna.do'">
   	           <c:if test="${not empty login and login.userIndex eq vo.userIndex}">
					<input type="button" class="board_btn" value="수 정" onclick="if(confirm('수정하시겠습니까?')) {location.href='qna_modify.do?qnaIndex=${vo.qnaIndex}'}">
					<input type="button" class="board_btn" value="삭 제" onclick="if(confirm('정말로 삭제하시겠습니까?')) {document.delfrm.submit();}">
		            <form  name="delfrm" action="qna_delete.do" method="post">
		           		<input type="hidden" name="qnaIndex" value="${vo.qnaIndex}">
		           	</form>
	           </c:if>
	           <c:if test="${not empty login}">
					<c:if test="${login.userGrade eq 'A' and vo.qnaRsp eq 'N'}">
						<form action="qna_rsp.do" method="post" onsubmit="return confirm('답변을 완료하시겠습니까?');">
							<input type="hidden" name="qnaIndex" value="${vo.qnaIndex}">
							<input type="hidden" name="qnaRsp" value="Y">
							<input class="board_btn" type="submit" value="답변완료">
						</form>
					</c:if>
					<c:if test="${login.userGrade eq 'A' and vo.qnaRsp eq 'Y'}">
						<form action="qna_rsp.do" method="post" onsubmit="return confirm('답변을 취소하시겠습니까?');">
							<input type="hidden" name="qnaIndex" value="${vo.qnaIndex}">
							<input type="hidden" name="qnaRsp" value="N">
							<input class="board_btn" type="submit" value="답변취소">
						</form>
					</c:if>
           		</c:if>
            </div>
        </article>
        <article id=""><!--댓글란-->
            <div id="re_write">
                <p id="re_formTtl"><c:if test="${not empty rList}">댓 글  : ${rList.get(0).total}</c:if>  
                <div>
                <c:if test="${not empty login}">
                	<c:if test="${login.userIndex eq vo.userIndex or login.userGrade eq 'A'}">
	   	                <form name="refrm" action="qnare_write.do" method="post">
	                        <textarea id="re_writeCnt" name="qnareCnt" placeholder="댓글을 남겨주세요"></textarea>
	                        <input name="userIndex" value="${login.userIndex}"	type="hidden">
	                        <input name="qnaIndex" value="${vo.qnaIndex}"		type="hidden">
	                        <div id="re_btn">
	                            <button>등록</button>
	                        </div>
	                    </form>
                    </c:if>
                </c:if>
                </div>
            </div> 
            <br/>

            <br/>
            <ul id="re_ctn">
            <c:if test="${not empty rList}">
	            <c:forEach var="rList" items="${rList}" >
	                <li><!-- 작성된 댓글 보여주는 곳 -->
	                    <div class="re_winfo">
	                        <span class="re_writer">${rList.userNick}</span>
	                        <span class="re_wdate">${rList.reWdate}</span>
	                        <c:if test="${login.userIndex eq rList.userIndex}">
	                        	<form action="qnare_del.do" method="post" onsubmit="return confirm('삭제하시겠습니까?')">
	                        		<div></div>
   									<input type="hidden" name="qnareIndex" value="${rList.qnareIndex}">
   									<input type="hidden" name="qnaIndex" value="${rList.qnaIndex}">
   									<input class="qnare_del" type="submit" value="삭제">
		                        </form>
								<input class="re_edit" type="button" value="수정" onclick="openPopup(${rList.qnareIndex})">
		                        
		                        <div id="popup">
								  <form name="editForm" action="qnare_edit.do" method="post" onsubmit="return confirm('수정하시겠습니까?')">
								    <p>댓글 수정</p>
								    <textarea id="qnare_editCnt" name="qnareCnt">${rList.qnareCnt}</textarea>
								    <input name="qnareIndex" value="${rList.qnareIndex}" type="hidden">
   									<input type="hidden" name="qnaIndex" value="${rList.qnaIndex}">
								    <input class="qnare_edit" type="submit" value="수정">
								    <input class="qnare_edit" type="button" value="취소" onclick="closePopup(${rList.qnareIndex})">
								  </form>
								</div>
		                        <script>
									function openPopup(qnareIndex) {
									  // 팝업 열기
									  document.getElementById("popup").style.display = "block";
									
									  // 수정할 댓글 내용 가져오기
									  var qnareCnt = document.querySelector("li[data-qnareIndex='" + qnareIndex + "'] .qnare_note").innerHTML.trim();
									  document.getElementById("qnare_editCnt").value = qnareCnt;
									
									  // 수정할 댓글 인덱스 설정
									  document.editForm.reIndex.value = qnareIndex;
									}
									
									function closePopup() {
									  // 팝업 닫기
									  document.getElementById("popup").style.display = "none";
									}
							</script>
	                        </c:if>
	                    </div>
	                    <div class="qnare_note">${rList.qnareCnt}</div>
	                </li>
	            </c:forEach>
            </c:if>
            </ul>
        </article>
	</main>
<%@ include file="../include/footer.jsp" %>
</body>
</html>