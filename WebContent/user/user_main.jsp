<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/product_list.css?after">

</head>
<body>
	<div align="center">
	
		<hr width="50%">
			<h3>[카테고리, 신상품, 베스트, 알뜰쇼핑, 검색] 테스트 페이지</h3>
		<hr width="50%">
		<br>
		
		<a href="<%=request.getContextPath() %>/user_main.do">전체목록</a> <br>
		<a href="<%=request.getContextPath() %>/user_category.do?category=A">커피,베이커리</a> <br>
		<a href="<%=request.getContextPath() %>/user_new.do">신상품</a> <br>
		<a href="<%=request.getContextPath() %>/user_best.do">베스트</a> <br>
		<a href="<%=request.getContextPath() %>/user_onsale.do">알뜰쇼핑</a>
		
		<br> <br> <br> <br>
		
		<%-- 여기서부터가 본문에 쓰일 내용 --%>
		<div class="article" align="center">
			<span id="title">전체상품</span>
			
			<br><br>
			
			<c:set var="list" value="${productList}"/>
			<c:set var="itemCount" value="${listCount }"/>
				 
			<div class="top_line">
				<p id="left">총 ${itemCount }개 </p>
				<ul id="right">
					<li><a>추천순</a></li>
					<li><a>신상품순</a></li>
					<li><a>판매량순</a></li>
					<li><a>혜택순</a></li>
					<li><a>낮은 가격순</a></li>
					<li><a>높은 가격순</a></li>
				</ul>
			</div>
		
			<table width="1050">
				<tr>
				<c:forEach items="${list}" var="dto">
					<c:set var="count" value="${count + 1}"/>
					
					<td valign="top">
						<div class="image">
							<img class="product" src="<%=request.getContextPath() %>/image/${dto.getP_image()}" width="auto" height="435">
							<button type="button" class="btn_cart"><img src="<%=request.getContextPath() %>/image/btn_cart.svg"></button>
						</div><br>
						<div class="title">[${dto.getP_seller()}] ${dto.getP_name()}</div><br>
						
					 	<c:if test="${dto.getP_discount() != 0}">
					 		<div class="discount">
					 			<span id="percentage"> ${dto.getP_discount() }% </span>  
					 			<span id="p_discount"><fmt:formatNumber value="${dto.getP_price() * (100-dto.getP_discount()) / 100}"/>원 </span> <br><br>
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
						
						<tr>
					</c:if>
				</c:forEach>
				</tr>
			</table>
		</div>
		<%-- 여기까지 --%>
	
	</div>
	
</body>
</html>