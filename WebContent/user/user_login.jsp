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
	<title>마켓하니 :: 내일의 장보기 마켓하니</title>
	<link rel="stylesheet" type="text/css" href="../css/login.css">
	<link rel="icon" href="../img/favicon/favicon-32x32.ico" type="image/x-icon" sizes="16x16">
</head>
<body>
	<jsp:include page="/include/header.jsp"/>

	<div class="container">
	
		<c:if test="${param.register == true}">
			<div class="registed">
				<span>회원가입이 완료되었습니다!</span> 
				<br>
				<span>가입한 계정으로 로그인할 수 있습니다.</span>
			</div>
		</c:if>
		 
    <h2 class="title">로그인</h2>
    <form class="form" action="${pageContext.request.contextPath}/user_login.do" method="post">
      <input class="input" type="text" name="id" size="20" placeholder="아이디를 입력해주세요">
      <input class="input pw" id="pw" type="password" size="20" name="pw" placeholder="비밀번호를 입력해주세요">
      <div class="find">
        <a class="findText" href="#">아이디 찾기</a>
        <span class="findText"> | </span>
        <a class="findText" href="#">비밀번호 찾기</a>
      </div>
        <button class="form_btn" type="submit">
          <span>로그인</span>
        </button>
    </form>
    	<a class="register" href="user_register.jsp">
         <span>회원가입</span>
      </a>
  </div>
    
  <jsp:include page="/include/footer.jsp"/>
<%-- 
</body>
</html> --%>