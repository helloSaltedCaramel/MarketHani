<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

    <%-- import my_emoney.css --%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/my_emoney.css"/>

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
	
	<div id="emoney_main">
		<div id="emoney_content"> 

				<div class="page_aticle aticle_type2">
				
				    <%-- 마이 할리 좌측 메뉴 --%> 
					<div id="snb" class="snb_my">
						<h2 class="tit_snb">마이할리</h2>
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
					
					<%-- 마이할리 중 적립금 파트 부분 --%>
					<div class="page_section section_point">
						<div class="head_aticle">
							<h2 class="tit">
								적립금
								<span class="tit_sub">보유하고 계신 적립금의 내역을 한 눈에 확인 하실 수 있습니다.</span>
							</h2>
						</div>
						<div id="viewPointList">
							<div class="point_header">
								<div class="point_view">
									<h3 class="tit">현재 적립금</h3> 
									<strong class="point">
										1,074 
										<span class="won">원</span>
									</strong>
								</div>
								<span class="disappear">
									<span class="subject no_day">소멸예정 적립금</span> 
									<span class="num">0 원</span>
								</span>
							</div>
							<table class="tbl tbl_type1">
								<caption style="display: none;">적립 사용 내역 상세보기</caption>
								<colgroup>
									<col style="width: 120px;"> 
									<col style="width: auto;"> 
									<col style="width: 122px;"> 
									<col style="width: 140px;">
								</colgroup>
								<thead>
									<tr class="bdLine">
										<th>날짜</th> 
										<th class="info">내용</th> 
										<th>유효기간</th> 
										<th>금액</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>21.11.27</td> 
										<td class="info">
											<span class="link">[사용] 주문(12163546) 결제 시 사용</span>
										</td> 
										<td></td> 
										<td class="point minus">-3,000 원 </td>
									</tr>
									<tr>
										<td>21.11.26</td> 
										<td class="info">
											<span class="link">[구매적립] 주문(12163546) 0.5% 적립</span>
										</td> 
										<td>
											<span>21.11.26</span>
										</td> 
										<td class="point">
											<span>+</span>
											135 원        
										</td>
									</tr>
									<tr>
										<td>21.11.24</td> 
										<td class="info">
											<span class="link">[후기적립금] [쌜모네키친] 오로라 생연어 (냉장)</span>
										</td> 
										<td>
											<span>22.11.30</span>
										</td> 
										<td class="point">
											<span>+</span>
											50 원        
										</td>
									</tr>
									<tr></tr>
									<tr></tr>
									<tr></tr>
								</tbody>							
							</table>
							<div></div>
						</div>
					
					</div>
					
				</div> <%-- page_aticle aticle_type2 end --%>			

		</div> <%-- emoney_content end --%>	
	</div> <%-- emoney_main end --%>
	
	
	
		
	<jsp:include page="../include/footer.jsp"/>

</body>
</html>