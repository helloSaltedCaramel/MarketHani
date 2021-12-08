<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <%-- import header.css --%>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css"/>
	<link rel="icon" href="<%=request.getContextPath() %>/img/favicon/favicon-32x32.ico" type="image/x-icon" sizes="16x16">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
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
     
     <div id="eventMain">
     	<div id="eventContent">
        	<div class="page_article">
        		<div id="mainEvent" class="page_section_event">
        		 	<ul class="list">
        		 		<li>
        		 			<a href="<%=request.getContextPath() %>/user/user_event_ban1.jsp">
        		 			<img alt="이벤트 배너1" src="<%=request.getContextPath() %>/img/main/banner1.jpg"></a>
        		 		</li>
        		 		<li>
        		 			<a href="<%=request.getContextPath() %>/user/user_event_ban2.jsp" >
        		 			<img alt="이벤트 배너2" src="<%=request.getContextPath() %>/img/main/banner3.jpg"></a>
        		 		</li>
        		 		<li>
        		 			<a href="<%=request.getContextPath() %>/user/user_event_ban3.jsp" >
        		 			<img alt="이벤트 배너3" src="<%=request.getContextPath() %>/img/main/banner7.jpg"></a>
        		 		</li>
        		 		<li>
        		 			<a href="<%=request.getContextPath() %>" ><img alt="" src="../img/main/banner4.jpg"></a>
        		 		</li>
        		 		<li>
        		 			<a href="<%=request.getContextPath() %>" ><img alt="" src="../img/main/banner5.jpg"></a>
        		 		</li>
        		 		<li>
        		 			<a href="<%=request.getContextPath() %>" ><img alt="" src="../img/main/banner6.jpg"></a>
        		 		</li>
        		 	</ul>
        		</div>
        	</div>
     	</div>
     
     </div>
     
     
     
     
     <jsp:include page="/include/footer.jsp"/>

</body>
</html>