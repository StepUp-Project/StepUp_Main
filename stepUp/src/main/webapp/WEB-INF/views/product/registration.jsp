<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    
    <!-- ㅆㅁㄴㅌ 연결-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/plugin/summernote/summernote-lite.js"></script>
    <script src="<%=request.getContextPath()%>/resources/plugin/summernote/summernote-ko-KR.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugin/summernote/summernote-lite.css">

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
    <main class="prd-registration">
        <article id="board_write">
            <div id="board_ttl">브랜드별 상품등록</div>
            <form name="frm" action="registration.do" method="post" onsubmit="return check()" enctype="multipart/form-data">
                <div class="prd-Kategorie-area">
                    <div class="prdCode-title">
                        <h2>상품코드</h2>
                    </div>
                    <input type="hidden" name="prdCode" value="">
                    <div class="d-flex">
                        <div class="w-25 me-4">
                            <label for="brand" class="form-label">브랜드</label>
                            <select name="brandCode" class="form-select" id="brandCode">
                                <option value="NK">나이키</option>
                                <option value="NB">뉴발</option>
                                <option value="VS">반스</option>
                                <option value="AD">아디다스</option>
                                <option value="CV">컨버스</option>
                                <option value="CR">크록스</option>
                                <option value="PM">푸마</option>
                                <option value="FL">휠라</option>
                            </select>
                        </div>   
                        <div class="w-25 me-4">
                            <label for="type" class="form-label">종류</label>
                            <select name="typeCode" class="form-select" id="typeCode">
                                <option value="01">운동화</option>
                                <option value="02">스포츠화</option>
                                <option value="03">크록스</option>
                                <option value="04">슬리퍼</option>
                                <option value="05">샌들</option>
                             </select>
                        </div>  
                        <div class="w-25">
                            <label for="code" class="form-label">코드</label>
                            <input type="text" name="inputCode" class="form-control" id="inputCode" value=""/>
                        </div>
                    </div>
                </div>
                <div class="mt-4">
                    <label for="prdName" class="form-label">상품명</label>
                    <input type="text" name="prdName" class="form-control" id="prdName"/>
                </div>
                <div class="mt-4">
                    <label for="prdPrice" class="form-label">상품가격</label>
                    <input type="number" name="prdPrice" class="form-control" id="prdPrice" value="0"/>
                </div>
                <div class="mt-4">
                    <label for="prdMadeIn" class="form-label">상품 제조국</label>
                    <input type="text" name="prdMadeIn" class="form-control" id="prdMadeIn"/>
                </div>
                <div class="mt-4">
                    <label for="prdMt" class="form-label">상품 소재</label>
                    <input type="text" name="prdMt" class="form-control" id="prdMt"/>
                </div>
                                <div class="mt-4">
                    <label for="prdQc" class="form-label">품질 보증기준</label>
                    <input type="text" name="prdQc" class="form-control" id="prdQc"/>
                </div>
                <div class="mt-4">
                    <label for="prdCare" class="form-label">소재관리 방법</label>
                    <input type="text" name="prdCare" class="form-control" id="prdCare"/>
                </div>
                <div class="mt-4">
                    <label for="prdMadeDate" class="form-label">제조일</label>
                    <input type="text" name="prdMadeDate" class="form-control" id="prdMadeDate"/>
                </div>
                <div class="d-flex">
                    <div class="file-area">
                        <div class="mt-4 mainImg">
                            <h2>메인 이미지</h2>
                            <div class="file-input-container d-flex">
                                <input type="file" class="sm-input-file" name="mainFile" id="MainImg"/>
                                <label class="for-sm-input-file" for="MainImg">이미지 등록</label>
                                <div class="span-text" id="file-name"></div>
                            </div>
                        </div>
                        <div class="mt-2 subImg">
                            <h2>서브 이미지</h2>
                            <div class="file-input-container d-flex">
                                <input type="file" class="sm-input-file" name="subFile" id="subImg1"/>
                                <label class="for-sm-input-file" for="subImg1">이미지 등록</label>
                                <div class="span-text" id="file-name1"></div>
                            </div>
                            <div class="file-input-container d-flex pt-0">
                                <input type="file" class="sm-input-file" name="subFile" id="subImg2"/>
                                <label class="for-sm-input-file" for="subImg2">이미지 등록</label>
                                <div class="span-text" id="file-name2"></div>
                            </div>
                        </div>
                    </div>
                    <div class="file-info-area">
                        <span>&nbsp;&nbsp;&nbsp;이미지 등록시 주의 사항입니다.</span>
                        <br/>
                        <span>1. 이미지 크기는 ?x?로 맞춰 주세요.</span>
                        <br/>
                        <span>2. 이미지 확장자는 .???파일만 사용가능합니다.</span>
                        <br/>
                        <span>3. 메인 이미지는 상품 리스트 출력시 노출되는 사진입니다.</span>
                    </div>
                </div>
                <div>
                <button type="button" class="btn btn-outline-secondary" onclick="add()">재고 추가</button>
                <button type="button" class="btn btn-outline-secondary" onclick="removeer()">재고 삭제</button>
                	<ul id="sizeWrap">
                		<li class="d-flex mt-4">
                			<div class="w-25 me-5">
                				<label for="sizeKind" class="form-label">상품 사이즈</label>
	                            <select name="sizeKind" class="form-select" id="sizeKind">
	                                <option value="210">210</option>
	                                <option value="220">220</option>
	                                <option value="230">230</option>
	                                <option value="240">240</option>
	                                <option value="250">250</option>
	                                <option value="260">260</option>
	                                <option value="270">270</option>
	                                <option value="280">280</option>
	                            </select>
                			</div>
			                <div class="w-25">
			                    <label for="sizeStock" class="form-label">제고 수량</label>
			                    <input type="number" name="sizeStock" class="form-control" id="sizeStock"/>
			                </div>
                		</li>
                	</ul>
                </div>
                <div class="detail-info">
                    <h2>상품 상세 정보</h2>
                    <textarea id="summernote" name="prdCnt"></textarea>
                </div>
                <div id="board_button">
                    <input type="submit" class="btn btn-outline-secondary" value="저 장">
                    <input type="button" class="btn btn-outline-secondary" value="돌아가기">
                </div>
            </form>
        </article> 
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script><!-- 부트스트랩 자바 스크립트연결 -->
    <script src="<%=request.getContextPath()%>/resources/JS/script.js"></script><!-- 자바 스크립트 연결 -->
    <script>
        $(document).ready(function() {
        //여기 아래 부분
        $('#summernote').summernote({
              height: 450,                 // 에디터 높이
              minHeight: null,             // 최소 높이
              maxHeight: null,             // 최대 높이
              focus: true,                 // 에디터 로딩후 포커스를 맞출지 여부
              lang: "ko-KR",			   // 한글 설정 
        	});
        });
        
       
        function check(){//코드 조합
        	let brandCode = $("#brandCode").val();
        	let crdCode =  $("#typeCode").val();
        	let inputCode = $('#inputCode').val();
        	let prdCode = brandCode+crdCode+inputCode;
        	$('input[name=prdCode]').attr('value',prdCode);

        	return true
        }
        
        $('#MainImg').on('change',function(event){
            var name = event.target.files[0].name;
            $('#file-name').text(name);
            });
        $('#subImg1').on('change',function(event){
            var name = event.target.files[0].name;
            $('#file-name1').text(name);
            });
        $('#subImg2').on('change',function(event){
            var name = event.target.files[0].name;
            $('#file-name2').text(name);
            });
        
        let size = '';
        size += '<li class="d-flex mt-2 size">';
        size += '<div class="w-25 me-5">';
		size += '<select name="sizeKind" class="form-select" id="sizeKind">'
		size += '<option value="210">210</option>';
        size += '<option value="220">220</option>';  
        size += '<option value="230">230</option>';  
        size += '<option value="240">240</option>';  
        size += '<option value="250">250</option>';  
        size += '<option value="260">260</option>';  
        size += '<option value="270">270</option>';  
        size += '<option value="280">280</option>';  
        size += '</select>';  
        size += '</div>';  
        size += '<div class="w-25">';
        size += '<input type="number" name="sizeStock" class="form-control" id="sizeStock"/>';  
        size += '</div>';  
        size += '</li>';  
                

        function add(){
        	$("#sizeWrap").append(size);
        }
        
        function removeer(){
        	$("#sizeWrap").find(".size").last().remove();
        }        
    </script>
</body>
</html>