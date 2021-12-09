<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
		<%-- import header.css --%>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css"/>
		<link rel="icon" href="<%=request.getContextPath() %>/img/favicon/favicon-32x32.ico" type="image/x-icon" sizes="16x16">
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script defer src="<%=request.getContextPath() %>/js/header/header.js"></script>
		<script defer src="<%=request.getContextPath() %>/js/header/location_postcode.js"></script>
		
		<%-- import footer.css --%>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css"/>

		<meta charset="UTF-8">
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ordered.css">
		<title>마켓하니 :: 오늘의 장보기, 마켓하니</title>
</head>
<body>
	<jsp:include page="/include/header.jsp"/>

	<div class="container">
        <div class="section_end">
            <div class="order_result">
                <div class="delivery_check">
                    <img src="${pageContext.request.contextPath}/img/ordered/order_success_icon.webp" alt="delivery_checked" class="delivery_ico">
                    <div class="check">
                        <p class="comment">
                            <span id="username">${user_name}님의</span>
                            <span id="completed">주문이 완료되었습니다.</span>
                        </p>
                        <strong>내일 아침에 만나요!</strong>
                    </div>
                </div>

                <div class="order_info">
                    <ul>
                        <li>
                            <span class="title">결제금액</span>
                            <strong class="money">
                                <fmt:formatNumber value="${paymentBalance}"/>
                                <span class="won">원</span>
                            </strong>
                        </li>

                        <li>
                            <span class="title">적립금</span>
                            <strong class="point">
                            		+
                                <fmt:formatNumber value="${point}"/>
                                <span class="won">원</span>
                            </strong>
                        </li>
                    </ul>
                    <p class="description">*적립금은 주문 금액의 5%</p>
                </div>

                <div class="package">
                    <img src="${pageContext.request.contextPath}/img/ordered/recycle_package.webp" alt="package_img">
                </div>

                <ul class="policy_list">
                    <li>
                        <span>'입금확인' 상태일 때 주문내역 상세페이지에서 주문 취소가 가능합니다.</span>
                    </li>
                    <li>
                        <span>엘리베이터 이용이 어려운 경우 6층 이상부터는 공동 현관 앞 또는 경비실로 대응 배송 될 수 있습니다.</span>
                    </li>
                    <li>
                        <span>주문 / 배송 및 기타 문의가 있을 경우, 1:1 문의에 남겨주시면 신속히 해결드리겠습니다.</span>
                    </li>
                </ul>

                <a href="user_mypage_orderHistory.do" class="orderlist_btn">주문내역 보기</a>
                <a href="${pageContext.request.contextPath}/main.jsp" class="continue_btn">쇼핑 계속하기</a>
            </div>
        </div>
    </div>
    
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>