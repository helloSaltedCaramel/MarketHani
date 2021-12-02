<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


/*마이허니 부분*/
a {
	background-color: transparent;
    text-decoration: none;
    color: inherit;
}

div, th, td, li, dt, dd, p {
    word-break: break-all;
}

*, *:after, *:before {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

/*왼쪽 탭*/
#snb .tit_snb {
    padding: 5px 0 35px 1px;
    font-weight: 700;
    font-size: 28px;
    line-height: 35px;
    color: #333;
    letter-spacing: -1px;
} /*마이컬리*/

ul {
 list-style-type:none; /*ul 태그 옆에 점 제거*/
}

#snb .list_menu li {
    border-bottom: 1px solid #f2f2f2;
}
#snb .list_menu li a {
    display: block;
    overflow: hidden;
    padding: 14px 0 16px 20px;
    background: #fff url(https://res.kurly.com/pc/ico/2008/ico_arrow_6x11.svg) no-repeat 174px 52%;
    background-size: 6px 11px;
    font-size: 14px;
    color: #666;
    line-height: 20px;
    letter-spacing: -.3px;
 	text-decoration-line: none;  /*a 태그 아래 밑줄 제거*/

}

#snb .list_menu li.on a, #snb .list_menu li a:hover {
    background: #fafafa url(https://res.kurly.com/pc/ico/2008/ico_arrow_6x11_on.svg) no-repeat 174px 52%;
    background-size: 6px 11px;
    font-weight: 700;
    color: #5f0080;
}


.page_aticle.aticle_type2 {
    padding-top: 65px;
} /*상품 후기 전체 레이아웃*/
.page_aticle {
    width: 1050px;
    margin: 0 auto;
} /*상품 후기 전체 레이아웃*/
#snb {
    float: left;
    width: 200px;
} /*왼쪽 마이컬리 부분*/

.page_aticle.aticle_type2 .page_section {
    float: right;
    width: 820px;
} /*상품후기 전체 레이아웃*/
/*마이허니 end*/

.page_review{
	float: right;
    width: 780px;
}
}

 #textarea_review {
    width: 100%;
    height: 400px;
   
    resize: none;
  } /*후기작성하는 공간*/
  
  #th_review {
   background: #ebebeb;
  }
  
  #review_product_title{
	float: left;
	margin-top: 25px;
	margin-bottom: 25px;
} /*후기 작성 상품 이름 타이틀 위치 조정*/

#review_btn, #review_rebtn{
line-height:30px; 
width:130px;
text-align: center;
background-color: #795b8f;
border: 1px solid #5f0080;
color: #fff;
font-size: 13px;
margin-top: 70px;
}

  

</style>
</head>
<body>


	<div class="page_aticle aticle_type2"> <%-- 후기 전체 틀 마이컬리 포함 start --%>
		<%-- 왼쪽 마이컬리 탭 부분 --%>
		<div id="snb" class="snb_my">
			<h2 class="tit_snb">마이하니</h2>
		<%-- 왼쪽 마이컬리 탭 내부 주문 내역, 선물 내역, 배송지 관리, 상품 후기 --%>
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
		
		</div><%-- 왼쪽 마이컬리 탭 내부 주문 내역, 선물 내역, 배송지 관리, 상품 후기  end--%>
		</div><%-- 왼쪽 마이컬리 탭 부분 end--%>

<div class="page_review"> <%--후기작성 오른쪽 틀  --%>
		<c:set var="dto" value="${modify }"/>
			<h2 align="left">후기수정</h2>
		<hr width="95%" color="#5f0080">
		<br><br>	
		
		<form method="post" enctype="multipart/form-data" 
		action="<%=request.getContextPath()%>/user_product_review_update_ok.do?p_num=${product.getP_num()}">
		
		<input type="hidden" name="r_num" value="${dto.getR_num() }">
		<input type="hidden" name="page" value="${page }">
		
		
		<table border="0" cellspacing="0" width="700" >
			
			<tr>
			<th><img width="72px" height="72px" src="<%=request.getContextPath() %>/img/product/${product.getP_image()}"></th>
			<th id="review_product_title">[${product.getP_seller()}] ${product.getP_name() }</th>
			</tr>
			
			<tr>
				<th id="th_review">작성자</th>
				<td><input name="user_id" value="${dto.getUser_id() }" readonly></td>
			</tr>
			
			<tr>
				<th id="th_review">제목</th>
				<td><input name="r_title" value="${dto.getR_title() }"></td>
			</tr>
			
			<tr>
				<th id="th_review">후기작성</th>
				<td>
				 <textarea id="textarea_review"  name="r_content"  rows="25" cols="80">${dto.getR_content() }</textarea>
				</td>
			</tr>
			
			<tr>
				<th id="th_review">사진등록</th>
				<td><input type="file" name="r_image"></td>
			</tr>
			
			<c:if test="${empty dto }">
				<tr>
					<td colspan="2" align="center">
						<h3>검색된 게시물이 없습니다.</h3>
					</td>
				</tr>
			</c:if>
			
		
			<tr>
				<td colspan="2" align="center">
					<input id="review_btn" type="submit" value="등록하기"> &nbsp;&nbsp;&nbsp;
					<input id="review_rebtn" type="reset" value="다시작성">
				</td>
			</tr>
			
			
		
		</table>
		
		</form>
	
	</div> <%--후기작성 오른쪽 틀  end--%>


</body>
</html>