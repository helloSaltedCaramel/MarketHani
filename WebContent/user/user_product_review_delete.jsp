<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<div align="center">
		<hr width="50%" color="blue">
			<h3>${dto.P_name() } 테이블 게시글 삭제 폼 페이지</h3>
		<hr width="50%" color="blue">
		<br> <br>
		
		<form method="post"
		action="<%=request.getContextPath()%>/user_product_review_delete_ok.do">
		
			<input type="hidden" name="r_num" value="${param.no }" >
			<table border="1" cellsapcing="0" width="400">
				<tr>
					<th>회원님의 비밀번호를 입력하세요</th>
					<th> <input type="password" name="user_pwd"> </th>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="글삭제">&nbsp;&nbsp;&nbsp;
						<input type="reset" value="다시작성">
				</tr>
			
			</table>
		
		
		</form>
		
		
	</div>


</body>
</html>