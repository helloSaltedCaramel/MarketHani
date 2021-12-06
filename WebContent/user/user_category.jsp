<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%-- import product_list.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/product_list.css?after">

<%-- import header.css --%>
<link rel="stylesheet" type="text/css" href="css/header.css"/>
<link rel="icon" href="<%=request.getContextPath() %>/img/favicon/favicon-32x32.ico" type="image/x-icon" sizes="16x16">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script defer src="<%=request.getContextPath() %>/js/header/header.js"></script>
<script defer src="<%=request.getContextPath() %>/js/header/location_postcode.js"></script>

<%-- import footer.css --%>
<link rel="stylesheet" type="text/css" href="css/footer.css"/>

<%-- 20211123: javascript 연동 (허민회) --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script defer src="${pageContext.request.contextPath}/js/productList/addCart.js"></script>

<%-- jQuery library (served from Google) --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<%-- import user_category.js --%>
<script defer src="${pageContext.request.contextPath}/js/user/user_category.js"></script>

<script>

// 1. 로딩 후 서브카테고리 출력
$().ready(function(){
	
	display_category('${category}');
});

// 2. 로딩 후 상단 서브카테고리 및 정렬방식에 css부여 
$().ready(function(){
	let order = 'li#' + '${sortBy}'; //액션에서 전달받은 정렬방식 코드
	$(order).css('color', 'black');
	
	let sub_cat = 'li#' + '${category} a'; //액션에서 전달받은 카테고리 코드
	$(sub_cat).css('color', '#5f0080');
	$(sub_cat).css('font-weight', '600');
});

</script>

</head>

<body>

	<jsp:include page="../include/header.jsp"/>
	
	<div align="center">
			
		<div class="article" align="center">
			
			<%-- 배너 표시 영역 --%>
			<div class="category_banner" align="center" width="1050px" height="100%">
			
			</div>
			
			<%-- 제목 표시 영역 --%>
			<div class="category">
				<span></span>
			</div>
			
			<%-- 서브카테고리 표시 영역 --%>
			<ul id="sub_category">
				
			</ul>
		
			<c:set var="list" value="${productList}"/>
			<c:set var="itemCount" value="${totalRecord }"/>
			
			<%-- 여기서부터가 본문에 쓰일 내용 --%>
			<div class="article" align="center">
				
				<c:set var="list" value="${productList}"/>
				<c:set var="itemCount" value="${totalRecord }"/>
				
				<%-- 상품 목록 정렬  --%>	 
				<div class="top_line">
					<p id="left">총 ${itemCount }개 </p>
					<form class="sort" method="post">
						<ul id="right">
							<li id="recommend" onclick="sort('${category}','recommend');">추천순</li>
							<li id="new" onclick="sort('${category}','new');">신상품순</li>
							<li id="low" onclick="sort('${category}','low');">낮은 가격순</li>
							<li id="high" onclick="sort('${category}','high');">높은 가격순</li>
						</ul>
					</form>
				</div>
				
				<%-- 상품 디스플레이 --%>
				<table class="product_table" width="1050">
					<tr class="product">
					<c:forEach items="${list}" var="dto">
						<c:set var="count" value="${count + 1}"/>
						<td class="item" valign="top"> 
							<div class="image">
								<a href="<%=request.getContextPath() %>/user_product_view.do?p_num=${dto.getP_num()}">
									<img class="product" src="<%=request.getContextPath() %>/upload/product/${dto.getP_image()}" width="auto" height="435">
								</a>
								<input type="hidden" name="p_num" value="${dto.getP_num()}" /> <%-- 2021123: input hidden 추가 (허민회) --%>
								<button type="button" class="btn_cart">
									<img src="<%=request.getContextPath() %>/img/product/btn_cart.svg">
								</button>
							</div>
							
							<br>
							<div class="title">[${dto.getP_seller()}] ${dto.getP_name()}</div><br>
							
						 	<c:if test="${dto.getP_discount() != 0}">
						 		<div class="discount">
						 			<span id="percentage"> ${dto.getP_discount() }% </span>  
						 			<span id="p_discount"><fmt:formatNumber value="${dto.getP_price() * (100-dto.getP_discount()) / 100}" pattern="0,000"/>원 </span> <br><br>
						 			<span id="p_original"><fmt:formatNumber value="${dto.getP_price()}"/>원</span> <br><br>
						 		</div>
						 	</c:if>
							
							<c:if test="${dto.getP_discount() == 0}"> 	
								<div class="nodiscount"><fmt:formatNumber value="${dto.getP_price()}"/>원</div><br>
							</c:if>	
							
							<div class="contents">${dto.getP_name_cont()}</div><br>
						</td>
						
						<c:if test="${count % 3 == 0}">
							</tr>
							
							<tr>
								<td> <br><br><br> </td>
							</tr>
							
							<tr class="item">
						</c:if>
					</c:forEach>
					</tr>
				</table>
		
		<%-- 페이지네이션--%>
		<div class="pagination" align="center">
		
			<c:if test="${page == 1}">
				<a class="first" href="user_category.do?cat=${category }&sort=${sortBy}&page=1"><span></span></a>
				<a class="prev" href="user_category.do?cat=${category }&sort=${sortBy}&page=1"><span></span></a>
			</c:if>
		
			<c:if test="${page != 1}">
				<a class="first" href="user_category.do?cat=${category }&sort=${sortBy}&page=1"><span></span></a>
				<a class="prev" href="user_category.do?cat=${category }&sort=${sortBy}&page=${page - 1 }"><span></span></a>
			</c:if>
		
			<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
				<c:if test="${i == page }">
					<a id="on" href="<%=request.getContextPath() %>/user_category.do?cat=${category }&sort=${sortBy}&page=${i }"><span>${i }</span></a>
				</c:if>
				
				<c:if test="${i != page }">
					<a href="<%=request.getContextPath() %>/user_category.do?cat=${category }&sort=${sortBy}&page=${i }"><span>${i }</span></a>
				</c:if>
			</c:forEach>
			
			<c:if test="${page == allPage}">
				<a class="next" href="user_category.do?cat=${category }&sort=${sortBy}&page=${allPage }"><span></span></a>
				<a class="last" href="user_category.do?cat=${category }&sort=${sortBy}&page=${allPage }"><span></span></a>
			</c:if>	
			
			<c:if test="${page != allPage}">
				<a class="next" href="user_category.do?cat=${category }&sort=${sortBy}&page=${page + 1 }"><span></span></a>
				<a class="last" href="user_category.do?cat=${category }&sort=${sortBy}&page=${allPage }"><span></span></a>
			</c:if>
			
		</div><%-- 페이지네이션 끝 --%>
	</div>
	
	<jsp:include page="../include/footer.jsp"/>
<%--
</body>
</html>
 --%>