<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마켓하니 :: 오늘의 장보기, 마켓하니</title>

    <%-- import eventMain.css --%>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/event.css">
</head>
<body>

	<jsp:include page="/include/header.jsp"/>
	<div id="page3_main">
		<div id="page3_event">
			<div id="page3_view">
			    <div class="menu_event">	
			    	<div id="eventMenu">
			    		<ul class="menu">
			    		 	<li>전체보기</li>
			    		 	<li>회원혜택</li>
			    		 	<li>친구초대</li>
			    		 	<li>결제혜택</li>
			    		 	<li>카카오페이</li>
			    		</ul>
			    	</div>
			    </div>	
				<div id="view_body">
					<div class="view_page">
						<div class="view_cont">
						
							<div class="event_tit pay_tit">
								<h2 class="tit_event">카카오페이<span class="ico_comm ico_kakaopay"></span></h2>
							</div>
							
							<div class="event_info kakaopay_info">
								<div class="cont_info">
									<strong class="tit_info">"결제 금액"<br>
										<span class="emph">3천원 즉시할인</span>
									</strong>
									<div class="desc_info">
										<div class="box_bubble">
								        	<strong class="emph">카카오페이</strong>로 6만원 이상 결제 시
								        </div>
								        <ul class="list_info">
								        	<li>
								              <strong class="tit">방법</strong>
								                          결제 시 카카오페이 선택
								            </li>
								            <li>
								              <strong class="tit">대상</strong>
								                          이벤트 기간 내 마켓컬리에서 카카오페이로 6만원 이상 결제하신 분 (카카오페이 ID 당 1회)
								              <span class="txt_etc"><span class="ico_txt">※</span> 쿠폰 할인 및 적립금 적용 후 실결제 금액 기준</span>
								            </li>
								        </ul>
									</div> <%-- desc_info end --%>
							   </div> <%-- cont_info end --%>
							</div> <%--  event_info kakaopay_info end --%> 
							 
							<div class="event_noti">
								<ul class="list_noti">
						          <li>카카오페이로 6만원 이상 결제 시 3천원을 즉시할인 해드립니다.</li>
						          <li>결제 시 카카오페이 선택 시에만 혜택이 적용됩니다. (카카오페이 서비스 가입 기준 1일 1회)</li>
						          <li>카카오페이 이외의 간편 결제 수단 (토스, 차이, 스마일페이,네이버페이 등) 이용 혹은 신용카드 선택 시, 혜택 적용이 불가합니다.</li>
						          <li>결제 금액은 쿠폰 할인 및 적립금 적용 후 실 결제 금액입니다.</li>
						          <li>카카오페이 결제창에서 가장 높은 할인 금액으로 자동 설정됩니다.</li>
						          <li>카카오페이 결제창에서 적용 가능 할인이 선택되어야 할인 적용됩니다.</li>
						          <li>할인 혜택은 1개 주문건 당 결제 금액을 기준으로 적용됩니다.</li>
						          <li>결제 전체 취소 후 기간 내 재결제 시 할인 적용되며,&nbsp;결제 부분취소 후 재결제 시 할인 미 적용 됩니다.</li>
						          <li>행사 내용은 카카오페이 및 마켓컬리의 사정으로 중단 또는 변경 될 수 있습니다.</li>
						          <li>관련 문의는 카카오페이 고객센터&nbsp;1644-7405 및 카카오페이 고객센터 톡채널로 문의 부탁드립니다.</li>
						        </ul>
							</div> <%-- event_noti end --%>						
						</div> <%-- view_cont end --%>
					</div> <%-- view_page end --%>
				</div> <%-- view_body end --%>
			</div> <%--  page3_view end --%>
		
		</div> <%-- page3_event end --%>
	</div> <%-- page3_main end --%>
	<jsp:include page="/include/footer.jsp"/>

</body>
</html>