<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>       
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>best</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->  	
</head>
<body>
<%@ include file="../include/header.jsp" %>
    <main>
        <div class="best-prd">
            <div class="best-title">
                <h2>BEST</h2>
            </div>
            <div>
                <ul id="cnt_list" style="border: 1px solid red;">
	               	<c:set var="rank" value="1"/>
	               	<c:forEach var="bestPrd" items="${bestProduct}">                   
	               	<c:set var="bestBrandCode" value="${fn:substring(bestPrd.prdCode,0,2)}"/>
	                    <li class="cnt_info" style="border: 1px solid lime;">
	                        <div class="best-rank">
	                            <span style="border: 1px solid blue;">${rank}</span>
	                        </div>
	                        <c:set var="rank" value="${rank+1}"/>
	                        <a href="<%=request.getContextPath()%>/product/view.do?prdIndex=${bestPrd.prdIndex}">
	                        <div><p class="cnt_img1" style="background-image:url(<%=request.getContextPath() %>/resources/prdmainimg/${bestPrd.prdRname})"></div></p>
	                            <P class="cnt_brand"><span>
	                         <c:choose>
	                         	<c:when test='${bestBrandCode eq "NK"}'>나이키</c:when>
	                         	<c:when test='${bestBrandCode eq "AD"}'>아디다스</c:when>
	                         	<c:when test='${bestBrandCode eq "VS"}'>반스</c:when>
	                         	<c:when test='${bestBrandCode eq "CV"}'>컨버스</c:when>
	                         	<c:when test='${bestBrandCode eq "PM"}'>퓨마</c:when>
	                         	<c:when test='${bestBrandCode eq "FL"}'>휠라</c:when>
	                         	<c:when test='${bestBrandCode eq "CR"}'>크록스</c:when>
	                         	<c:when test='${bestBrandCode eq "NB"}'>뉴발란스</c:when>
	                         </c:choose>	                                    
	                            </span></P>
	                            <P class="cnt_name"><span>${bestPrd.prdName}</span></P>
	                            <P class="cnt_prc"><span><fmt:formatNumber value="${bestPrd.prdPrice}" pattern="#,###"/>원</span></P>
	                        </a>
	                    </li>
	                </c:forEach>
                </ul>
            </div>
        </div>
        <div class="best-badage" id="bestright">
            <img src="<%=request.getContextPath()%>/resources/image/best-badage.png" alt="">
        </div>
    </main>
<%@ include file="../include/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script><!-- swiper JS 연결 -->

</body>
</html>
