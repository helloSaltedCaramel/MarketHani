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

    <%-- import eventMain.css --%>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/event.css">

    <!-- jQuery library (bsxslider) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />

    <style>
    .bx-wrapper {border:0;background:#fbfbfb;box-shadow:none;}
    .bx-wrapper .bx-prev {
    background: url(../img/main/btn_prev.png) 0 0 no-repeat;
    }
    .bx-wrapper .bx-next {
    background: url(../img/main/btn_next.png) 0 0 no-repeat;
    }
    
    
    .bx-wrapper .bx-controls-direction a {
    position: absolute;
    top: 44%;
    margin-top: -16px;
    outline: 0;
    width: 32px;
    height: 80px;
    text-indent: -9999px;
    z-index: 9999;
    background-size: 100%;
}
    

    
    
    </style>
    
     <script>
	$(document).ready(function(){
	    $('.eventSlide').bxSlider({
	        pager: false,
	        
	    });
	 });
</script>

</head>
<body>

    <jsp:include page="/include/header.jsp"/>
      
    <div class="page_event">
    	<div class="view_main">
    		<img src="<%=request.getContextPath() %>/img/main/img_main.jpg">
      	</div>
      	
      	<div class="view_search">
      		<div class="view_event">
      			 <ul class="eventSlide">
		             <li><a href="#"><img src="<%=request.getContextPath() %>/img/main/swipe_tomato_week2.jpg" alt=""></a>
		                <img src="<%=request.getContextPath() %>/img/main/mo_tomato_week2.gif" class="img_mo" alt="토마토검색창">
		             </li>
		             <li><a href="#"><img src="<%=request.getContextPath() %>/img/main/swipe_tofu_week2.jpg" alt=""></a>
		             	<img src="<%=request.getContextPath() %>/img/main/mo_tofu_week2.gif" class="img_mo" alt="두부검색창">
		             </li>
		             <li><a href="#"><img src="<%=request.getContextPath() %>/img/main/swipe_potato_week2.jpg" alt=""></a>
		             	<img src="<%=request.getContextPath() %>/img/main/mo_potato_week2.gif" class="img_mo" alt="감자검색창">
		             </li>
		             <li><a href="#"><img src="<%=request.getContextPath() %>/img/main/swipe_carrot_week2.jpg" alt=""></a>
		             	<img src="<%=request.getContextPath() %>/img/main/mo_carrot_week2.gif" class="img_mo" alt="당근검색창">
		             </li>
	        	</ul> 
      		</div>
      	</div>
  
    
    
    </div>
      
      
      
      <jsp:include page="/include/footer.jsp"/>

</body>
</html>