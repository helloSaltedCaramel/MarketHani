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
		<title>마켓하니 :: 내일의 장보기 마켓하니</title>
		<link rel="icon" href="${pageContext.request.contextPath}/img/favicon/favicon-32x32.ico" type="image/x-icon" sizes="16x16">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cart.css">
</head>
<body>
		<jsp:include page="/include/header.jsp"/>
		
    <div class="container">
        <h2 id="title">장바구니</h2>
        <div class="inner_container">
            <div class="cart_item">
                <div class="select_items">
                    <label for="check_all">
                        <input id="check_all" type="checkbox" checked>
                        	전체선택(1/3)
                    </label>
                    <span class="bar">|</span>
                    <a id="delete_item" href="#">선택 삭제</a>
                </div>

                <div class="item_box">
                    <ul class="item_list">
                        <li> <!-- Item start -->
                            <div class="item">
                                <input class="check" type="checkbox" value="item_id">
                                <div class="name">
                                    <div class="inner_name">
                                        <a href="#" class="package">[푸글리제] 모짜렐라</a>
                                    </div>
                                </div>

                                <div class="goods">
                                    <a href="#" class="thumb_img">
                                        <img src="../img/1487213431670y0.jpg">
                                    </a>

                                    <div class="price_qty">
                                        <div class="price">
                                            <span>5,500
                                                <span>원</span>
                                            </span>
                                        </div>

                                        <div class="quantity">
                                            <button type="button" class="btn minus"></button>
                                            <input type="number" class="quantity_num" value="1" readonly>
                                            <button type="button" class="btn plus"></button>
                                        </div>
                                    </div>
                                </div>
                                <button class="delete_btn" type="button">상품삭제</button>
                            </div>
                        </li> <!-- Item end -->

                        <li> <!-- Item start -->
                            <div class="item">
                                <input class="check" type="checkbox" value="item_id">
                                <div class="name">
                                    <div class="inner_name">
                                        <a href="#" class="package">[블루보틀] 콜드브루 커피 236mL 3종</a>
                                    </div>
                                </div>

                                <div class="goods">
                                    <a href="#" class="thumb_img">
                                        <img src="../img/1636681893622y0.jpg">
                                    </a>

                                    <div class="price_qty">
                                        <div class="price">
                                            <span>6,300
                                                <span>원</span>
                                            </span>
                                        </div>

                                        <div class="quantity">
                                            <button type="button" class="btn minus"></button>
                                            <input type="number" class="quantity_num" value="1" readonly>
                                            <button type="button" class="btn plus"></button>
                                        </div>
                                    </div>
                                </div>
                                <button class="delete_btn" type="button">상품삭제</button>
                            </div>
                        </li> <!-- Item end -->

                        <li> <!-- Item start -->
                            <div class="item">
                                <input class="check" type="checkbox" value="item_id">
                                <div class="name">
                                    <div class="inner_name">
                                        <a href="#" class="package">[비바니] 유기농 초콜릿 7종</a>
                                    </div>
                                </div>

                                <div class="goods">
                                    <a href="#" class="thumb_img">
                                        <img src="../img/15094337717m0.jpg">
                                    </a>

                                    <div class="price_qty">
                                        <div class="price">
                                            <span>4,300
                                                <span>원</span>
                                            </span>
                                        </div>

                                        <div class="quantity">
                                            <button type="button" class="btn minus"></button>
                                            <input type="number" class="quantity_num" value="1" readonly>
                                            <button type="button" class="btn plus"></button>
                                        </div>
                                    </div>
                                </div>
                                <button class="delete_btn" type="button">상품삭제</button>
                            </div>
                        </li> <!-- Item end -->
                    </ul>
                </div>

                <div class="select_items">
                    <label for="check_all">
                        <input id="check_all" type="checkbox" checked>
                        	전체선택(1/3)
                    </label>
                    <span class="bar">|</span>
                    <a id="delete_item" href="#">선택 삭제</a>
                </div>
            </div>

            <div class="cart_result">
                <div class="inner_result">
                    <div class="delivery">
                        <h3 class="delivery_title">배송지</h3>

                        <div class="result_address">
                            <span class="emphasis">배송지를 입력</span>
                            	하고
                            <br>
                            	배송유형을 확인해 보세요!
                            <button class="btn_default" type="button"  onclick="getPostcode()">
                               	 주소 검색
                            </button>
                        </div>
                    </div>

                    <div class="price_result">
                        <dl class="price_index">
                            <dt class="index">상품금액</dt>
                            <dd class="price_block">
                                <span class="num">16,100</span>
                                <span class="won">원</span>
                            </dd>
                        </dl>

                        <dl class="price_index">
                            <dt class="index">상품할인금액</dt>
                            <dd class="price_block">
                                <span class="num">0</span>
                                <span class="won">원</span>
                            </dd>
                        </dl>

                        <dl class="price_index">
                            <dt class="index">배송비</dt>
                            <dd class="price_block">
                                <span class="num">3,000</span>
                                <span class="won">원</span>
                            </dd>
                        </dl>

                        <dl class="price_last">
                            <dt class="index">결제예정금액</dt>
                            <dd class="price_block">
                                <span class="num">19,100</span>
                                <span class="won">원</span>
                            </dd>
                        </dl>
                    </div>

                    <div class="submit_block">
                        <button class="submit_btn" onclick="location.href='<%=request.getContextPath() %>/user/user_order.jsp'">
                            	주문하기
                        </button>
                    </div>

                    <div class="notice_block">
                        <span class="notice_text">· '입금확인' 상태일 때는 주문 내역 상세에서 직접 주문취소가 가능합니다.</span>
                        <span class="notice_text">· '입금확인' 이후 상태에는 고객센터로 문의해주세요.</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <jsp:include page="/include/footer.jsp"/>

<%-- 
</body>
</html> 
--%>
