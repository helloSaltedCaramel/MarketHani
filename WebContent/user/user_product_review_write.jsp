<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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



/*왼쪽 탭 end*/

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


textarea::placeholder {
 color : #b8b8b8;
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
		
			<h2 align="left">후기작성</h2>
		<hr width="95%" color="#5f0080">
		<br><br>	
		
		<form method="post" enctype="multipart/form-data" 
		action="<%=request.getContextPath()%>/user_product_review_write_ok.do">
		
		<table border="0" cellspacing="0" width="700">
			
			<tr>
			<th><img width="72px" height="72px" src="<%=request.getContextPath() %>/img/product/${dto.getP_image()}"></th>
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
				<td colspan="2" align="center">
					<input type="submit" value="등록하기"> &nbsp;&nbsp;&nbsp;
					
				</td>
			</tr>
			
			
		
		</table>
		
		</form>
	
	</div> <%--후기작성 오른쪽 틀  end--%>
	</div> <%-- 후기 전체 틀 마이컬리 포함 end --%>

</body>
</html>