<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%-- import product_detail.css --%>
	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/css/product_review_write.css">
		
		
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<div class="page_aticle aticle_type2"> <%-- 후기 전체 틀 마이컬리 포함 start --%>
		<%-- 
		왼쪽 마이컬리 탭 부분
		<div id="snb" class="snb_my">
			<h2 class="tit_snb">마이하니</h2>
		왼쪽 마이컬리 탭 내부 주문 내역, 선물 내역, 배송지 관리, 상품 후기
		<div class="inner_sub">
			<ul class="list_menu">
				<li>
					<a href = "" >주문 내역</a>
				</li>
				<li>
					<a href = "" >선물 내역</a>
				</li>
				<li>
					<a href = "" >배송지 관리</a>
				</li>
				<li>
					<a href = "" >상품 후기</a>
				</li>
				<li>
					<a href = "" >적립금</a>
				</li>
				<li>
					<a href = "" >쿠폰</a>
				</li>
				<li>
					<a href = "" >개인 정보 수정</a>
				</li>
			</ul>
		
		</div>왼쪽 마이컬리 탭 내부 주문 내역, 선물 내역, 배송지 관리, 상품 후기  end
		</div>왼쪽 마이컬리 탭 부분 end
 --%>
	<div class="page_review"> <%--후기작성 오른쪽 틀  --%>
		
			<h2 align="left">후기작성</h2>
		<hr width="95%" color="#5f0080">
		<br><br>	
		
		<form method="post" enctype="multipart/form-data" 
		action="<%=request.getContextPath()%>/user_product_review_write_ok.do?p_num=${product.getP_num()}">
		
		<table border="0" cellspacing="0" width="700">
			
			<tr>
			<th><img width="72px" height="72px" src="<%=request.getContextPath() %>/upload/product/${product.getP_image()}"></th>
			<th id="review_product_title">[${product.getP_seller()}] ${product.getP_name() }</th>
			</tr>
			
			
			<tr>
				<th id="th_review">아이디</th>
				<td><input name="user_id" placeholder="아이디를 입력하세요"></td>
			</tr>
			
			<tr>
				<th id="th_review">제목</th>
				<td><input  name="r_title" placeholder="제목을 입력해주세요"></td>
			</tr>
			
			<tr>
				<th id="th_review">후기작성</th>
				<td>
				 <textarea id="textarea_review"  name="r_content"  rows="25" cols="80"
				 placeholder=
				 "자세한 후기는 다른 고객의 구매에 많은 도움이 되며,&#13;&#10;일반식품의 효능이나 효과 등에 오해의 소지가 있는 내용을 작성시 검토후 비공개 조치될 수 있습니다.&#13;&#10;반품/환불 문의는 1:1 문의로 가능합니다."></textarea>
				</td>
			</tr>
			
			<tr>
				<th id="th_review">사진등록</th>
				<td><input type="file" name="r_image"></td>
			</tr>
			
			
			<tr>
				<td colspan="2" align="center" style="line-height:30px; width:130px;">
					<input id="review_btn" type="submit" value="등록하기"> &nbsp;&nbsp;&nbsp;
					
				</td>
			</tr>
			
			
		
		</table>
		
		</form>
	
	</div> <%--후기작성 오른쪽 틀  end--%>
	</div> <%-- 후기 전체 틀 마이컬리 포함 end --%>

</body>
</html>