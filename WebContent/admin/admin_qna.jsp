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

	<%-- import admin_qna.js --%>
	<script defer src="${pageContext.request.contextPath}/js/admin/admin_qna.js"></script>
	
	<%-- jQuery library (served from Google) --%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	
<style type="text/css">
	
.pagination {
	margin-top: 60px;
	margin-bottom: 60px;
	margin-left: 350px;
	padding-bottom: 30px;
	align-content: center;
	width: 1050px;
	height: 34px;	
}

.pagination a {
	background-color: transparent;
    text-decoration: none;
    display: inline-block;
    width: 33px;
    height: 32px;
    border: 1px solid #ddd;
    overflow: hidden;
	float: left;
	cursor: pointer;
	
	vertical-align: top;
    font-weight: 700;
    font-size: 12px;
    font-weight: 700;
    font-size: 12px;
    color: #333;
    line-height: 34px;
    border-left: 0;
}

a.last::after {
	clear: both;
}

.pagination a#on {
	background-color: #f7f7f7;
	color: #5f0080;
}

.pagination a:hover {
	background-color: #f7f7f7;
	color: #5f0080;
}

a.first{
	background-image: url(./img/product/pagination-first.webp);
	background-repeat: no-repeat;
    background-position: 50% 50%;
    border-left: 1px solid #ddd;
}

.prev{
	background-image: url(./img/product/pagination-prev.webp);
	background-repeat: no-repeat;
    background-position: 50% 50%;
}

.next{
	background-image: url(./img/product/pagination-next.webp);
	background-repeat: no-repeat;
    background-position: 50% 50%;
}

.last{
	background-image: url(./img/product/pagination-last.webp);
	background-repeat: no-repeat;
    background-position: 50% 50%;
}

.qna_board{
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	width: 1050px;
	height: auto;
	font-family: noto sans;
	font-size: 13px;
}

.qna_board td{
	border-top: 1px solid #f2f2f2;
	height: 40px;
}

.qna_board th{
	height: 40px;
	font-weight: 600;
}

.qna_board tr:hover {
	background-color: #f2f2f2;
	cursor: pointer;
}
.div_board{
	width: 800px;
	min-height: 400px;
}

tr.content, tr.answer {
 	display: none; 
	cursor: pointer;
	background-color: #f2f2f2;
}

</style>

<script type="text/javascript">

function expand(num){
	
	console.log(num);
	$('tr#' + num + ".content").toggle();
 	$('tr#' + num + ".answer").toggle();
/* 	$('.answer#' + num).toggle(); */

}

</script>	

</head>

<body>

	<jsp:include page="../include/header.jsp"/>
	
	
	<div id="admin_main">
	<c:set var="dto" value="${userData}"/>
	<div id="pManage_content"> 
		<div class="page_aticle aticle_type2">
			
		<div class="qna_area">
			
			<%-- 관리자메뉴 : 고객 문의 관리 --%>
			<div class="page_section section_pmanage">
				<div class="head_aticle">
					<h2 class="tit">고객 문의 관리</h2>
				</div>
			
				<div class="div_board">
					<c:set var="list" value="${qnaList }"/>
					<table class="qna_board" cellspacing="0">
						<tr>
							<th>질문번호</th> <th>제목</th> <th>작성일</th> <th>답변여부</th>
						</tr>
						
						<c:forEach items="${list }" var="dto" varStatus="status">
						<tr>
							<td align="center"><font color="gray">${dto.getQna_num() }</font></td>
							<td onclick="expand('${status.count}');">${dto.getQna_title() }</td>
							<td align="center"><font color="gray">${dto.getQna_date() }</font></td>
							
							<c:if test="${!empty dto.getQna_answer() }">
								<td align="center"><font color="#5f0080"><strong>답변완료</strong></font></td>
							</c:if>
							
							<c:if test="${empty dto.getQna_answer() }">
								<td align="center">답변대기</td>
							</c:if>
							
						</tr>
						
						
						<c:if test="${!empty dto.getQna_content() }">
							<tr class="content" id="${status.count}">
								<td align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q.</td>
								<td colspan="2" align="left"><font color="black">&nbsp;&nbsp;&nbsp;&nbsp;${dto.getQna_content() }</font></td>
								<c:if test="${!empty dto.getQna_answer() }">
									<td> </td>
								</c:if>
								
								<c:if test="${empty dto.getQna_answer() }">
									<td align="center"><font color="gray">답글달기</font></td>
								</c:if>
							</tr>
						</c:if>
						
						<c:if test="${!empty dto.getQna_answer() }">
							<tr class="answer" id="${status.count}">
								<td align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<font color="gray">A.</font></td>
								<td colspan="2" align="left"><font color="gray">&nbsp;&nbsp;&nbsp;&nbsp;${dto.getQna_answer() }</font></td>
								<td align="center"><font color="gray">
									<a onclick="confirm('답글을 삭제하시겠습니까?')">삭제</a> &nbsp;&nbsp;&nbsp;&nbsp; 
									<a>수정</a></font>
								</td>
							</tr>
						</c:if>
						
						</c:forEach>
					</table>
				</div>
				
				<%--페이징 처리 시작 --%>
				<div class="pagination" align="center"> <%-- 페이징 처리 div --%>
				
					<c:if test="${page == 1 }">
						<a class="first" 
							href="admin_qna.do?page=1"><span></span></a>
						<a class="prev" 
							href="admin_qna.do?page=1"><span></span></a>
					</c:if>
					
					<c:if test="${page != 1 }">
						<a class="first" 
							href="admin_qna.do?page=1"><span></span></a>
						<a class="prev" 
							href="admin_qna.do?page=${page - 1 }"><span></span></a>
					</c:if>
					
				
					<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
						<c:if test="${i == page }">
							<a id="on"
								href="admin_qna.do?page=${i }"><span>${i }</span></a>
						</c:if>
				
						<c:if test="${i != page }">
							<a href="admin_qna.do?page=${i }"><span>${i }</span></a>
						</c:if>
					</c:forEach>
				
					<c:if test="${page == allPage }">
						<a class="next" 
							href="admin_qna.do?page=${allPage}"><span></span></a>
						<a class="last" 
							href="admin_qna.do?page=${allPage}"><span></span></a>
					</c:if>
					
					<c:if test="${page != allPage }">
						<a class="next"
							href="admin_qna.do?page=${page + 1 }"><span></span></a>
						<a class="last"
						    href="admin_qna.do?page=${allPage}"><span></span></a>
					</c:if>
									
				</div>  <%-- 페이징 처리 div end--%>
			
			</div>
			 
		</div> 
		</div>
	</div> 
</div> 
	

	
	<jsp:include page="../include/footer.jsp"/>

</html>