<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.p_name }상품상세페이지</title>

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
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<style>

/*공유하기 버튼 액션*/
#shareLayer {
	position: relative;
	display: none;
}

#shareLayer .layer_share {
	position: absolute;
	right: -25px;
	top: 39px;
	width: 278px;
	height: 164px;
   	background: url('./img/product/layer_share.png') no-repeat 0 0;
}

#shareLayer .list_share .btn img {
    float: left;
    width: 30px;
    height: 30px;
    margin-right: 8px;
} /*트윗 페이스북 아이콘 크기 조절*/

#shareLayer .list_share .txt {
    float: left;
    padding-top: 4px; /*글씨 위에서 아래로 좀 내려오기*/
    font-size: 12px;
    color: #000;
    line-height: 20px;
} /*페이스북 공유하기 글씨*/ 

#shareLayer .inner_layersns {
    overflow: hidden;
    width: 238px;
    height: 120px;
}
#shareLayer .list_share .btn_fb {
    left: 154px;
    top: 44px;
}/*페이스북 아이콘 조절*/

#shareLayer .list_share .btn_tw {
    left: 41px;
    top: 44px;
} /*트위터 아이콘 조절*/

#shareLayer .list_share .btn_url {
    overflow: hidden;
    position: absolute;
    left: 40px;
    top: 94px;
    width: 198px;
    height: 30px;
    clear: both;
} /*url 클릭 창*/

#shareLayer .list_share .inp {
    float: left;
    width: 114px;
    height: 30px;
    padding: 7px 0 6px 3px;
    border: 1px solid #f3f2f3;
    background-color: #f3f2f4;
    font-size: 11px;
    color: #666;
}/*url 클릭 창*/

#shareLayer .list_share .btn_copy {
    float: left;
    width: 84px;
    height: 30px;
    border: 1px solid #5f0080;
    font-size: 12px;
    color: #5f0080;
    line-height: 28px;
    text-align: center;
} /*링크복사 버튼 구현*/

#shareLayer .list_share .btn_copy.off img {
    display: none; 
} /*링크 복사 오른쪽 체크 표시*/
#shareLayer .list_share .btn_copy img {
     width: 10px; 
     height: 9px; 
     margin-left: 5px; 
}/*링크 복사 오른쪽 체크 표시*/

#shareLayer .list_share .btn {
    position: absolute;
    width: 113px;
} /*페이스북 위치 조절*/

.screen_out {
    overflow: hidden;
    position: absolute;
    width: 1px;
    height: 1px;
    clip: rect(0,0,0,0);
}
.screen_out {
    display: block;
    left: -9999px;
    font-size: 0;
    line-height: 0;
    text-indent: -9999px;
}
.section_view {
	width: 1050px;
	margin: 0 auto;
	padding-top: 20px;
	height: 655px;
	position: relative;
}


#body_product, #input_product, #select_product, #textarea_product,
	#button_product { /*태그 수정 내용*/
	line-height: 1;
	letter-spacing: -.05em;
	color: #4c4c4c;
	font-size: 12px;
	max-width: 100%;
	font-family: 'Noto Sans KR', sans-serif;
	width: 100%;
}

#ul_product li { /*태그 수정 내용*/
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	list-style-type: none;
	width: 262.5px;
} /*ul 태그 내용*/
*, *:after, *:before {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

#sectionView .goods_price .position:after {
	content: "";
	display: block;
	overflow: hidden;
	width: 100%;
	clear: both;
}

content {
	min-width: 1050px;
	border-bottom: 0;
}

#sectionView #btnShare { /*공유하기 버튼*/
	overflow: hidden;
	position: absolute;
	right: 0;
	top: 0;
	width: 40px;
	height: 90px;
	border: 0;
	background:
		url(https://res.kurly.com/mobile/service/goodsview/1910/ico_view_sns.png)
		no-repeat 50% 50%;
	font-size: 0;
	text-indent: -9999px;
	cursor: pointer;
}

#sectionView .goods_price .not_point, #sectionView .goods_price .not_login span,
	#sectionView .goods_price .not_login {
	display: block;
	padding-top: 7px;
	font-size: 14px;
	color: #5f0080;
	line-height: 20px;
	letter-spacing: 0;
}

#sectionView .goods_price .dc .won {
	padding: 0 7px 0 2px;
	font-weight: 700;
	font-size: 18px;
	line-height: 30px;
	vertical-align: 2px;
	letter-spacing: 0;
}

#sectionView .goods_name { /*[조공] 나 게살 좋아해 스틱*/
	float: right;
	width: 560px;
	padding: 10px 0 29px;
}

.section_view * {
	font-family: noto sans;
	color: #333;
	letter-spacing: -.5px;
}

#sectionView .goods_name .name {
	display: block;
	padding-right: 60px;
	font-weight: 700;
	font-size: 24px;
	line-height: 34px;
	word-break: break-all;
}

#sectionView .goods_name .short_desc {
	display: block;
	padding: 4px 60px 0 0;
	font-size: 14px;
	color: #999;
	line-height: 20px;
	word-break: break-all;
}

#sectionView .goods_price {
	float: right;
	width: 560px;
	padding: 0 20px 0 0;
}

#sectionView .goods_price .dc_price {
	font-weight: 700;
	font-size: 28px;
	line-height: 30px;
	letter-spacing: 0;
	word-break: break-all;
}

#sectionView .goods_info {
	float: right;
	width: 560px;
	margin-top: 19px;
	padding-bottom: 19px;
	border-top: 1px solid #f4f4f4;
}

#sectionView .goods_info .desc {
	overflow: hidden;
	font-size: 14px;
	line-height: 20px;
	word-break: break-all;
}

#sectionView .goods_info .tit {
	float: left;
	width: 150px;
	font-size: 14px;
	color: #666;
	line-height: 20px;
}

#sectionView .goods_info .list {
	overflow: hidden;
	padding: 18px 0;
	border-bottom: 1px solid #f4f4f4; /*회색 테이블 라인 그리기*/
}

#sectionView .goods_info .list.fst {
	padding-bottom: 0;
	border-bottom: 0; /*아래 실선 없애기*/
} /*판매단위 부분 영역 지정*/
#sectionView .goods_info .desc {
	overflow: hidden;
	font-size: 14px;
	line-height: 20px;
	word-break: break-all;
}

div, th, td, li, dt, dd, p {
	word-break: break-all; /* 문자 단위로 줄바꿈*/
}

#sectionView .thumb .bg {
	width: 430px;
	height: 552px;
}

#sectionView .thumb {
	float: left;
	/* background-color: #eee; */ /*타이틀 사진 밑에 회색 줄 제거*/
	background-position: 50% 50%;
	background-repeat: no-repeat;
	background-size: cover;
}

/*cartout 주문 가격 변동*/
#cartPut .cart_type2 {
	float: right;
	width: 560px;
	padding-bottom: 40px;
}

#cartPut .cart_type2 .view_function {
	display: block;
	float: left;
}

#cartPut * {
	font-family: noto sans;
	color: #333;
	letter-spacing: 0;
}

#cartPut .cart_type2 .list_goods {
	height: 53px;
	padding-bottom: 18px;
}

#cartPut .cart_type2 .list_nopackage .price, #cartPut .cart_type2 .list_nopackage .name,
	#cartPut .cart_type2 .list_nopackage .btn_position {
	display: none;
}

#cartPut .cart_option .list .btn_del {
	overflow: hidden;
	position: absolute;
	right: 0;
	top: -1px;
	width: 24px;
	height: 24px;
	border: 0;
	background:
		url(https://res.kurly.com/pc/ico/2010/ico_cartput_del_24x25.svg)
		no-repeat 50% 50%;
	background-size: 24px 25px;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
}

#cartPut .cart_type2 .list_nopackage .price, #cartPut .cart_type2 .list_nopackage .name,
	#cartPut .cart_type2 .list_nopackage .btn_position {
	display: none;
} /*선택 상품 화면에 안보이게 함*/
#cartPut .cart_type2 .list_nopackage .tit_item {
	float: left;
	width: 150px;
	font-weight: 400;
	font-size: 14px;
	color: #666;
	line-height: 20px;
	letter-spacing: -.5px;
} /*+- 버튼*/
#cartPut .cart_option .list .count {
	overflow: hidden;
	float: left;
	width: 88px;
	height: 30px;
	border: 1px solid #dddfe1;
	border-radius: 3px;
}

#cartPut .cart_option .list .down.on {
	background-image:
		url(https://res.kurly.com/pc/ico/2010/ico_minus_on.svg);
}

#cartPut .cart_option .list .down {
	background: #fff url(https://res.kurly.com/pc/ico/2010/ico_minus.svg)
		no-repeat 50% 50%;
	background-size: 30px 30px;
}

#cartPut .cart_option .list .btn {
	overflow: hidden;
	float: left;
	width: 28px;
	height: 28px;
	border: 0;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
} /*버튼 위치 구현*/
#cartPut .cart_option .list .inp {
	float: left;
	width: 30px;
	height: 30px;
	margin-right: -1px;
	padding: 0 0 4px;
	border: 0;
	background-color: #fff;
	font-size: 14px;
	color: #000;
	line-height: 18px;
	text-align: center;
} /*+버튼 바탕*/
#cartPut .cart_option .list .up.on {
	background-image: url(https://res.kurly.com/pc/ico/2010/ico_plus_on.svg);
}

#cartPut .cart_option .list .up {
	float: right;
	margin-left: -1px;
	background: #fff url(https://res.kurly.com/pc/ico/2010/ico_plus.svg)
		no-repeat 50% 50%;
	background-size: 30px 30px;
} /*투명 바탕의 +버튼 구현*/
#cartPut .cart_type2 .list .price {
	float: right;
	padding: 5px 4px 0;
	font-size: 12px;
	line-height: 20px;
	letter-spacing: -.6px;
} /*하단 금액*/
#cartPut .cart_type2 .list .dc_price {
	float: right;
}

#cartPut .cart_type2 .total {
	padding: 30px 0 14px;
	border-top: 1px solid #f4f4f4;
} /*총상품 금액 변화 업음*/
#cartPut .cart_option .total .price {
	overflow: hidden;
	text-align: right;
} /*총상품 금액 오른쪽으로 이동*/
#cartPut .cart_option .total .tit {
	font-weight: 700;
	font-size: 13px;
	line-height: 20px;
	vertical-align: 2px;
} /*총상품 금액 글씨 크기(한글)*/
#cartPut .cart_option .total .num {
	padding-left: 8px;
	font-weight: 800;
	font-size: 32px;
	line-height: 32px;
} /*총상품 금액 글씨 크기(숫자)*/
#cartPut .cart_option .total .won {
	padding-left: 2px;
	font-size: 20px;
	font-weight: 700;
	line-height: 20px;
	vertical-align: -1px;
}

#cartPut .cart_option .total .txt_point {
	display: block;
	padding-top: 14px;
	font-size: 14px;
	color: #666;
	line-height: 20px;
	text-align: right;
} /*적립 로그인 후, 적입혜택 제공 오른쪽으로 이동*/
#cartPut .cart_option .total .ico {
	display: inline-block;
	width: 38px;
	height: 20px;
	margin-right: 2px;
	border-radius: 10px;
	background-color: #ffbf00;
	font-weight: 700;
	font-size: 11px;
	color: #fff;
	line-height: 20px;
	text-align: center;
	vertical-align: 1px;
} /*노란색 적립 아이콘 버튼 */
#cartPut .cart_option .total .ico {
	display: inline-block;
	width: 38px;
	height: 20px;
	margin-right: 2px;
	border-radius: 10px; /*꼭지점 둥글게 */
	background-color: #ffbf00;
	font-weight: 700;
	font-size: 11px;
	color: #fff;
	line-height: 20px;
	text-align: center;
	vertical-align: 1px;
	float: none;
}

#cartPut .cart_option .view_function .btn_alarm {
	border: 1px solid #ddd;
	color: #ddd;
} /*재입고 버튼 테두리 */
#cartPut .cart_type2 .view_function {
	display: block;
	float: left;
} /*재입고 버튼 */
#cartPut .cart_option .view_function .btn {
	overflow: hidden;
	float: right;
	width: 138px;
	height: 56px;
	margin-right: 12px;
	padding-bottom: 2px;
	/* border: 1px solid #5f0080;  */ /*컬리 보라색*/
	border-radius: 3px;
	background: #fff;
	font-weight: 700;
	font-size: 16px;
	/* color: #5f0080; */
	line-height: 52px;
	letter-spacing: -.1px;
	text-align: center;
} /*재입고 버튼 크기 조절 */
#cartPut .cart_option .group_btn .btn_type1 {
	width: 408px;
	height: 56px;
	float: right; /*장바구니 버튼 오른쪽으로 이동*/
} /*장바구니 담기 버튼 위치 조절*/
.btn_type1 {
	border: 1px solid #5f0081;
	background-color: #5f0080;
} /*장바구니 담기 버튼 */
.btn_type1, .btn_type2 {
	display: block;
	overflow: hidden;
	width: 100%;
	height: 54px;
	border-radius: 3px;
	font-size: 0;
	text-align: center;
} /*버튼 구현 배경색*/
#cartPut .cart_option .group_btn .txt_type {
	display: block;
	width: 100%;
	height: 100%;
	padding-bottom: 2px;
	border: 0;
	background: 0 0;
	font-weight: 700;
	color: #fff;
	font-size: 16px;
	line-height: 52px;
	letter-spacing: -.1px;
	text-align: center;
} /*장바구니 담기 버튼 글씨체 */
#cartPut .cart_type1 {
	display: none;
	position: fixed;
	z-index: 200;
	left: 0;
	bottom: 0;
	width: 100%;
} /*하단 상품 선택 탭 구현*/
#cartPut .cart_type1 .in_option {
	left: 0;
	bottom: 70px;
	width: 100%;
}

#cartPut .cart_type1 .bar_open {
	display: block;
	position: relative;
	height: 22px;
	border-top: 2px solid #5f0080;
} /*하단 상품 선택 탭 구현*/
#cartPut .cart_result, #cartPut .cart_option.off, #cartPut .cart_option .tit_cart,
	#cartPut .cart_option .box_select, #cartPut .cart_option .bar_open {
	/*view_function 제거*/
	display: none;
} /*상품 담았을 때 뜨는 팝업 창 안보이게 하는 것*/
#cartPut .cart_type1 .btn_close {
	overflow: hidden;
	position: absolute;
	left: 50%;
	top: -50px;
	width: 170px;
	height: 48px;
	margin-left: 280px;
	border: 0;
	border-radius: 3px 3px 0 0;
	background-color: #5f0080;
	text-align: center;
}

#cartPut .cart_type1 .btn_close .ico {
	padding: 0 30px 0 7px;
	background:
		url(https://res.kurly.com/pc/service/goods/1910/ico_up_fff_24x24.png)
		no-repeat 100% -3px;
	font-size: 14px;
	color: #fff;
	line-height: 20px;
} /*하단 상품 선택 탭 구현*/
#cartPut .cart_type1 .group_btn.off {
	display: none;
}

#cartPut .cart_type1 .group_btn {
	width: 900px;
	margin: 0 auto;
	padding-bottom: 60px;
}

#cartPut .cart_option .group_btn {
	overflow: hidden;
	width: 100%;
}

#cartPut .notify_option {
	display: none;
	opacity: 0;
}

#cartPut .cart_type3 {
	position: fixed;
	z-index: 9999;
	left: 50%;
	top: 50%;
	width: 440px;
	max-height: 600px;
	margin-left: -220px;
	border-radius: 12px;
	background-color: #fff;
	-webkit-transform: translate(0, -50%);
	-ms-transform: translate(0, -50%);
	transform: translate(0, -50%);
} /*신청하기 버튼*/
#cartPut .cart_type2 .list_nopackage li {
	float: none;
	width: 100%;
	padding: 0 0 5px;
	margin: 0;
	border: 0;
}

/*상세 내역 시작*/
.layout-wrapper.goods-view-area {
	padding-right: 40px;
}

.layout-wrapper {
	position: relative;
	width: 1050px;
	height: 100%;
	margin: 0 auto;
}

.goods-view-infomation-tab-anchor {
	flex: 1;
	position: relative;
	top: 1px;
	height: 60px;
	line-height: 59px;
	text-align: center;
	display: block;
	color: #666;
	font-size: 16px;
	font-weight: 700;
	letter-spacing: -.3px;
	font-family: noto sans;
	background-color: #fafafa;
	border: 1px solid #eee;
	border-left: none;
} /*탭 버튼 */
#a_product { /*태그 수정 내용*/
	background-color: transparent;
	text-decoration: none;
	color: inherit;
} /*a 태그 밑줄 제거*/

.goods-view-infomation-tab-group{
	display: flex;
	flex-direction: row;
	width: 1010px;
	margin:0 auto;
	/*탭 고정 코드*/
	position: sticky;
	top: 42px; /*높이 지정*/
	/*탭 고정 코드*/
}

/*탭 위치 맞게 조정*/

/*게시글 수정 시작*/
#h2 {
	font-size: 13px;
	margin: 0;
} /*게시글 왼쪽으로 이동*/
.xans-product-additional table.xans-board-listheader th {
	padding: 25px 0 23px;
	vertical-align: middle;
	font-size: 12px;
}

.screen_out {
	display: block;
	overflow: hidden;
	position: absolute;
	left: -9999px;
	width: 1px;
	height: 1px;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
} /*회원등급 안보이게하는 것*/
.xans-product-additional .sort-wrap {
	position: relative;
}

.xans-product-additional .sort {
	position: absolute;
	bottom: 0;
	right: 0;
	padding: 10px;
	text-align: right;
} /*최근등록일 순 정리등 select 위치*/
.xans-product-additional .sort select {
	margin: 0 2px 0 0;
	border: 1px solid #bfbfbf;
	line-height: 34px;
	height: 34px;
	vertical-align: middle;
	padding-bottom: 5px;
} /*최근등록일 순 정리등 select */
.xans-product-additional table.xans-board-listheader {
	margin: 15px 0 0;
	color: #353535;
	font-size: 12px;
	line-height: 140%;
	table-layout: fixed;
}

.xans-board-listheader {
	border-top: 2px solid #522772;
	font-size: 13px;
	line-height: 140%;
}

colgroup {
	display: table-column-group;
}

tbody {
	display: table-row-group;
	vertical-align: middle;
	border-color: inherit;
} /*게시글 상단 이름*/
.goods-view-infomation-board {
	width: 100%;
} /*게시글 전체 틀*/
.list_type1.old .ico {
	float: left;
	width: 4px;
	height: 4px;
	margin: 7px 8px 0 0;
	background-color: #514859;
	vertical-align: 2px;
}

#pageTop { /*페이지 위로 올리는 버튼*/
	overflow: hidden;
	position: fixed;
	z-index: 300;
	right: 31px;
	bottom: 0;
	width: 58px;
	height: 58px;
	border: 0;
	background:
		url(https://res.kurly.com/pc/service/common/1903/btn_pagetop_v2.png)
		no-repeat 50% 50%;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
	opacity: 0;
	transition: background .5s;
}

#select_product {
	float: right;
}

#tr_product {
	padding: 25px 0 23px;
	vertical-align: middle;
	font-size: 12px;
}

#tr_product {
	padding: 20px 0;
	vertical-align: middle;
	font-size: 12px;
}

* {
	font-family: "Noto Sans KR", sans-serif;
} /*폰트 지정*/

.review_container {
	
	min-height: 850px;
}

iframe#inreview {
	
	width: 1010px;
	height: 734px;
}

</style>

<script type="text/javascript">

$(document).ready(function() {
	$('#tab_01').click(function(){
		var offset = $('#tab_01 scroll').offset();   //선택한 태그의 위치를 반환

		//animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 

        $('html').animate({scrollTop : offset.top}, 1000);

	});

});

$(document).ready(function() {
	$('#tab_02').click(function(){
		var offset = $('#tab_02 scroll').offset();   //선택한 태그의 위치를 반환

		//animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 

        $('html').animate({scrollTop : offset.top}, 1000);

		
		
	});

});

$(document).ready(function() {
	$('#tab_03').click(function(){
		var offset = $('#tab_03 scroll').offset();   //선택한 태그의 위치를 반환

		//animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 

        $('html').animate({scrollTop : offset.top}, 1000);

		
		
	});

});

$(document).ready(function() {
	$('#tab_04').click(function(){
		var offset = $('#tab_04 scroll').offset();   //선택한 태그의 위치를 반환

		//animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 

        $('html').animate({scrollTop : offset.top}, 1000);

	});

});

function onDisplay(){
	
	$('#shareLayer').toggle();
	
} // 공유하기 버튼 클릭시 토글


function expandQna(num){
	
	$('.expand_div#' + num).toggle();
	
} // QnA 게시판 제목 클릭시 질문과 답변 토글

function showSecret(){
	
	$('.modal_overlay').show();
	$('.modal_dialog.warning').show();
	$('body').addClass('modal_body');
}/* "비밀글입니다" 메시지 보여주기 */

function hideSecret() {
	
	$('.modal_overlay').hide();
	$('.modal_dialog.warning').hide();
	$('body').removeClass('modal_body');
}/* "비밀글입니다" 메시지 감추기 */

function showWrite() {
	
	$('.modal_overlay').show();
	$('.modal_dialog_qna.write').show();
	$('body').addClass('modal_body');
}/* 질문작성창 보여주기 */

function hideWrite() {
	
	$('.modal_overlay').hide();
	$('.modal_dialog_qna.write').hide();
	$('body').removeClass('modal_body');
}/* 질문작성창 감추기 */

function hideWriteConfirm() {
	
	$('.modal_overlay').hide();
	$('.modal_dialog.confirm').hide();
	$('body').removeClass('modal_body');
}/* 작성완료 창 감추기 */

function showWriteFailure() {
	
	$('.modal_overlay').show();
	$('.modal_dialog.failure').show();
	$('body').addClass('modal_body');
}/* 작성실패창 보여주기 */

function hideWriteFailure() {
	
	$('.modal_overlay').hide();
	$('.modal_dialog.failure').hide();
	$('body').removeClass('modal_body');
}/* 작성실패 창 감추기 */

function showWriteConfirm() {
	
	$('.modal_overlay').show();
	$('.modal_dialog.confirm').show();
	$('body').addClass('modal_body');
	
}/* 작성완료 창 보여주기 */

function reloadQnA() {
	
	window.location.reload();
	
}/* QnA 테이블 새로고침 */

function showDelete() {
	
	$('.modal_overlay').show();
	$('.modal_dialog.delete').show();
	$('body').addClass('modal_body');
		
}/* 질문삭제 창 보여주기  */

function hideDelete() {
	
	$('.modal_overlay').hide();
	$('.modal_dialog.delete').hide();
	$('body').removeClass('modal_body');
		
}/* 질문삭제 창 감추기  */

function showDeleteConfirm(){
	$('.modal_overlay').show();
	$('.modal_dialog.delete_confirm').show();
	$('body').addClass('modal_body');
}/* 삭제확인 창 보여주기 */

function hideDeleteConfirm(){
	$('.modal_overlay').hide();
	$('.modal_dialog.delete_confirm').hide();
	$('body').removeClass('modal_body');
}/* 삭제확인 창 감추기 */

function showRevise(qna_num, qna_title, qna_content) {
	
	//받아온 각 데이터를 수정 폼에 전달
	$('.qna_revise_title').attr('value', qna_title);
	$('.qna_revise_content').append(qna_content);
	$('.modal_dialog_qna.revise').children('form').append('<input type="hidden" name="qna_num" value="' + qna_num + '">')
	
	//모달 보여주기
	$('.modal_overlay').show();
	$('.modal_dialog_qna.revise').show();
	$('body').addClass('modal_body');
		
}/* 질문수정 창 보여주기  */

function hideRevise() {
	
	$('.modal_overlay').hide();
	$('.modal_dialog_qna.revise').hide();
	$('body').removeClass('modal_body');
		
}/* 질문수정 창 감추기  */

function showReviseConfirm() {
	
	$('.modal_overlay').show();
	$('.modal_dialog.revise_confirm').show();
	$('body').addClass('modal_body');
}/* 질문수정완료 창 보여주기  */

function hideReviseConfirm() {
	
	$('.modal_overlay').hide();
	$('.modal_dialog.revise_confirm').hide();
	$('body').removeClass('modal_body');
}/* 질문수정완료 창 감추기  */

</script>

</head>

<body>

	<jsp:include page="../include/header.jsp" />

	<div id="body_product">
	
	<br>
		<c:set var="dto" value="${productCont }" />
		
		<c:if test="${!empty dto }">
	
		<div id="main">
			<div id="content" style="opacity: 1;">
				<div class="section_view">

					<div id="shareLayer">
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
		</c:if>
		
		<%-- 페이지 위로 올리는 버튼  --%>
		<a href="#top" id="pageTop" class="on"
			style="opacity: 1; bottom: 25px;">맨 위로가기</a>
	
			<%-- 상단 탭  --%>
		
			<ul id="ul_product" class="goods-view-infomation-tab-group">

				<li id="tab_01"><a href="#tab_01"
					class="goods-view-infomation-tab-anchor __active">상품설명</a></li>

				<li id="tab_02"><a href="#tab_02"
					class="goods-view-infomation-tab-anchor __active">상세정보</a></li>

				<li id="tab_03"><a href="#tab_03"
					class="goods-view-infomation-tab-anchor __active">후기</a></li>

				<li id="tab_04"><a href="#tab_04"
					class="goods-view-infomation-tab-anchor __active">문의</a></li>
			</ul>
	
		
		<div id="contents_top" align="center">	
		
			<%-- 상품설명 이미지  --%>
			<div id="tab_01 scroll">
					<img
						src="<%=request.getContextPath() %>/img/product/${dto.getP_contents()}"
						align="center" width="1010px" height="100%"> 
			</div> <%-- tab_01 scroll end --%>		
		
			<%-- 상세정보 이미지  --%>
			<div id="tab_02 scroll">		
					<img
						src="<%=request.getContextPath() %>/img/product/${dto.getP_contents_spec()}"
						align="center" width="1010px" height="100%"> <br> <br>
					<br> <br> <br> <br> <br>
		
			</div> <%-- tab_02 scroll end --%>
		
			<%-- 상품 후기 게시판  --%>
			<div id="tab_03 scroll">	
				<div class="review_container">
				
					<iframe id="inreview"
						src="<%=request.getContextPath()%>/user_product_review_list.do"
						frameborder="0" class="goods-view-infomation-board">
						
						<%-- 여기있던 내용 전부 삭제함 --%>
						
					</iframe>
				</div>
			</div> <%-- tab_03 scroll end --%>
	
		<%-- 상품 문의 게시판  --%>
		<div id="tab_04 scroll">	
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
						
						
						<%-- QnA 공지부분 --%>
						<ul class="qna_notice_list">
							<li class="qna_notice_item">
								<div class="notice-cell">
									<span>공지</span>
									<strong>판매 (일시)중단 제품 안내 (21-11-12 업데이트)</strong>
								</div>
								<div class="item-cell"><p>Marketkurly</p></div>
								<div class="item-cell"><p>2021-11-18</p></div>
								<div class="item-cell"><p>-</p></div>
							</li>
						</ul>
						
						<%-- QnA 내용부분 --%>
						<c:set var="list" value="${List }"/>
						
						<ul class="qna_content_list">
						
						<c:if test="${empty list }">
							<li><strong>등록된 문의가 없습니다</strong></li>
						</c:if>
						
						<c:if test="${!empty list }">
						
							<c:forEach items="${list }" var="q_dto" varStatus="status">
								<li class="qna_content_item">
								
									<c:if test="${q_dto.getQna_secret() == 1}"> <%-- 비밀 글 : 제목 클릭 시 모달 함수 호출("비밀글입니다") --%>
										<div class="content-cell secret" onclick="showSecret();">	
											<strong id="secret_title"><font color="#b5b5b5">
												비밀글입니다.&nbsp;&nbsp;<img src="<%=request.getContextPath() %>/img/product/qna_secret.svg">
											</font></strong>
										</div>
									</c:if>
									
									<c:if test="${q_dto.getQna_secret() != 1}"> <%-- 일반 글 : 제목 클릭 시 토글 함수 호출--%>
										<div class="content-cell" onclick="expandQna(${status.count });">	
											<strong id="question_title">${q_dto.getQna_title() }</strong>
										</div>
									</c:if>											
								
									
									<div class="item-cell"><p>${q_dto.getUser_id() }</p></div>
									<div class="item-cell"><p>${q_dto.getQna_date() }</p></div>
									<div class="item-cell">
										<p>
										<c:if test="${q_dto.getQna_status() == 1}">
											<font color="#5f0081">답변완료</font>	
										</c:if>
										<c:if test="${q_dto.getQna_status() != 1}">
											답변대기
										</c:if>
										</p>
									</div>
								</li>
								
								<div class="expand_div" id="${status.count }">	<%-- 토글 함수에 들어가는 id값 설정하기 위한 div --%>
									
									<c:if test="${q_dto.getQna_secret() != 1}">	<%-- 비밀글이 아닐 때에만 로딩 --%>
									
										<%-- 클릭 시 확장될 질문영역 --%>
										<c:if test="${!empty q_dto.getQna_content()}">
											<li class="qna_content_item expand">		
												<div class="content-cell expand">
													<span><img class="qna_mark" src="<%=request.getContextPath() %>/img/product/qna_question_mark.svg"></span>
													<span><strong>${q_dto.getQna_content() }</strong></span>
													<div class="item-cell update">
														<p>
															<a onclick="showRevise(${q_dto.getQna_num() }, '${q_dto.getQna_title() }', 
																				   '${q_dto.getQna_content() }');">수정</a>&nbsp;&nbsp;&nbsp;
															<a onclick="if(confirm('작성한 문의를 삭제하시겠습니까?')){
																			location.href='user_qna_delete.do?qna_num=${q_dto.getQna_num() }';
																			showDeleteConfirm();
																	   }else{return; };">삭제</a>
														</p>
													</div>
												</div>									
											</li>
										</c:if>
										
										<%-- 클릭 시 확장될 답변영역 --%>
										<c:if test="${!empty q_dto.getQna_answer()}">
											<li class="qna_content_item expand">
												<div class="content-cell expand">
													<span><img class="qna_mark" src="<%=request.getContextPath() %>/img/product/qna_answer_mark.svg"></span>
													<span><strong>${q_dto.getQna_answer() }</strong></span>
												</div>
											</li>
										</c:if>
										
									</c:if>
								</div>
							</c:forEach>	
						</c:if>
						
						</ul>
						
						<%-- 문의하기, 페이지 이동 버튼 --%>
						<div class="qna_button_area">
							<div class="qna_paging_nav">
								<button type="button" class="prev"><span></span></button>
								<button type="button" class="next"><span></span></button>
							</div>
							<button class="qna_write_btn" onclick="showWrite();">
								<span>문의하기</span>
							</button>
						</div>
					</div> <%-- .qna_content end --%>
				</div>	<%-- .qna_container end --%>	
			</div> <%-- #tab_04 scroll --%>
		</div> <%-- .contents_top --%>
	</div> <%-- #body_product end --%>
	
		
	<%-- 모달 오버레이(공용) --%>
	<div class="modal_overlay">
	</div>
	
	<%-- 모달: "비밀글입니다" 경고창 --%>
	<div class="modal_dialog warning">
		<p>비밀글입니다</p>
		<button class="modal_button" onclick="hideSecret();"><strong>확인</strong></button> <%-- 확인버튼 클릭 시 모달함수 호출 --%>
	</div>
	
	<%-- 모달: 작성 완료 메시지 --%>
	<div class="modal_dialog confirm">
		<p>문의가 정상적으로 등록되었습니다.</p>
		<button class="modal_button" onclick="hideWriteConfirm(); location.reload();"><strong>확인</strong></button> <%-- 확인버튼 클릭 시 모달함수 호출 --%>
	</div>
	
	<%-- 모달: 작성 실패 메시지 --%>
	<div class="modal_dialog failure">
		<p>문의 등록에 실패하였습니다</p>
		<button class="modal_button" onclick="hideWriteFailure();"><strong>확인</strong></button> <%-- 확인버튼 클릭 시 모달함수 호출 --%>
	</div>
	
	<%-- 모달: "작성한 문의를 삭제하시겠습니까?"  --%>
	<div class="modal_dialog delete">
		<p>작성한 문의를 삭제하시겠습니까?</p>
		<button class="modal_button delete1" onclick="hideDelete();"><strong>취소</strong></button>
		<button class="modal_button delete2" onclick=""><strong>확인</strong></button> <%-- 확인버튼 클릭 시 모달함수 호출 --%>
	</div>
	
	<%-- 모달: 삭제 완료 메시지 --%>
	<div class="modal_dialog delete_confirm">
		<p>삭제되었습니다</p>
		<button class="modal_button" onclick="hideDeleteConfirm(); location.reload();"><strong>확인</strong></button> <%-- 확인버튼 클릭 시 모달함수 호출 --%>
	</div>
	
	<%-- 모달: 수정 완료 메시지 --%>
	<div class="modal_dialog revise_confirm">
		<p>수정이 완료되었습니다</p>
		<button class="modal_button" onclick="hideReviseConfirm(); location.reload();"><strong>확인</strong></button> <%-- 확인버튼 클릭 시 모달함수 호출 --%>
	</div>
	
	<%-- 문의하기 버튼 클릭 시 모달로 띄워줄 질문 작성창 --%>
	<div class="modal_dialog_qna write">
		<form action="user_qna_write.do" method="post">	<%-- 작성시 write_qna.do로 맵핑 --%>
			
			<input type="hidden" value="${dto.getP_num() }" name="p_num">	<%-- 제품번호 : p_num --%>
			<input type="hidden" value="test_user" name="user_id"> <%-- 세션에서 user_id 갖고와야함 --%>
			
			<table class="modal_qna_write">
				<tr class="modal_qna_title" height="53px">
					<td colspan="2">
						<strong>상품 문의하기</strong>
						<img src="<%=request.getContextPath() %>/img/product/qna_close.svg" onclick="hideWrite();"> <%-- 상단 우측 'X' 버튼 --%>
					</td>
				</tr>
				<tr class="modal_qna_header" height="90px">
					<td width="100px">
						<div class="modal_qna_image">
							<img width="72px" height="72px" src="<%=request.getContextPath() %>/img/product/${dto.getP_image()}">
						</div>
					</td>
					<td><strong>[${dto.p_seller}]${dto.p_name }</strong></td>
				</tr>
				<tr class="modal_write_title" height="50px">
					<td width="100px">제목</td>
					<td><input name="qna_title"></td>	<%-- 제목 : qna_title --%>
				</tr>
				<tr class="modal_write_content" height="260px">
					<td width="100px" rowspan="2">내용</td>					<%-- 내용 : qna_content --%>
					<td><textarea maxlength="5000" name="qna_content"></textarea></td>
				</tr>
				<tr class="modal_write_secret" height="25px">
					<td>
						<label onclick="alert('test');">
							<input class="secret_check" type="checkbox" name="is_secret"> <%-- 비밀글여부 : is_secret --%>
							<span class="secret_check_ico"> </span>
							<span>비밀글로 문의하기</span>
						</label>
					</td>
				</tr>
				<tr class="modal_write_button" height="77px" align="center">
					<td colspan="2">
						<button onclick="hideWrite();">취소</button>
						<button onclick="hideWrite(); showWriteConfirm();" type="submit">등록</button>
					</td>
				</tr>
			</table>
		</form>				
	</div><%-- .modal_dialog qna_write end --%>	
	
	<%-- 수정하기 버튼 클릭 시 모달로 띄워줄 작성창 --%>
	<div class="modal_dialog_qna revise">
		
		<form action="user_qna_revise.do" method="post">	<%-- 작성시 revise_qna.do로 맵핑 --%>
			
			<input type="hidden" value="${dto.getP_num() }" name="p_num">	<%-- 제품번호 : p_num --%>
			<input type="hidden" value="test_user" name="user_id"> <%-- 세션에서 user_id 갖고와야함 --%>
			
			<table class="modal_qna_write">
				<tr class="modal_qna_title" height="53px">
					<td colspan="2">
						<strong>문의내용 수정</strong>
						<img src="<%=request.getContextPath() %>/img/product/qna_close.svg" onclick="hideRevise();"> <%-- 상단 우측 'X' 버튼 --%>
					</td>
				</tr>
				<tr class="modal_qna_header" height="90px">
					<td width="100px">
						<div class="modal_qna_image">
							<img width="72px" height="72px" src="<%=request.getContextPath() %>/img/product/${dto.getP_image()}">
						</div>
					</td>
					<td><strong>[${dto.p_seller}]${dto.p_name }</strong></td>
				</tr>
				<tr class="modal_write_title" height="50px">
					<td width="100px">제목</td>
					<td><input class="qna_revise_title" name="qna_title" value=""></td>	<%-- 제목 : qna_title --%>
				</tr>
				<tr class="modal_write_content" height="260px">
					<td width="100px" rowspan="2">내용</td>					<%-- 내용 : qna_content --%>
					<td><textarea class="qna_revise_content" maxlength="5000" name="qna_content"></textarea></td>
				</tr>
				<tr class="modal_write_secret" height="25px">
					<td>
						<label onclick="alert('test');">
							<input class="secret_check" type="checkbox" name="is_secret"> <%-- 비밀글여부 : is_secret --%>
							<span class="secret_check_ico"> </span>
							<span>비밀글로 문의하기</span>
						</label>
					</td>
				</tr>
				<tr class="modal_write_button" height="77px" align="center">
					<td colspan="2">
						<button onclick="hideRevise();">취소</button>
						<button onclick="hideRevise(); showReviseConfirm();" type="submit">등록</button>
					</td>
				</tr>
			</table>
		</form>				
	</div><%-- modal_dialog_qna revise end --%>
		
	
	<jsp:include page="../include/footer.jsp" />

<%-- </body>
</html> --%>