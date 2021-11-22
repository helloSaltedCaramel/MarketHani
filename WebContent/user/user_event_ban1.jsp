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

    <%-- import product_list.css --%>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/eventMain.css">

    <!-- jQuery library (served from Google) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />


<script>
	$(document).ready(function(){
	    $('.userevent_Slide').bxSlider({
	        auto: true,
	        pager: false,
	        slideWidth: 1920
	    });
</script>

</head>
<body>

    <jsp:include page="/include/header.jsp"/>
      
    <div class="page_event">
    	<div class="view_main">
        	<h3 class="screen out">Love Food, Less Moments</h3>
        	<p>	
		        무심하게 지나쳤던 매일의 음식에서,
		        일상에서 쉽게 볼 수 있는 식재료에서,
		        특별한 맛과 감정의 순간을 포착할 때가 있죠.
		        컬리가 초대한 김영하 . 장류진 . 김중혁 . 김겨울 작가와 함께
		        삶의 다채로운 순간들이 담긴
		        일상 속 음식 이야기를 만나보세요.
		        Love Food, Love Moments     
            </p>
      	</div>
      	<div class="view_search">
      		<div class="view_event">
      			 <%-- <ul class="userevent_Slide">
	                    <li><a href="#"><img src="<%=request.getContextPath() %>/img/main/slide01.png" alt=""></a></li>
	                    <li><a href="#"><img src="<%=request.getContextPath() %>/img/main/slide01.png" alt=""></a></li>
	                    <li><a href="#"><img src="<%=request.getContextPath() %>/img/main/slide01.png" alt=""></a></li>
	                    <li><a href="#"><img src="<%=request.getContextPath() %>/img/main/slide01.png" alt=""></a></li>
	        	</ul> --%>
      		</div>
      	</div>
  
    
    
    </div>
      
      
      
      <jsp:include page="/include/footer.jsp"/>

</body>
</html>