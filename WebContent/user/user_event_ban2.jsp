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
    
</head>

<body>

    <jsp:include page="/include/header.jsp"/>
    <div id="page2_main">
	    <div id="page2_event">
	     	<div id="page2_article">
	     		<div id="lnbMenu" class="lnb_Menu">
	     		 	<div id="bnrCategory" class="bnr_category">
	     		 	 	<div class="thumb">
	     		 	 		<img src="https://img-cf.kurly.com/category/banner/pc/5523d0e3-e3a9-46d6-9140-5ec51f8f7252" alt="카테고리배너">
	     		 	 	</div>
	     		 		<h3 class="lnb_title">미리 만나는 크리스마스</h3>
	     		 		<ul class="list">
	     		 			<li><a class>디저트&간식</a></li>
	     		 			<li><a class>크리스마스용품</a></li>
	     		 			<li><a class>크리스마스선물</a></li>	     		 			
	     		 		</ul>
	     		 	</div>
	     		</div> <%-- lnbmenu end --%>
	     		
	     		<div>
	     		        <%-- 승욱님이 만드신거 그대로 복사 --%>
	     		</div>
	     		
	     	</div> <%-- page2_article end --%>
	    </div>
    </div>
    
    <jsp:include page="/include/footer.jsp"/>


</body>
</html>    