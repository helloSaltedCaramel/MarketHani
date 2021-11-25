<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%-- import main.css --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/infoModify.css"/>

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
    <script defer src="${pageContext.request.contextPath}/js/register/register_postcode.js"></script>
    <script defer src="${pageContext.request.contextPath}/js/register/register_regex.js"></script>

</head>

<body>
		<jsp:include page="../include/header.jsp"/> 
		
		<div id=infoModify_main>
		<div id="infoModify_content"> 
			<div id="myPageTop" class="page_aticle mypage_top">
				<div class="mypagetop_user">
					<div class="inner_mypagetop">
						<a href="">
							<img src="" alt="">
						</a>
					</div>
				</div>
				<div class="page_aticle aticle_type2">
				
				    <%-- 마이 할리 좌측 메뉴 --%> 
					<div id="snb" class="snb_my">
						<h2 class="tit_snb">마이할리</h2>
						<div class="inner_snb">
							<ul class="list_menu">
								<li>
									<a href="${pageContext.request.contextPath}/user/user_mypage_orderlist.jsp">주문 내역</a>
								</li>
								<li>
									<a href="">배송지 관리</a>
								</li>
								<li>
									<a href="">상품 후기</a>
								</li>
								<li>
									<a href="">상품 문의</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/user/user_mypage_myInfo.jsp">개인 정보 수정</a>
								</li>
							</ul>
						</div>
					</div>
				</div> <%-- page_aticle aticle_type2 end --%>			
			</div><%-- myPageTop end --%>	
		</div> <%-- infoModify_content end --%>	
	</div> <%-- div id=infoModify_main end --%>
		<jsp:include page="../include/footer.jsp"/>   

</body>
</html>