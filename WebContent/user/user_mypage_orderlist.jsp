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
    <title>마켓하니 :: 내일의 장보기 마켓하니</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css">
    <link rel="icon" href="${pageContext.request.contextPath}/img/favicon/favicon-32x32.ico" type="image/x-icon" sizes="16x16">
    <script defer src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


</head>
<body>

	<jsp:include page="../include/header.jsp"/>
	
	<c:set var="orderData" value="${orderHistory}"/>
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
									<a href="${pageContext.request.contextPath}/user/#.jsp">상품 후기</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/user/#.jsp">상품 문의</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/user_userInfo.do">개인 정보 수정</a>
								</li>
							</ul>
						</div>
					</div>
					
					<%-- 마이 할리 중 주문 내역 파트 부분 --%>
					<div id="viewOrderList" class="page_section section_orderlist">
						<div class="head_aticle">
							<h2 class="tit">주문내역</h2>
						</div>
						<ul class="list_order">
						<c:forEach items="${orderData}" var="dto" varStatus="status">
							<li>
								<c:if test="${status.first}">
									<c:set var="date" value="${dto.getO_date().substring(0, 10)}"/>
									<div class="date">${dto.getO_date().substring(0, 10)}</div>
								</c:if>
								<c:if test="${!dto.getO_date().substring(0, 10).equals(date)}">
									<c:set var="date" value="${dto.getO_date().substring(0, 10)}"/>
									<div class="date">${dto.getO_date().substring(0, 10)}</div>
								</c:if>
								<div class="order_goods">
									<div class="name">
										<a>${dto.getP_name()} 외 ${dto.getP_count()}건 </a>
									</div>
									<div class="order_info">
										<div class="thumb">
											<img src="${pageContext.request.contextPath}/upload/product/${dto.getP_image()}" alt="주문 대표 사진">
										</div>
										<div class="desc">
											<dl>
												<dt>주문번호</dt>
												<dd>${dto.getO_id()}</dd>
											</dl>
											<dl>
												<dt>결제금액</dt>
												<dd>
													<fmt:formatNumber value="${dto.getO_total()}"/>
													원
												</dd>
											</dl>
											<dl>
												<dt>주문상태</dt>
												<dd class="status end">결제완료</dd>
											</dl>
										</div>
									</div><%--order_info end --%>
																		
								</div> 
							</li> <%-- 첫번째 주문내역건 end --%>
						</c:forEach>
						</ul><%-- list_order end --%>
						<div class="layout-pagination"></div>					
					</div>
					
				</div> <%-- page_aticle aticle_type2 end --%>			

		</div> <%-- orderlist_content end --%>	
	</div> <%-- orderlist_main end --%>
	
	
	
		
	<jsp:include page="../include/footer.jsp"/>

</body>
</html>