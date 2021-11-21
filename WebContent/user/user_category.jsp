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

</head>

<body>

	<jsp:include page="../include/header.jsp"/>
	
	<div align="center">
			
		<div class="article" align="center">
			<div class="category"><span>베이커리·치즈·델리</span></div>
			
			<ul id="sub_category">
				<li><a href="<%=request.getContextPath() %>/user_category.do?category=A">전체보기</a></li>
				<li><a href="<%=request.getContextPath() %>/user_category.do?category=A1">커피</a></li>
				<li><a href="<%=request.getContextPath() %>/user_category.do?category=A2">베이커리</a></li>
				<li><a href="<%=request.getContextPath() %>/user_category.do?category=A2">치즈</a></li>
				<li><a href="<%=request.getContextPath() %>/user_category.do?category=A2">우유</a></li>
			</ul>
		
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
		
			<table class="product_table" width="1050">
				<tr class="product">
				<c:forEach items="${list}" var="dto">
					<c:set var="count" value="${count + 1}"/>
					
					<td class="item" valign="top">
						<div class="image">
							<img class="product" src="<%=request.getContextPath() %>/img/product/${dto.getP_image()}" width="auto" height="435">
							<button type="button" class="btn_cart"><img src="<%=request.getContextPath() %>/img/product/btn_cart.svg"></button>
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
						
						<tr class="item">
					</c:if>
				</c:forEach>
				</tr>
			</table>
		</div>
		<%-- 여기까지 --%>
	</div>
	
	<jsp:include page="../include/footer.jsp"/>
<%--
</body>
</html>
 --%>