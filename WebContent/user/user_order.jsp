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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마켓하니 :: 내일의 장보기 마켓하니</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/order.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/order_modal.css">
    <link rel="icon" href="${pageContext.request.contextPath}/img/favicon/favicon-32x32.ico" type="image/x-icon" sizes="16x16">
    <script defer src="${pageContext.request.contextPath}/js/order/order_payment.js"></script>
    <script defer src="${pageContext.request.contextPath}/js/order/order_modal.js"></script>
</head>

<body>
		<jsp:include page="/include/header.jsp"/>
		
		<div class="modal_bg"></div> 
    <div class="container">
    	<c:set var="cartProductDTO" value="${cartList}" />
    	<c:set var="userData" value="${userDTO}" />
    	<c:set var="priceData" value="${priceDTO}" />
        <div class="big_title">
            <h3 class="order_title">주문서</h3>
        </div>

        <div class="title_section">
            <h2 class="item_title">주문상품</h2>
        </div>
        <form method="post" action="${pageContext.request.contextPath}/user_payment.do">
            <div class="item_section">
                <div class="items_info">
                    <button class="items_btn" type="button"></button>
                </div>

                <!-- items_btn 클릭 시 나타날 text -->
                <div class="short_info">
                    ${cartProductDTO.get(0).getP_name()} <!-- Cart name -->
                    	외
                    ${cartProductDTO.size()}개의 상품을 주문합니다. <!-- Cart count(pk) -->
                </div>
                
                <ul class="item_list">
                	<c:forEach items="${cartProductDTO}" var="dto">
                    <li> <!-- item start -->
                        <div class="thumb">
                            <img src="${pageContext.request.contextPath}/img/product/${dto.getP_image()}" alt="상품이미지">
                        </div>

                        <div class="name">
                            <div class="inner_name">${dto.getP_name()}</div>
                        </div>

                        <div class="ea">
                            ${dto.getCart_qty() }
                            	개
                        </div>

                        <div class="item_price">
                            <span class="num">
                                <span class="price">
                                    <fmt:formatNumber value="${dto.getSalePrice() * dto.getCart_qty()}" />
                                    	원
                                </span>
                              	<c:if test="${dto.getSalePrice() != dto.getP_price() }">
                              	<span class="cost">
                              			<fmt:formatNumber value="${dto.getP_price() * dto.getCart_qty()}" />
                              			원
                              	</span>
                              	</c:if>
                            </span>
                        </div>
                    </li> <!-- item end -->
                  </c:forEach>
                </ul>
            </div>

        
            <!-- input으로 데이터 hidden 처리 -->
            <h2 class="section_title">주문자 정보</h2>

            <div class="orderer_section">
                <table class="section_table">
                    <tbody>
                        <tr class="fst">
                            <th>보내는 분</th>
                            <td>${userData.getUser_name()}</td>
                        </tr>

                        <tr>
                            <th>휴대폰</th>
                            <td>${userData.getUser_phone()}</td>
                        </tr>

                        <tr>
                            <th>이메일</th>
                            <td>
                                ${userData.getUser_email()}
                                <p class="email_guide">
                                    	정보 변경은 마이컬리 > 개인정보 수정 메뉴에서 가능합니다.
                                </p>
                            </td>
                        </tr>                        
                    </tbody>
                </table>
            </div>

            <h2 class="section_title">
                	배송 정보
                <span class="desc">배송 휴무일: 샛별배송(휴무없음), 택배배송(일요일)</span>
            </h2>
            <div class="address_info">
                <a href="#none" id="info_btn" class="desc">배송지 변경 안내</a>
                <div class="info_layer">
                    <strong class="emph">장바구니, 홈</strong>
                    	에서
                    <br>
                    	배송지를 변경할 수 있어요.
                </div>
            </div>
            <div class="delivery_section">
                <h3 class="delivery_title">배송지</h3>
                <div class="delivery_desc">
                	<c:if test="${empty address}">
                    <span class="address_block">
                    		<input type="hidden" name="user_address" value="${userData.getUser_addr()}">
                        <span class="default_loc">기본배송지</span>
                        <span class="address">${userData.getUser_addr()}</span>
                    </span>
                  </c:if>
                  <c:if test="${!empty address}">
                  	<span class="address_block">
                  			<input type="hidden" name="user_address" value="${address}">
                        <span class="address">${address}</span>
                    </span>
                  </c:if>
                </div>
            </div>
            <div class="receive_section">
                <h3 class="dds_title">상세 정보</h3>
                <div class="delivery_desc">
                    <div class="receiver_info">받으실 분 정보를 입력해주세요.</div>

                    <div class="receive_way" id="receiver" style="display: none;">
                    		<input type="hidden" name="receiver" id="receiver_input" value="empty">
                        <span class="place">받으실 분</span>
                        <span class="order_text" id="receiver_text">empty</span>
                    </div>
                    
                    <div class="delivery_msg" id="receiver_phone" style="display: none;">
                    		<input type="hidden" name="receiver_phone" id="receiver_phone_input" value="empty">
                        <span class="place">휴대폰 번호</span>
                        <span class="order_text" id="phone_text">empty</span>
                    </div>
                    
                    <div class="receive_way" id="receiver_message" style="display: none;">
                    		<input type="hidden" name="receiver_message" id="receiver_msg_input" value="empty">
                        <span class="place">배송메시지</span>
                        <span class="order_text" id="message_text">empty</span>
                    </div>

                    <button type="button" class="modify_btn">입력</button>
                </div>
            </div>

            <div class="package_img" style="display: block;">
                <img src="${pageContext.request.contextPath}/img/order/banner-order-paper_1050_107@2x.jpg.webp" alt="environment friendly package">
            </div>

            <div class="bottom_wrap">
                <div class="payment_left">
                    <h2 class="section_title">적립금</h2>
                    <table class="section_table">
                        <tbody>
                            <tr class="fst">
                                <th>적립금 사용</th>
                                <td>사용 가능한 적립금이 없습니다.</td>
                            </tr>
                        </tbody>
                    </table>

                    <h2 class="section_title">결제 수단</h2>
                    <table class="section_table payment">
                        <tr class="fst">
                            <th>결제수단 선택</th>
                            <td class="td_payment">
                                <label class="kakaopay">
                                    <input id="kakaopay" type="radio" name="payment_way" value="kakaopay" checked>
                                    <img class="kakao_logo" src="https://res.kurly.com/mobile/service/order/2109/ico_kakao-pay.png">
                                    <span class="icon_benefit">혜택</span>
                                </label>

                                <ul class="payment_menu">
                                    <li class="card">
                                        <label class="card_label">
                                            <input id="card" type="radio" name="payment_way" value="credit">
                                             	신용카드
                                        </label>
                                    </li>

                                    <li class="simple">
                                        <label class="simple_label">
                                            <input id="simple" type="radio" name="payment_way" value="simple">
                                            	간편결제
                                        </label>
                                    </li>

                                    <li class="phone">
                                        <label class="phone_label">
                                            <input id="phone" type="radio" name="payment_way" value="phone">
                                            	휴대폰
                                        </label>
                                    </li>
                                </ul>

                                <div class="benefit_block">
                                    <div class="kakaopay_benefit">
                                        <div class="kakaopay_bnf">
                                            <strong class="benefit_title">카카오페이</strong>
                                            <p class="sub_benefit">6만원 이상 결제 시 3천원 즉시할인</p>
                                            <p class="info_benefit">11/1 11시 ~ 11/21 24시, 카카오페이 ID당 1회(실명인증 기준), 선착순</p>
                                        </div>
                                    </div>
                                    <div class="simple_benefit">
                                        <div class="chai_benefit">
                                            <strong class="benefit_title">차이</strong>
                                            <p class="sub_benefit">2만원 이상 생애 첫 결제 시 3천원 즉시할인</p>
                                            <p class="info_benefit">11/1 11시 ~ 11/30 24시, 기간 내 차이 ID당 1회, 선착순</p>
                                        </div>
                                        <div class="payco_benefit">
                                            <strong class="benefit_title">페이코</strong>
                                            <p class="sub_benefit">페이페이코 충전포인트로 결제할 때마다 최대 5% 적립</p>
                                            <p class="info_benefit">
                                                * 11/1 11시 ~ 12/31 24시, 기본 2% + 추가 3% 페이코 포인트 적립(건당 최대 1,000원)
                                                <br>
                                                * 페이코로 15,000원 이상 구매 시 페이코 앱 내 1천원 쿠폰 적용(1일 ID당 1회)
                                                <br>
                                                * 페이코 앱 내 쿠폰영역에서 마켓커릴 쿠폰 다운로드, 결제 시 페이코 앱 내 적용
                                            </p>
                                        </div>
                                        <div class="smilepay_benefit">
                                            <strong class="benefit_title">스마일페이</strong>
                                            <p class="sub_benefit">2만원 이상 첫 결제 시, 결제금액의 10% 즉시 할인</p>
                                            <p class="info_benefit">
                                                * 11/1시 ~ 11/30 24시, 스메일페이 ID당 1회(실명인증 기준) 선착순
                                                <br>
                                                * 스마일페이로 첫 결제 시 결제금액의 10% (최대 3천원) 즉시 할인
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="td_notice">
                                <ul>
                                    <li>
                                        	※ 카카오페이, 차이, 토스, 네이버페이, 페이코 결제 시, 결제하신 수단으로만 환불되는 점 양해부탁드립니다.
                                    </li>
                                    <li>
                                        	※ 고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 토스 페이먼츠의 구매안전(에스크로) 서비스를 이용하실 수 있습니다.
                                    </li>
                                </ul>
                            </td>
                        </tr>
                    </table>

                    <h2 class="section_title">개인정보 수집/제공</h2>
                    <table class="section_table">
                        <tr>
                            <td>
                                <div class="terms">
                                    <label class="agree_check">
                                        <input type="checkbox" name="orderAgree"  required>
                                        	결제 진행 필수 동의
                                    </label>

                                    <ul class="agree_list">
                                        <li>
                                            <span class="subject">
                                                	개인정보 수집 · 이용 및 처리 동의
                                                <span class="emphasis">(필수)</span>
                                            </span>
                                        </li>

                                        <li>
                                            <span class="subject">
                                                	전자지급 결제대행 서비스 이용약관 동의
                                                <span class="emphasis">(필수)</span>
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    </table>

                    <button type="submit" class="payment_btn">
                        <span id="totalPrice">
                        	<c:if test="${priceData.getSaleSum() >= 30000}">
                            <fmt:formatNumber value="${priceData.getSaleSum()}" />
                          </c:if>
                          <c:if test="${priceData.getSaleSum() < 30000}">
                            <fmt:formatNumber value="${priceData.getSaleSum() + 3000}" />
                          </c:if>
                        </span>
                        	원 결제하기
                    </button>
                    
                    <ul class="notice_order">
                        <li>직접 주문취소는 '입금확인' 상태일 경우에만 가능합니다.</li>
                        <li>미성년자가 결제 시 법정대리인이 그 거래를 취소할 수 있습니다.</li>
                        <li>상품 미배송 시, 결제수단으로 환불됩니다.</li>
                        <li>카카오페이, 차이, 토스, 네이버페이, 페이코 결제 시, 결제하신 수단으로만 환불됩니다.</li>
                    </ul>
                </div>
                <div class="price_info">
                    <div class="sticky_price">
                        <h2 class="section_title">결제금액</h2>
                        <div class="price_block">
                            <dl class="order_price first">
                                <dt class="head_title">주문금액</dt>
                                <dd class="prices">
                                    <span id="itemTotalPrice">
                                    	<fmt:formatNumber value="${priceData.getSaleSum() }" />
                                    </span>
                                    	원
                                </dd>
                            </dl>

                            <dl class="order_price sub">
                                <dt class="head_title">상품금액</dt>
                                <dd class="prices">
                                    <span id="productsPrice">
                                    	<fmt:formatNumber value="${priceData.getCostSum() }" />
                                    </span>
                                    	원
                                </dd>
                            </dl>

                            <dl class="order_price sub">
                                <dt class="head_title">상품할인금액</dt>
                                <dd class="prices saled_price">
                                    <span id="productsPrice">
                                    	<fmt:formatNumber value="${priceData.getDiscountSum() }" />
                                    </span>
                                    	원
                                </dd>
                            </dl>

                            <dl class="order_price">
                                <dt class="head_title">배송비</dt>
                                <dd class="prices">
                                	<c:if test="${priceData.getSaleSum() >= 30000}">
                                    <span id="productsPrice">0</span>
                                  </c:if>
                                  
                                  <c:if test="${priceData.getSaleSum() < 30000 }">
                                  	<span id="productsPrice">3,000</span>
                                  </c:if>
                                    	원
                                </dd>
                            </dl>

                            <dl class="order_price">
                                <dt class="head_title">적립금사용</dt>
                                <dd class="prices">
                                    <span id="productsPrice">0</span>
                                    	원
                                </dd>
                            </dl>

                            <dl class="order_price last">
                                <dt class="head_title">최종결제금액</dt>
                                <dd class="prices">
                                    <span id="productsPrice">
                                    <c:if test="${priceData.getSaleSum() >= 30000}">
                                    	<fmt:formatNumber value="${priceData.getSaleSum()}" />
                                    </c:if>
                                    <c:if test="${priceData.getSaleSum() < 30000}">
                                    	<fmt:formatNumber value="${priceData.getSaleSum() + 3000}" />
                                    </c:if>
                                    </span>
                                    	원
                                </dd>
                            </dl>

                            <p class="reserve">
                                <span id="accum">적립</span>
                                	구매 시
                                <span class="emphasis">
                                    <span class="reserve_point">
                                    	<fmt:formatNumber value="${priceData.getSaleSum() * 0.05}" />
                                    </span>
                                    	원
                                    <span class="ratio">(5%)</span>
                                </span>
                                	적립
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        
        <%-- 수령인 입력 modal 부분 --%>
	      <div class="to_order_modal">
		        <div class="modal_header">
		            <h2 class="modal_tit_header">배송정보입력</h2>
		        </div>
		
		        <div class="modal_input_block" id="first_block">
		            <h3 class="modal_input_title">
		                	받으실 분
		                <span class="star">*</span>
		            </h3>
		            <input type="text" id="to_name" name="to_name" placeholder="수령인 이름 입력" />
		        </div>
		
		        <div class="modal_input_block">
		            <h3 class="modal_input_title">
		                	휴대폰
		                <span class="star">*</span>
		            </h3>
		            <input type="text" id="to_phone" name="to_name" placeholder="휴대폰 번호 입력" />
		        </div>
		
		        <div class="modal_input_block">
		            <h3 class="modal_input_title">
		                	배송메시지
		            </h3>
		            <input type="text" id="to_message" name="to_name" placeholder="배송지 특이사항이 있을 경우 작성해주세요" />
		        </div>
		
		        <div class="modal_button_block">
		            <button type="button" class="btn_cancel">취소</button>
		            <button type="button" class="btn_save">저장</button>
		        </div>
	    	</div>
    </div>
    
    <jsp:include page="/include/footer.jsp"/>
<%--
</body>
</html>
 --%>
