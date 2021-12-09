<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

    <%-- import my_orderlist.css --%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/my_orderlist.css"/>

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
    <title>마켓하니 :: 오늘의 장보기, 마켓하니</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css">
    <link rel="icon" href="${pageContext.request.contextPath}/img/favicon/favicon-32x32.ico" type="image/x-icon" sizes="16x16">
    <script defer src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<!-- jQuery library (served from Google) -->
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
	width: 800px;
	height: auto;
	font-family: noto sans;
	font-size: 12px;
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
	
	
	<div id="orderlist_main">
		<div id="orderlist_content">
			<div class="page_aticle aticle_type2">
				
			    <%-- 마이 하니 좌측 메뉴 --%> 
				<div id="snb" class="snb_my">
					<h2 class="tit_snb">마이하니</h2>
					<div class="inner_snb">
						<ul class="list_menu">
							<li>
								<a href="${pageContext.request.contextPath}/user_mypage_orderHistory.do">주문 내역</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/user/user_mypage_emoney.jsp">적립금</a>
							</li>
							<li>
								<a href ="${pageContext.request.contextPath}/user/user_product_review_on_write.jsp">상품 후기</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/user_mypage_qna.do?user_id=${user_id }">상품 문의</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/user_userInfo.do">개인 정보 수정</a>
							</li>
						</ul>
					</div>
				</div>
					
				<%-- 질문 리스트 게시판 --%>
				<div id="viewOrderList" class="page_section section_orderlist">
					<div class="head_aticle">
						<h2 class="tit">상품 문의</h2>
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
									<td colspan="3" align="left"><font color="black">&nbsp;&nbsp;&nbsp;&nbsp;${dto.getQna_content() }</font></td>
								</tr>
							</c:if>
							
							<c:if test="${!empty dto.getQna_answer() }">
								<tr class="answer" id="${status.count}">
									<td align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<font color="gray">A.</font></td>
									<td colspan="3" align="left"><font color="gray">&nbsp;&nbsp;&nbsp;&nbsp;${dto.getQna_answer() }</font></td>
								</tr>
							</c:if>
							
							</c:forEach>
						</table>
					</div>
					
					<%--페이징 처리 시작 --%>
					<div class="pagination" align="center"> <%-- 페이징 처리 div --%>
					
						<c:if test="${page == 1 }">
							<a class="first" 
								href="user_mypage_qna.do?page=1&user_id=${user_id }"><span></span></a>
							<a class="prev" 
								href="user_mypage_qna.do?page=1&user_id=${user_id }"><span></span></a>
						</c:if>
						
						<c:if test="${page != 1 }">
							<a class="first" 
								href="user_mypage_qna.do?page=1&user_id=${user_id }"><span></span></a>
							<a class="prev" 
								href="user_mypage_qna.do?page=${page - 1 }&user_id=${user_id }"><span></span></a>
						</c:if>
						
					
						<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
							<c:if test="${i == page }">
								<a id="on"
									href="user_mypage_qna.do?page=${i }&user_id=${user_id }"><span>${i }</span></a>
							</c:if>
					
							<c:if test="${i != page }">
								<a href="user_mypage_qna.do?page=${i }&user_id=${user_id }"><span>${i }</span></a>
							</c:if>
						</c:forEach>
					
						<c:if test="${page == allPage }">
							<a class="next" 
								href="user_mypage_qna.do?page=${allPage}&user_id=${user_id }"><span></span></a>
							<a class="last" 
								href="user_mypage_qna.do?page=${allPage}&user_id=${user_id }"><span></span></a>
						</c:if>
						
						<c:if test="${page != allPage }">
							<a class="next"
								href="user_mypage_qna.do?page=${page + 1 }&user_id=${user_id }"><span></span></a>
							<a class="last"
							    href="user_mypage_qna.do?page=${allPage}&user_id=${user_id }"><span></span></a>
						</c:if>
										
					</div>  <%-- 페이징 처리 div end--%>

				</div>	
			</div>		
		</div>	
	</div>	
		
	<jsp:include page="../include/footer.jsp"/>

</body>
</html>