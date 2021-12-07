<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

    <%-- import infoModify.css --%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin_main.css"/>

    <%-- import header.css --%>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css"/>
	<link rel="icon" href="<%=request.getContextPath() %>/img/favicon/favicon-32x32.ico" type="image/x-icon" sizes="16x16">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script defer src="<%=request.getContextPath() %>/js/header/header.js"></script>
	<script defer src="<%=request.getContextPath() %>/js/header/location_postcode.js"></script>	
		
	<%-- import footer.css --%>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css"/>
		
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마켓하니 :: 관리자페이지</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css">
    <link rel="icon" href="${pageContext.request.contextPath}/img/favicon/favicon-32x32.ico" type="image/x-icon" sizes="16x16">
    <script defer src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<%-- include product_qna.css --%>
	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/css/admin_qna.css" />

	<%-- import admin_qna.js --%>
	<script defer src="${pageContext.request.contextPath}/js/admin/admin_qna.js"></script>
	
	<%-- jQuery library (served from Google) --%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	
	<%-- QnA 게시판 그리기 --%>
	<script>	
		
		$(document).ready(function() {
			qnaListadmin(1);
			
		});
		
	</script>

</head>

<body>

	<jsp:include page="../include/header.jsp"/>
	
	<c:set var="dto" value="${userData}"/>
	
	<div id="admin_main">
	<c:set var="dto" value="${userData}"/>
		<div id="pManage_content"> 
			<div class="page_aticle aticle_type2">
				
				<%-- 관리자메뉴 : 고객 문의 관리 --%>
				<div class="page_section section_pmanage">
					<div class="head_aticle">
						<h2 class="tit">고객 문의 관리</h2>
					</div>
				
				<%-- 게시판 영역 --%>
				<div id="content4">	
					<div class="qna_container">
							
						<div class="qna_content">
							<div class="qna_content_title">
								<div style="width: 710px;">제목</div>
								<div>작성자</div>
								<div>작성일</div>
								<div>답변상태</div>
							</div>
							
							
							<%-- QnA 공지부분 --%>
							<ul class="qna_notice_list">
								<li class="qna_notice_item">
									<div class="notice-cell">
										<span>공지</span>
										<strong>판매 (일시)중단 제품 안내 (21-11-12 업데이트)</strong>
									</div>
									<div class="item-cell"><p>Marketkurly</p></div>
									<div class="item-cell"><p>2021-11-18</p></div>
									<div class="item-cell"><p>-</p></div>
								</li>
							</ul>
							
						
							<%-- QnA 리스트 받아오는 영역 --%>
							<ul class="qna_content_list"></ul>						
							
							<%-- 문의하기, 페이지 이동 버튼 --%>
							<div class="qna_button_area">
								<div class="qna_paging_nav">
									<button type="button" class="prev"><span></span></button>
									<button type="button" class="next"><span></span></button>
								</div>
								
								<button class="qna_write_btn" onclick="showWrite();">
									<span>문의하기</span>
								</button>
							
							</div>
						</div> 
					</div>		
				</div>
					
				</div> <%-- page_section section_myinfo end --%>
			</div> <%-- page_aticle aticle_type2 end --%>
		</div> <%-- infoModify_content end --%>	
	</div> <%-- infoModify_main end --%>
	

	
	<%-- 모달 오버레이(공용) --%>
	<div class="modal_overlay">
	</div>
	
	<%-- 모달: "비밀글입니다" 경고창 --%>
	<div class="modal_dialog warning">
		<p>비밀글입니다</p>
		<button class="modal_button" onclick="hideSecret();"><strong>확인</strong></button> <%-- 확인버튼 클릭 시 모달함수 호출 --%>
	</div>
	
	<%-- 모달: 작성 완료 메시지 --%>
	<div class="modal_dialog confirm">
		<p>답변이 정상적으로 등록되었습니다.</p>
		<button class="modal_button" onclick="hideWriteConfirm(); location.reload();"><strong>확인</strong></button> <%-- 확인버튼 클릭 시 모달함수 호출 --%>
	</div>
	
	<%-- 모달: 작성 실패 메시지 --%>
	<div class="modal_dialog failure">
		<p>문의 등록에 실패하였습니다</p>
		<button class="modal_button" onclick="hideWriteFailure();"><strong>확인</strong></button> <%-- 확인버튼 클릭 시 모달함수 호출 --%>
	</div>
	
	<%-- 모달: "작성한 문의를 삭제하시겠습니까?"  --%>
	<div class="modal_dialog delete">
		<p>작성한 문의를 삭제하시겠습니까?</p>
		<button class="modal_button delete1" onclick="hideDelete();"><strong>취소</strong></button>
	<button class="modal_button delete2" onclick=""><strong>확인</strong></button> <%-- 확인버튼 클릭 시 모달함수 호출 --%>
	</div>
	
	<%-- 모달: 삭제 완료 메시지 --%>
	<div class="modal_dialog delete_confirm">
		<p>삭제되었습니다</p>
		<button class="modal_button" onclick="hideDeleteConfirm(); location.reload();"><strong>확인</strong></button> <%-- 확인버튼 클릭 시 모달함수 호출 --%>
	</div>
	
	<%-- 모달: 수정 완료 메시지 --%>
	<div class="modal_dialog revise_confirm">
		<p>수정이 완료되었습니다</p>
		<button class="modal_button" onclick="hideReviseConfirm(); location.reload();"><strong>확인</strong></button> <%-- 확인버튼 클릭 시 모달함수 호출 --%>
	</div>
	
	<%-- 문의하기 버튼 클릭 시 모달로 띄워줄 질문 작성창 --%>
	<div class="modal_dialog_qna write">
		<form action="user_qna_write.do" method="post">	<%-- 작성시 write_qna.do로 맵핑 --%>
		
		<table class="modal_qna_write">
			<tr class="modal_qna_title" height="53px">
				<td colspan="2">
					<strong>답변 작성하기</strong>
					<img src="<%=request.getContextPath() %>/img/product/qna_close.svg" onclick="hideWrite();"> <%-- 상단 우측 'X' 버튼 --%>
				</td>
			</tr>
						
			<tr class="modal_write_content" height="100px">
				<td width="100px" rowspan="2">답변 작성</td>				
				<td><textarea maxlength="500" name="qna_content"></textarea></td>
			</tr>
			
			<tr class="modal_write_button" height="77px" align="center">
				<td colspan="2">
					<button onclick="hideWrite();">취소</button>
					<button onclick="hideWrite(); showWriteConfirm();" type="submit">등록</button>
					</td>
				</tr>
			</table>
		</form>				
	</div><%-- .modal_dialog qna_write end --%>	
	
	<%-- 수정하기 버튼 클릭 시 모달로 띄워줄 작성창 --%>
	<div class="modal_dialog_qna revise">
		
		<form action="user_qna_revise.do" method="post">	<%-- 작성시 revise_qna.do로 맵핑 --%>
		
		<input type="hidden" value="${dto.getP_num() }" name="p_num">	<%-- 제품번호 : p_num --%>
		<input type="hidden" value="test_user" name="user_id"> <%-- 세션에서 user_id 갖고와야함 --%>
		
		<table class="modal_qna_write">
			<tr class="modal_qna_title" height="53px">
				<td colspan="2">
					<strong>답변내용 수정</strong>
					<img src="<%=request.getContextPath() %>/img/product/qna_close.svg" onclick="hideRevise();"> <%-- 상단 우측 'X' 버튼 --%>
				</td>
			</tr>
			<tr class="modal_qna_header" height="90px">
				<td width="100px">
					<div class="modal_qna_image">
						<img width="72px" height="72px" src="<%=request.getContextPath() %>/upload/product/${dto.getP_image()}">
					</div>
				</td>
				<td><strong>[${dto.p_seller}]${dto.p_name }</strong></td>
			</tr>
			<tr class="modal_write_title" height="50px">
				<td width="100px">제목</td>
				<td><input class="qna_revise_title" name="qna_title" value=""></td>	<%-- 제목 : qna_title --%>
			</tr>
			<tr class="modal_write_content" height="260px">
				<td width="100px" rowspan="2">내용</td>					<%-- 내용 : qna_content --%>
				<td><textarea class="qna_revise_content" maxlength="5000" name="qna_content"></textarea></td>
			</tr>
			<tr class="modal_write_secret" height="25px">
				<td>
					<label onclick="alert('test');">
						<input class="secret_check" type="checkbox" name="is_secret"> <%-- 비밀글여부 : is_secret --%>
						<span class="secret_check_ico"> </span>
						<span>비밀글로 문의하기</span>
					</label>
				</td>
			</tr>
			<tr class="modal_write_button" height="77px" align="center">
				<td colspan="2">
					<button onclick="hideRevise();">취소</button>
					<button onclick="hideRevise(); showReviseConfirm();" type="submit">등록</button>
					</td>
				</tr>
			</table>
		</form>				
	</div>			
	
	
	<jsp:include page="../include/footer.jsp"/>

</html>