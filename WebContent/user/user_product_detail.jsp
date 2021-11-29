<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

<%-- import header.css --%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/header.css" />
<link rel="icon"
	href="<%=request.getContextPath()%>/img/favicon/favicon-32x32.ico"
	type="image/x-icon" sizes="16x16">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script defer src="<%=request.getContextPath()%>/js/header/header.js"></script>
<script defer
	src="<%=request.getContextPath()%>/js/header/location_postcode.js"></script>

<%-- include product_qna.css --%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/product_qna.css" />

<%-- import footer.css --%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/footer.css" />




<%-- import eventMain.css --%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/product_detail.css">

<script type="text/javascript">


	function onDisplay() {

		$('#shareLayer').toggle();

	}; // 공유하기 버튼 클릭시 보이고 안보이고
	
	 //링크 클릭시 헤당 섹션으로 부드럽게 이동시키기
	  $(document).on('click','#ul_product a',function(event){
	  var headerHeight = $('header').outerHeight();
	  event.preventDefault();
	  	$("html,body").animate({
	    	scrollTop : $(this.hash).offset().top - headerHeight
	    },800)
	 
	});
	
</script>

</head>

<body>

	<jsp:include page="../include/header.jsp" />

	<div id="body_product">
	
	<br>
		<c:set var="dto" value="${productCont }" />
		<c:if test="${!empty dto }">
		<title>[${dto.p_seller }]${dto.p_name }상품상세페이지</title>
		<div id="main">
			<div id="content" style="opacity: 1;">
				<div class="section_view">

					<div id="shareLayer" >
						<div class="layer_share">
							<div class="inner_layersns">
								<h3 class="screen_out">SNS 공유하기</h3>
								<ul class="list_share">
									<li><a class="btn btn_fb" data-sns-name="페이스북"
										data-sns="facebook" href="#none"><img
											src="./img/product/ico_facebook.jpg"
											alt="페이스북"><span class="txt">공유하기</span></a></li>
									<li><a class="btn btn_tw" data-sns-name="트위터"
										data-sns="twitter" href="#none"><img
											src="./img/product/ico_twitter.jpg"
											alt="트위터"><span class="txt">트윗하기</span></a></li>
									<li class="btn_url">
									<input type="text" class="inp"
										value="http://localhost:8282/MarketHani/user_product_view.do?p_num=2" readonly="readonly"> 
										
										<a class="btn_copy off" data-sns-name="링크 복사" data-sns="copy" href="#none" >URL 복사<img
											src="./img/product/ico_checked_x2.jpg" alt=""></a></li>
								</ul>
							</div>
						</div>

					</div>
					
					<div id="sectionView">
						<div class="inner_view">
						
							<div class="thumb">
								<img
									src="<%=request.getContextPath() %>/img/product/${dto.getP_image()}"
									class="bg">
							</div>

							<p class="goods_name">
								<span class="btn_share">
									<button id="btnShare" onclick="onDisplay();">공유하기</button>
								</span> <strong class="name">[${dto.p_seller}]${dto.p_name }</strong> <span
									class="short_desc">특별한 기회로 만나보는 홍게 간식</span>
							</p>

							<p class="goods_price">
								<span class="position"> <span class="dc"> <span
										class="dc_price"><fmt:formatNumber type="number"
												value="${dto.p_price }" /><span class="won">원</span> </span> <%-- 숫자 3자리 수마다 콤마 금액--%>
								</span> <%-- --%>

								</span>
								<%--  --%>
								<span class="not_login"> <%-- --%> <span>로그인 후,
										적립혜택이 제공됩니다.</span>
								</span>
							</p>
							<%-- --%>
							<div class="goods_info">
								<dl class="list fst">
									<dt class="tit">판매단위</dt>
									<dd class="desc">1팩</dd>
								</dl>

								<dl class="list">
									<dt class="tit">배송구분</dt>
									<%-- --%>
									<dd class="desc">샛별배송/택배배송</dd>
								</dl>
								<%-- --%>
								<dl class="list">
									<dt class="tit">포장타입</dt>
									<dd class="desc">
										상온/종이포장 <br> <strong class="emph">택배배송은 에코포장이
											스티로폼으로 대체됩니다.</strong>
									</dd>
								</dl>
								<%-- --%>
							</div>
							<%-- --%>
						</div>
						<%-- --%>
					</div>

					<%--cart_put --%>
					<div id="cartPut">
						<div class="cart_option cartList cart_type2">
							<div class="inner_option">
								<!---->
								<!---->
								<div class="in_option">
									<div class="list_goods">
										<!---->
										<!---->
										<!---->
										<ul id="ul_product" class="list list_nopackage">
											<li class="on"><span class="btn_position">
													<button id="button_product" type="button" class="btn_del">
														<span class="txt">삭제하기</span>
													</button>
											</span> <span class="name"> <!----> [조공] 나 게살 좋아해 스틱 <!---->
											</span> <span class="tit_item">구매수량</span>
												<div class="option">
													<span class="count">
														<button id="button_product" type="button"
															class="btn down on">수량내리기</button> <input
														id="input_product" type="number" readonly="readonly"
														onfocus="this.blur()" value="1" class="inp">
														<button id="button_product" type="button"
															class="btn up on">수량올리기</button>
													</span> <span class="price"> <!----> <span class="dc_price">2,900원</span>
													</span>
												</div></li>
										</ul>
									</div>
									<div class="total">
										<div class="price">
											<!---->
											<strong class="tit">총 상품금액 :</strong> <span class="sum">
												<span class="num">2,900</span> <span class="won">원</span>
											</span>
										</div>
										<p class="txt_point">
											<span class="ico">적립</span> <span class="no_login"> <!---->
												<span>로그인 후, 적립혜택 제공</span>
											</span>
											<!---->
										</p>
									</div>
								</div>
								<div class="group_btn off">
									<div class="view_function">
										<button id="button_product" type="button"
											class="btn btn_alarm">재입고 알림</button>
									</div>
									<span class="btn_type1">
										<button id="button_product" type="button" class="txt_type"
											onclick="alert('장바구니에 담겼습니다')">장바구니 담기</button> <!---->
									</span>
									<!---->
									<!---->
									<!---->
									<!---->
									<!---->
									<!---->
								</div>
								<!---->
							</div>
						</div>
						<div class="cart_option cartList cart_type1">
							<div class="inner_option">
								<!---->
								<!---->
								<div class="in_option">
									<div class="list_goods">
										<div class="bar_open">
											<button id="button_product" type="button" class="btn_close">
												<span class="ico">상품 선택</span>
											</button>
										</div>
										<!---->
										<!---->
										<!---->
									</div>
									<!---->
								</div>
								<div class="group_btn off">
									<div class="view_function">
										<button id="button_product" type="button"
											class="btn btn_alarm">재입고 알림</button>
									</div>
									<span class="btn_type1"><button id="button_product"
											type="button" class="txt_type">장바구니 담기</button> <!----> </span>
									<!---->
									<!---->
									<!---->
									<!---->
									<!---->
									<!---->
								</div>
								<!---->
							</div>
						</div>
						<div class="cart_option cart_type3 notify_option">
							<div class="inner_option">
								<strong class="tit">재입고 알림 신청</strong>
								<p class="name_deal">[조공] 나 게살 좋아해 스틱</p>
								<!---->
								<!---->
								<p class="notice">
									<span class="ico">·</span> 상품이 입고되면 앱 푸시 또는 알림톡으로 알려 드립니다.
								</p>
								<div class="group_btn layer_btn2">
									<span class="btn_type2">
										<button id="button_product" type="button" class="txt_type">취소</button>
									</span> <span class="btn_type1">
										<button id="button_product" type="button" class="txt_type">신청하기</button>
									</span>
								</div>
							</div>
						</div>
						<div class="cart_option cart_result cart_type3">
							<div class="inner_option">
								<button id="button_product" type="button" class="btn_close1">pc레이어닫기</button>
								<p class="success">
									상품 구매를 위한 <span class="bar"></span> 배송지를 설정해주세요
								</p>
								<div class="group_btn layer_btn2">
									<span class="btn_type2">
										<button id="button_product" type="button" class="txt_type">취소</button>
									</span> <span class="btn_type1">
										<button id="button_product" type="button" class="txt_type">
											<span class="ico_search"></span> 주소 검색
										</button>
									</span>
								</div>
							</div>
						</div>
						<form name="frmBuyNow" method="post"
							action="/shop/order/order.php">
							<input id="input_product" type="hidden" name="mode"
								value="addItem"> <input id="input_product" type="hidden"
								name="goodsno" value="">
						</form>
						<form name="frmWishlist" method="post"></form>
					</div>


				</div>
			</div>
		</div> <%-- div.main end --%>
	
		<%-- 페이지 위로 올리는 버튼  --%>
		<a href="#top" id="pageTop" class="on"
			style="opacity: 1; bottom: 25px;">맨 위로가기</a>
	
			<%-- 상단 탭  --%>
		
			<ul id="ul_product" class="goods-view-infomation-tab-group">

				<li id="tab_01"><a href="#content1"
					class="goods-view-infomation-tab-anchor __active">상품설명</a></li>

				<li id="tab_02"><a href="#content2"
					class="goods-view-infomation-tab-anchor __active">상세정보</a></li>

				<li id="tab_03"><a href="#content3"
					class="goods-view-infomation-tab-anchor __active">후기</a></li>

				<li id="tab_05"><a href="#content4"
					class="goods-view-infomation-tab-anchor __active">문의</a></li>
			</ul>
	
		
		<div id="contents_top" align="center">	
		
			<%-- 상품설명 이미지  --%>
			<div id="content1">
					<img
						src="<%=request.getContextPath() %>/img/product/${dto.getP_contents()}"
						align="center" width="1010px" height="100%"> 
			</div> <%-- tab_01 scroll end --%>		
		
			<%-- 상세정보 이미지  --%>
			<div id="content2">		
					<img
						src="<%=request.getContextPath() %>/img/product/${dto.getP_contents_spec()}"
						align="center" width="1010px" height="100%"> <br> <br>
					<br> <br> <br> <br> <br>
		
			</div> <%-- tab_02 scroll end --%>
		
			<%-- 상품 후기 게시판  --%>
			<div id="content3">	
				<div class="review_container">
				
					<iframe id="inreview"
						src="<%=request.getContextPath()%>/user_product_review_list.do"
						frameborder="0" class="goods-view-infomation-board">
						
						<%-- 여기있던 내용 전부 삭제함 --%>
						
					</iframe>
				</div>
			</div> <%-- tab_03 scroll end --%>
	
		<%-- 상품 문의 게시판  --%>
		<div id="content4">	
			<div class="qna_container">
					<div class="qna_header" align="left">
						<strong>PRODUCT Q&A</strong>
						<ul>
							<li>상품에 대한 문의를 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
							<li>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 <a>1:1문의</a>에 남겨주세요.</li>
						</ul>
					</div>
					
					<div class="qna_content">
						<div class="qna_content_title">
							<div style="width: 710px;">제목</div>
							<div>작성자</div>
							<div>작성일</div>
							<div>답변상태</div>
						</div>
						
						<%-- 비밀글 여부 표시 필요 : isSecret() 기능 필요 --%>
						<ul class="qna_notice_list">
							<li class="qna_notice_item">
								<div class="notice-cell">
									<span>공지</span>
									<strong>판매 (일시)중단 제품 안내 (21.11.12 업데이트)</strong>
								</div>
								<div class="item-cell"><p>Marketkurly</p></div>
								<div class="item-cell"><p>2021.11.18</p></div>
								<div class="item-cell"><p>-</p></div>
							</li>
						</ul>
						
						<ul class="qna_content_list">
							<li class="qna_content_item">
								<div class="content-cell">
									<strong>부스러기가 너무 많아요</strong>
								</div>
								<div class="item-cell"><p>김*현</p></div>
								<div class="item-cell"><p>2021.11.19</p></div>
								<div class="item-cell"><p>답변대기</p></div>
							</li>
							
							<li class="qna_content_item">
								<div class="content-cell">
									<strong>언제 생산된 제품인 지 알 수 있나요?</strong>
								</div>
								<div class="item-cell"><p>이*욱</p></div>
								<div class="item-cell"><p>2021.11.18</p></div>
								<div class="item-cell"><p>답변대기</p></div>
							</li>
							
							<li class="qna_content_item">
								<div class="content-cell">
									<strong>배송 일정 문의드립니다</strong>
								</div>
								<div class="item-cell"><p>박*신</p></div>
								<div class="item-cell"><p>2021.11.18</p></div>
								<div class="item-cell"><p>답변대기</p></div>
							</li>
							
							<li class="qna_content_item">
								<div class="content-cell">
									<strong>재입고 문의</strong>
								</div>
								<div class="item-cell"><p>김*수</p></div>
								<div class="item-cell"><p>2021.11.16</p></div>
								<div class="item-cell"><p>답변대기</p></div>
							</li>
						</ul>
						
						<%-- Q&A 버튼의 활성화 유무 표시 필요함: 리뷰작성 가능 여부 판별 기능) --%>
						<div class="qna_button_area">
							<div class="qna_paging_nav">
								<button type="button" class="prev"><span></span></button>
								<button type="button" class="next"><span></span></button>
							</div>
							<button class="qna_write_btn">
								<span>문의하기</span>
							</button>
						</div>
					</div>
				</div>		
			</div>
		</div>
	</div>
		
	</c:if>
	</div>

	<jsp:include page="../include/footer.jsp" />

<%-- </body>
</html> --%>