<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>registration</title>
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
<%@ include file="../include/header.jsp" %>
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
			                    <input type="number" name="sizeStock" class="form-control" id="sizeStock" value="0" required="required"/>
			                </div>
                		</li>              		
                	</ul>
                </div>
                <div class="detail-info">
                    <h2>상품 상세 정보</h2>
                    <textarea id="summernote" name="prdCnt" id="prdCnt"></textarea>
                </div>
                <div id="board_button">
                    <input type="submit" class="btn btn-outline-secondary" value="저 장">
                    <input type="button" class="btn btn-outline-secondary" value="돌아가기">
                </div>
            </form>
        </article> 
    </main>
<%@ include file="../include/footer.jsp" %>
    <script>
        $(document).ready(function() {//썸머노트
        //여기 아래 부분
        $('#summernote').summernote({
              height: 450,                 // 에디터 높이
              minHeight: null,             // 최소 높이
              maxHeight: null,             // 최대 높이
              focus: false,                // 에디터 로딩후 포커스를 맞출지 여부
              lang: "ko-KR",			       // 한글 설정
              callbacks:{
            	  onImageUpload: function(files, editor, welEditable){
  		            for (var i = files.length - 1; i >= 0; i--) {
		            	sendFile(files[i], this);
            	  }
              }
            }
        });
      }); 
        
        function sendFile(file, el){//썸머노트 콜백
        	let data = new FormData();
        	data.append('file', file);
        	$.ajax({
            	data: data,
            	type: "POST",
            	url: '${pageContext.request.contextPath}/ajax/SummerNoteImageFile.do',
            	cache: false,
            	contentType: false,
            	enctype: 'multipart/form-data',
            	processData: false,
            	success: function(data) {
            		console.log("ajax 응답 성공");
            		console.log(data);
              		$(el).summernote('editor.insertImage', data.url);
            	}
          	});
        }
        
        
        
       
        function check(){//코드 조합 및 유효성 검사       	
        	let brandCode = $("#brandCode").val();
        	let crdCode =  $("#typeCode").val();
        	let inputCode = $('#inputCode').val();
        	let checkCode = /^[0-9]{4}$/;
        	if($("#inputCode").val() == "" || !checkCode.test(inputCode)){
        		alert("상품코드를 입력해주세요(숫자 4자리로 이루어진 코드여야합니다.)");
        		$("#inputCode").focus();
        		return false;
        	}
        	let prdCode = brandCode+crdCode+inputCode;
        	$('input[name=prdCode]').attr('value',prdCode);
        	if($("#prdName").val() == ""){
        		alert("상품명을 입력해주세요");
        		$("#prdName").focus();
        		return false;
        	}
        	if($("#prdPrice").val() == ""){
        		alert("상품가격을 입력해주세요");
        		$("#prdPrice").focus();
        		return false;
        	}
        	if($("#prdMadeIn").val() == ""){
        		alert("상품 제조국을 입력해주세요");
        		$("#prdMadeIn").focus();
        		return false;
        	}
        	if($("#prdMt").val() == ""){
        		alert("상품 소재를 입력해주세요");
        		$("#prdMt").focus();
        		return false;
        	}
        	if($("#prdQc").val() == ""){
        		alert("품질보증 기준을 입력해주세요");
        		$("#prdQc").focus();
        		return false;
        	}
        	if($("#MainImg").val() == ""){
        		alert("메인이미지를 등록해주세요");
        		$("#MainImg").focus();
        		return false;
        	}
        	if($("#subImg1").val() == ""){
        		alert("서브이미지를 등록해주세요");
        		return false;
        	}
        	if($("#subImg2").val() == ""){
        		alert("서브이미지를 등록해주세요");
        		return false;
        	}
        	if($("#prdCnt").val() == ""){
        		alert("상품 상세내용을 입력해주세요");
        		$("#prdCnt").focus();
        		return false;
        	}
        	return true
        }
        
        

        $('#MainImg').on('change',function(event){//이미지 등록시 이미지명 텍스트 출력
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
        size += '	<div class="w-25 me-5">';
		size += '		<select name="sizeKind" class="form-select" id="sizeKind">'
		size += '			<option value="210">210</option>';
        size += '			<option value="220">220</option>';  
        size += '			<option value="230">230</option>';  
        size += '			<option value="240">240</option>';  
        size += '			<option value="250">250</option>';  
        size += '			<option value="260">260</option>';  
        size += '			<option value="270">270</option>';  
        size += '			<option value="280">280</option>';  
        size += '		</select>';  
        size += '	</div>';  
        size += '	<div class="w-25">';
        size += '		<input type="number" name="sizeStock" class="form-control" id="sizeStock" value="0" required="required"/>';  
        size += '	</div>';  
        size += '</li>';  
                

        function add(){//재고 추가 버튼 클릭시 실행 함수
        	$("#sizeWrap").append(size);
        }
        
        function removeer(){//재고 삭제 버튼 클릭시 실행 함수
        	$("#sizeWrap").find(".size").last().remove();
        }        
    </script>
</body>
</html>
