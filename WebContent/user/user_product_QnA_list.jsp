<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
		
	<div class="qnainfo">

			<ul>
			<h2>PRODUCT Q&A</h2>
			<li>상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
			<li>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 1:1문의에 남겨주세요.</li>
			</ul>
	
	
	</div>
	
	<div class="qnalist">	
		<table border="1" cellspacing="0" width="1000">
			<tr>
				<th>제목</th><th>작성자</th>
				<th>작성일</th><th>답변상태</th>
			</tr>
		
			<c:set var="list" value="${List }" />
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td><a href="<%=request.getContextPath()
						%>/user_qna_content.do?num=${dto.getQna_num()}">${dto.getQna_title() }</a></td>
						<td>${dto.getUser_id() }</td>
						<td>${dto.getQna_date() }</td>
						<td>${dto.getQna_status() }</td>
						
					</tr>
				</c:forEach>
			</c:if>
			
			 <c:if test="${empty list }">
	         <tr>
	            <td colspan="5" align="center">
	               <h3>검색된 게시물이 없습니다.....</h3>
	            </td>
	      	 </tr>
	      </c:if>
	      
	      
	       <tr>
	         <td colspan="5" align="right" style="border:none">
	            <input type="button" value="문의하기"
	               onclick="location.href='user_qna_write.do'">
	         </td>
	      
	   </table>
	
	</div>

	


</body>
</html>