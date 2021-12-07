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

/*게시글 수정 시작*/

/*중복*/
body, input, select, textarea, button {
	font-family: noto sans, malgun gothic, AppleGothic, dotum;
	line-height: 1;
	letter-spacing: -.05em;
	color: #4c4c4c;
	font-size: 12px;
	max-width: 100%;
} /*게시판 글씨 크기 조정 */
body * {
	font-family: 'Noto Sans';
	font-weight: 400;
	letter-spacing: 0;
} /*게시판 글씨 간격 조정 */

#p_btnReview {
	padding: 10px 0;
    text-align: right;
    width: 100%;
    display: table;
    border-top: 1px solid #6a3664;
}
#btnReview {	
	display: inline-block;
    line-height: 40px;
    text-align: center;
    background-color: #795b8f;
    border: 1px solid #5f0080;
    color: #fff;
    float: right;
} /*후기쓰기 버튼 위치 조정*/

a {
text-decoration: none;
color: #4c4c4c;

}

*, *:after, *:before {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	margin: 0; /*게시글 전체틀 마진 0*/
	line-height: 1;
	color: #4c4c4c;
	max-width: 100
}

h2 {
	display: block;
	font-size: 1.5em;
	margin-block-start: 0.83em;
	margin-block-end: 0.83em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	font-weight: bold;
} /*게시글 왼쪽으로 이동*/
.xans-product-additional table.xans-board-listheader th {
	padding: 25px 0 23px;
	vertical-align: middle;
	font-size: 12px;
}

.screen_out {
	display: block;
	overflow: hidden;
	position: absolute;
	left: -9999px;
	width: 1px;
	height: 1px;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
} /*회원등급 안보이게하는 것*/
.goods_board .tbl_newtype1 .subject {
	padding-left: 50px;
	text-align: left;
} /*제목 위치 정렬*/
.xans-product-additional table.xans-board-listheaderd td {
	padding: 25px 3px 23px;
	border-top: 1px solid #e3e3e3;
	vertical-align: middle;
	text-align: center;
} /*리뷰 밑에 선 그어지고 간격 조정*/
.goods_board .tbl_newtype1 .time {
	color: #939393;
} /*작성일 글씨 색 회색*/
.xans-product-additional div.board h2 {
	font-size: 13px;
	font-weight: 700;
	padding-bottom: 5px;
}

.xans-product-additional .sort-wrap {
	position: relative;
}

.xans-product-additional .sort {
	position: absolute;
	bottom: 0;
	right: 0;
	padding: 10px;
	text-align: right;
} /*최근등록일 순 정리등 select 위치*/
ul {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
	list-style-type: none; /*도트 제거*/
	padding: 0; /*도트 사이 왼쪽 여백 없애기*/
}

.list_type1.old .ico {
	float: left;
	width: 4px;
	height: 4px;
	margin: 7px 8px 0 0;
	background-color: #514859;
	vertical-align: 2px;
} /*도트 표시를 사각형으로 표시*/
.list_type1.old .txt {
	overflow: hidden;
	padding: 0; /*아래 위 글자간 간격 조정*/
	font-size: 12px;
	color: #666;
	line-height: 18px; /*아래 위 글자간 간격 조정*/
	letter-spacing: -.3px; /*오른쪽 왼쪽 글자간 간격 조정*/
} /*도트 부분 글씨 조정 */
.xans-product-additional .sort select {
	margin: 0 2px 0 0;
	border: 1px solid #bfbfbf;
	line-height: 34px;
	height: 34px;
	vertical-align: middle;
	padding-bottom: 5px;
} /*최근등록일 순 정리등 select */
.xans-product-additional table.xans-board-listheader {
	margin: 15px 0 0;
	color: #353535;
	font-size: 12px;
	line-height: 140%;
	table-layout: fixed;
}

.xans-board-listheader {
	border-top: 2px solid #522772;
	font-size: 13px;
	line-height: 140%;
}

colgroup {
	display: table-column-group;
}

tbody {
	display: table-row-group;
	vertical-align: middle;
	border-color: inherit;
} /*게시글 상단 이름*/
.goods-view-infomation-board {
	width: 100%;
} /*게시글 전체 틀*/
iframe[Attributes Style] {
	border-top-width: 0px;
	border-right-width: 0px;
	border-bottom-width: 0px;
	border-left-width: 0px;
	height: 730px;
}

iframe {
	border-width: 2px;
	border-style: inset;
	border-color: initial;
	border-image: initial;
}

.inner_review {
	padding: 15px;
}

.review_photo img {
    display: block;
    max-width: 600px;
    margin: 0 auto;
} /*리뷰 포토 이미지*/

#review_content_button {
    border: 1px solid #5f0080;
    background-color: #fff;
    color: #5f0080;
    text-align: center;
    width: auto;
    padding: 5px 15px;
}

#review_content_button:hover {
    background: #5f0080; 
    color: #fff;
   
}/*페이징 호버*/

</style>

</head>
<body>



	<%-- 상품 후기 게시판  --%>
<body style="overflow-y: hidden;">
	<div id="contents-wrapper" class="goods_board">
		<div
			class="xans-element- xans-product xans-product-additional detail_board  ">
			<div class="board">
				<span class="line"></span>
				<form name="frmList">
					<input type="hidden" name="sort" value> <input
						type="hidden" name="page_num" value> <input type="hidden"
						name="goodsno" value="56491">

					<div class="title_txt">
						<h2>PRODUCT REVIEW</h2>
						<div class="sort-wrap">
							<ul class="list_type1 old">
								<li><span class="ico"></span>
									<p class="txt">상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의
										없이 담당 게시판으로 이동될 수 있습니다.</p></li>
								<li><span class="ico"></span>
									<p class="txt">배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내
										1:1문의에 남겨주세요.</p></li>
							</ul>


							<div class="sort" style="bottom: -9px">
								<select
									onchange="this.form.sort.value=this.value;this.form.submit()">
									<option value="1">최근등록순</option>
									<option value="2">좋아요많은순</option>
									<option value="3">조회많은순</option>
								</select>
							</div>
						</div>
					</div>


					<table class="xans-board-listheader" width="100%" border="0"
						cellpadding="0" cellspacing="0">
						<caption style="display: none">구매후기 제목</caption>
						<colgroup>
							<col style="width: 70px;">
							<col style="width: auto;">
							<%-- <col style="width: 51px;"> 회원등급 --%>
							<col style="width: 128px;">
							<%-- 77px인데 회원등급 제거해서 128로 변경 --%>
							<col style="width: 100px;">
							<%-- <col style="width: 40px;">  도움--%>
							<col style="width: 80px;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="col" class="input_txt">번호</th>
								<th scope="col" class="input_txt">제목</th>
								<!-- <th scope="col" class="input_txt">
								<span class="screen_out">회원 등급</span>
							</th> -->
								<th scope="col" class="input_txt">작성자</th>
								<th scope="col" class="input_txt">작성일</th>
								<th scope="col" class="input_txt">조회</th>
							</tr>
						</tbody>
					</table>
					<%--공지글 임의로 작성 --%>
					<table class="xans-board-listheaderd tbl_newtype1" width="100%"
						cellpadding="0" cellspacing="0">
						<caption style="display: none">구매후기 내용</caption>
						<colgroup>
							<col style="width: 70px;">
							<col style="width: auto;">
							<%-- <col style="width: 51px;"> 회원등급--%>
							<col style="width: 128px;">
							<%-- 77px인데 회원등급 제거해서 128로 변경 --%>
							<col style="width: 100px;">
							<%-- <col style="width: 40px;"> --%>
							<col style="width: 80px;">
						</colgroup>
							
							<%--공지글 임의로 작성 --%>
						
						<td align="center" width="70px">공지</td>
						<td class="subject">
							<div>금주의 Best 후기 안내</div>
						</td>
						<td class="user_grade">MarketHani</td>
						<td class="time">2019-11-01</td>
						<td><span class="review-hit-cnt">436025</span></td>
					</table>
					<table class="xans-board-listheaderd tbl_newtype1" width="100%"
						cellpadding="0" cellspacing="0">
						<caption style="display: none">구매후기 내용</caption>
						<colgroup>
							<col style="width: 70px;">
							<col style="width: auto;">
							<%-- <col style="width: 51px;"> 회원등급--%>
							<col style="width: 128px;">
							<%-- 77px인데 회원등급 제거해서 128로 변경 --%>
							<col style="width: 100px;">
							<%-- <col style="width: 40px;"> --%>
							<col style="width: 80px;">
						</colgroup>
						
						<td align="center" width="70px">공지</td>
						<td class="subject">
							<div>상품 후기 적립금 정책 안내</div>
						</td>
						<td class="user_grade">MarketHani</td>
						<td class="time">2019-11-01</td>
						<td><span class="review-hit-cnt">235169</span></td><%--공지글 임의로 작성 end --%>
						</table>

						
						<c:set var="dto" value="${Cont }" />
							<div>
									<table class="xans-board-listheaderd tbl_newtype1" width="100%"
										cellpadding="0" cellspacing="0">
										<caption style="display: none">구매후기 내용</caption>
										<colgroup>
											<col style="width: 70px;">
											<col style="width: auto;">
											<%-- <col style="width: 51px;"> 회원등급--%>
											<col style="width: 128px;">
											<%-- 77px인데 회원등급 제거해서 128로 변경 --%>
											<col style="width: 100px;">
											<%-- <col style="width: 40px;"> --%>
											<col style="width: 80px;">
										</colgroup>
										<tr>
											<input type="hidden" name="index" value="1">
											<input type="hidden" name="image" value="true">
											
											<td align="center">${dto.getR_num() }</td>
											<td class="subject">
											<a
												href="<%=request.getContextPath()
						%>/user_product_review_list.do?p_num=${dto.getP_num()}">${dto.getR_title() }</a></td>
											<td>${dto.getUser_id() }</td>
											<td class="time">${dto.getR_date() }<%-- <fmt:formatDate value="${dto.getR_date() }" pattern="yyyy-MM-dd" /> --%></td>
											<td>${dto.getR_hit() }</td>

										</tr>
									</table>
									</div>
									
							<div>  <%--후기 내용 전체틀 --%>
								<table class="xans-board-listheaderd tbl_newtype1" width="100%"
									cellpadding="0" cellspacing="0">
									<caption style="display: none">구매후기 내용</caption>
									<div class="inner_review">
										<div class="name_purchase">
										<br>
										<strong class="name">[${product.getP_seller() }]${product.getP_name() }</strong>
										<p></p>
										
										</div>
									
										<div class="review_photo">
											<img src="<%=request.getContextPath() %>/upload/review/${dto.getR_image() }" alt=""/>
										<br><br>
										${dto.getR_content() }	
										</div>
																	
									</div>
								</table>
								<div class="review_content_btn" align="right">
								<c:if test="${user_id ==dto.getUser_id() }"> <%-- user_id가 같을 경우에 보이는 버튼 --%>
								<input id="review_content_button" type="button" value="글수정"
									onclick="location.href='user_product_review_update.do?p_num=${dto.getP_num()}&no=${dto.getR_num()}&page=${page }'">
								
								<input id="review_content_button" type="button" value="글삭제"
									onclick="if(confirm('정말로 삭제하시겠습니까?')) {
									location.href='user_product_review_delete.do?r_num=${dto.getR_num() }'
									}else {return; }">
								</c:if>
								<input id="review_content_button" type="button" value="목록으로"
									onclick="location.href='user_product_review_list.do?p_num=${dto.getP_num()}'">
								</div>
								<br>
							</div> <%--후기 내용 전체틀 end --%>
							
						<c:if test="${empty dto }">
							<tr>
								<td colspan="5" align="center">
									<h3>내용이 없습니다</h3>
								</td>
							</tr>
						</c:if>
				</form>

				<p id="p_btnReview">
						<span id="btnReview" style="line-height:30px; width:130px;" 
						onclick="location.href='user_product_review_write.do?p_num=${dto.getP_num()}'">후기쓰기
						</span>
						
				
					</p>
			</div>
		</div>

	</div>





</body>
</html>