<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">	
<title>메인 화면</title>

<%-- import main.css --%>
<link rel="stylesheet" type="text/css" href="css/main.css"/>

<%-- import header.css --%>
<link rel="stylesheet" type="text/css" href="css/header.css"/>
<link rel="icon" href="<%=request.getContextPath() %>/img/favicon/favicon-32x32.ico" type="image/x-icon" sizes="16x16">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script defer src="<%=request.getContextPath() %>/js/header/header.js"></script>
<script defer src="<%=request.getContextPath() %>/js/header/location_postcode.js"></script>

<%-- import footer.css --%>
<link rel="stylesheet" type="text/css" href="css/footer.css"/>

<!-- jQuery library (served from Google) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />

<style>
    .bx-wrapper {border:0;background:#fbfbfb;box-shadow:none;}
    

.main_type1 .bx-controls-direction .bx-prev {
    background: url(./img/main/ico_prev1_x1.png) 0 0 no-repeat;
    padding: 9px;
} 

.main_type1 .bx-controls-direction .bx-next {
    background: url(./img/main/ico_next1_x1.png) 0 0 no-repeat;
    padding: 9px;
}  


.main_type2 .bx-controls-direction .bx-prev,
.main_type4 .bx-controls-direction .bx-prev
 {
    background: url(./img/main/btn_prev_default.png) 0 0 no-repeat;
    padding: 9px;
} 

.main_type2 .bx-controls-direction .bx-next,
.main_type4 .bx-controls-direction .bx-next
 {
    background: url(./img/main/btn_next_default.png) 0 0 no-repeat;
    padding: 9px;
} */
    
    
    </style> 

<script>
     $(document).ready(function(){
            $('.bannerSlide').bxSlider({
                auto: true,
                pager: false,
                slideWidth: 1920
            });

            $('.itemSlide').bxSlider({
                mode: 'horizontal',// 가로 방향 수평 슬라이드
                speed: 500, // 이동 속도를 설정
                pager: false, // 현재 위치 페이징 표시 여부 설정
                moveSlides: 1, // 슬라이드 이동시 개수
                slideWidth: 1050, // 슬라이드 너비   (11/19 수정) 200 -> 1050
                slideHeight: 300,
                minSlides: 4, // 최소 노출 개수
                maxSlides: 4, // 최대 노출 개수
                slideMargin: 15, // 슬라이드간의 간격
                auto: true, // 자동 실행 여부
                autoHover: true, // 마우스 호버시 정지 여부
                controls: true // 이전 다음 버튼 노출 여부
            });0

            $('.recipeSlide').bxSlider({
                mode: 'horizontal',// 가로 방향 수평 슬라이드
                speed: 500, // 이동 속도를 설정
                pager: false, // 현재 위치 페이징 표시 여부 설정
                moveSlides: 1, // 슬라이드 이동시 개수
                slideWidth: 338, // 슬라이드 너비
                slideHeight: 300,
                minSlides: 3, // 최소 노출 개수
                maxSlides: 3, // 최대 노출 개수
                slideMargin: 15, // 슬라이드간의 간격
                auto: true, // 자동 실행 여부
                autoHover: true, // 마우스 호버시 정지 여부
                controls: true // 이전 다음 버튼 노출 여부
            });
        });
</script>
</head>
<body>
	
	<jsp:include page="/include/header.jsp"/>
	
	<div id="haliMain">
	
	    <%-- 메인타입1 - 상단 배너 ( 이미지 슬라이더 사용) --%>
	    <div>
	        <div class="main_type1">
	            <div class="list_goods_0">
	                <%-- slide --%>
	                <ul class="bannerSlide">
	                    <li><a href="<%=request.getContextPath() %>/user/user_event_ban1.jsp"><img src="<%=request.getContextPath() %>/img/main/banner1.jpg" alt="이벤트배너"></a></li>
	                    <li><a href="<%=request.getContextPath() %>/user/user_event_ban2.jsp"><img src="<%=request.getContextPath() %>/img/main/banner3.jpg" alt="이벤트배너"></a></li>
	                    <li><a href="<%=request.getContextPath() %>/user/user_event_ban3.jsp"><img src="<%=request.getContextPath() %>/img/main/banner7.jpg" alt="이벤트배너"></a></li>
	               <%-- <li><a href="#"><img src="<%=request.getContextPath() %>/img/main/banner2.jpg" alt="이벤트배너"></a></li>  --%> 
	                </ul>
	            </div>
	        </div> <%-- main_type1 end --%>
	    </div> <%-- --%>
	
	    <%-- 메인타입 2 - '이 상품 어때요?' ( 이미지 호버했을 때 확대, 슬라이더 사용 ) --%>
	    <div>
	        <div class="main_type2">
	            <div class="product_list">
	                <div class="tit_goods">
	                    <h3 class="tit">
	                    	<span class="name">이 상품 어때요?</span>
	                    </h3>
	                </div>
	                <%-- slide --%>
	                <div class="list_goods">
	                    <ul class="itemSlide">
	                        <li><div><a href=""><img src="<%=request.getContextPath() %>/img/product/산양유.jpg" alt="산양유 상품사진"></a></div>
	                        <div class="info_goods">
	                            <span class="name"><a class="txt">[조공] PET 나 산양유 좋아해 스틱</a></span>
	                            <span class="price"></span>5,000원 </span> 
	                            <%-- <span class="cost">5,000원</span> --%>
	                        </div>
	                        </li>
	                        <li><a href=""><img src="<%=request.getContextPath() %>/img/product/게살.jpg" alt=""></a>
	                        <div class="info_goods">
	                            <span class="name"><a class="txt">[조공] PET 나 게살 좋아해 스틱</a></span>
	                            <span class="price">2,900원 </span> 
	                            <%--<span class="cost">12,530원</span>--%>
	                        </div>
	                        </li>
	                        <li>
	                            <a href=""><img src="<%=request.getContextPath() %>/img/product/산양유.jpg" alt=""></a>
	                            <div class="info_goods">
	                                <span class="name"><a class="txt">[구스티] 유기농 아마씨오일</a></span>
	                                <span class="price"><span class="dc">10%</span>11,277원 </span> 
	                                <span class="cost">12,530원</span>
	                            </div>
	                        </li>                    
	                        <li>
	                            <a href=""><img src="<%=request.getContextPath() %>/img/product/게살.jpg" alt=""></a>
	                            <div class="info_goods">
	                                <span class="name"><a class="txt">[구스티] 유기농 아마씨오일</a></span>
	                                <span class="price"><span class="dc">10%</span>11,277원 </span> 
	                                <span class="cost">12,530원</span>
	                            </div>
	                        </li>                    
	                        <li>
	                            <a href=""><img src="<%=request.getContextPath() %>/img/product/산양유.jpg" alt=""></a>
	                            <div class="info_goods">
	                                <span class="name"><a class="txt">[구스티] 유기농 아마씨오일</a></span>
	                                <span class="price"><span class="dc">10%</span>11,277원 </span> 
	                                <span class="cost">12,530원</span>
	                            </div>
	                        </li>
	                        <li>
	                            <a href=""><img src="<%=request.getContextPath() %>/img/product/게살.jpg" alt=""></a>
	                            <div class="info_goods">
	                                <span class="name"><a class="txt">[구스티] 유기농 아마씨오일</a></span>
	                                <span class="price"><span class="dc">10%</span>11,277원 </span> 
	                                <span class="cost">12,530원</span>
	                            </div>
	                        </li>                    
	                    </ul>
	                </div>
	            </div>
	        </div> <%-- main_type2 end --%>
	    </div> <%-- --%>
	
	    <%-- 메인타입 3 - 지금 가장 핫한 상품( 이미지 호버했을 때 확대, 슬라이더 미사용 )  --%>
	    <div>
	        <div class="main_type3">
	            <div class="main_event">
	                <div class="tit_goods">
	                    <h3 class="tit">
	                        <a href="#" class="name">
	                            <span class="link_x1">지금 가장 핫한 상품</span>
	                        </a>
	                    </h3>
	                </div>
	                <div class="list_goods">
	                    <ul data-title="특가/혜택" data-section="event" class="list">
	                        <li data-index="1"><a href="#" class="thumb_goods"><img src="<%=request.getContextPath() %>/img/product/게살.jpg"></a>
	                            <div class="info_goods"><span class="name"><a class="txt">춘천 감자빵 오리지널</a></span> <span class="price">16,000원</span></div>
	                        </li>
	                        <li data-index="2"><a href="#" class="thumb_goods"><img src="<%=request.getContextPath() %>/img/product/산양유.jpg"></a>                           
	                            <div class="info_goods">
	                                <div class="inner_info"><span class="name"><a class="txt">디저트 최대 60% 할인</a></span> <span class="desc"><a
	                                            class="txt">커피부터 빵까지</a></span></div>
	                            </div>
	                        </li>
	                        <li data-index="3"><a href="#" class="thumb_goods"><img src="<%=request.getContextPath() %>/img/product/게살.jpg"></a>
	                                
	                            <div class="info_goods">
	                                <div class="inner_info"><span class="name"><a class="txt">신선 식품 20%
	                                            할인</a></span> <span class="desc"><a class="txt">밥상 물가
	                                            걱정 없이</a></span></div>
	                            </div>
	                        </li>
	                        <li data-index="4"><a href="#" class="thumb_goods"><img src="<%=request.getContextPath() %>/img/main/pc_img_1637144079.jpg"></a>
	                                
	                            <div class="info_goods">
	                                <div class="inner_info"><span class="name"><a class="txt">신선 식품 20%
	                                            할인</a></span> <span class="desc"><a class="txt">밥상 물가
	                                            걱정 없이</a></span></div>
	                            </div>
	                    </ul>
	                </div>
	
	            </div>
	        </div>
	    </div> <%-- main_type3 end --%>
	
	    <!-- 메인타입 4 - '하니의 레시피' ( 이미지 호버했을 때 확대, 슬라이더 사용 ) -->
	    <div class="main_type4">
	        <div class="main_recipe">
	            <div class="tit_goods">
	                <h3 class="tit">
	                	<a href="#" class="name">
	                		<span class="link_x1">컬리의 레시피</span>
	                	</a>
	                </h3>
	            </div>
	            <ul class="recipeSlide">
					<li><a href="#"><img src="<%=request.getContextPath() %>/img/main/main_v2_92f3d901eee3a760.jpg"></a>
	                    <div class="info_goods">
	                        <span class="name"><a class="txt">팔보채</a></span>
	                    </div>
					</li>
					<li><a href="#"><img src="<%=request.getContextPath() %>/img/main/main_v2_92f3d901eee3a760.jpg"></a>
						<div class="info_goods">
	                        <span class="name"><a class="txt">팔보채</a></span>
	                    </div>
					</li>
					<li><a href="#"><img src="<%=request.getContextPath() %>/img/main/main_v2_92f3d901eee3a760.jpg"></a>
						<div class="info_goods">
	                        <span class="name"><a class="txt">팔보채</a></span>
	                    </div>
					</li>
					<li><a href="#"><img src="<%=request.getContextPath() %>/img/main/main_v2_92f3d901eee3a760.jpg"></a>
						<div class="info_goods">
	                        <span class="name"><a class="txt">팔보채</a></span>
	                    </div>
					</li>
					<li><a href="#"><img src="<%=request.getContextPath() %>/img/main/main_v2_92f3d901eee3a760.jpg"></a>
						<div class="info_goods">
	                        <span class="name"><a class="txt">팔보채</a></span>
	                    </div>
					</li>
					<li><a href="#"><img src="img/main/main_v2_92f3d901eee3a760.jpg"></a>
	                    <div class="info_goods">
	                        <span class="name"><a class="txt">팔보채</a></span>
	                    </div>
	                </li>
				</ul>                
	        </div>                
	    </div> <%-- main_type4 end --%>
	
	    <br>
	    <br>
	    <br>
	    <br>
	    <br>
	    <%-- 메인타입 5 - 하단 배너 --%>
	    <div class="banner_bottom">
	        <img class="banner_img" src="<%=request.getContextPath() %>/img/main/banner_bottom.jpg">
	    </div>
	    
	
	</div> <%-- haliMain end --%>

	<jsp:include page="/include/footer.jsp"/>
<%--
</body>
</html>
 --%>