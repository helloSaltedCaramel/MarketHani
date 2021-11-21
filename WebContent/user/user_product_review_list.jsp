<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


/*게시글 수정 시작*/
h2 {
	display: block;
	font-size: 1.5em;
	margin-block-start: 0.83em;
	margin-block-end: 0.83em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	font-weight: bold;
} /*게시글 왼쪽으로 이동*/
.xans-product-additional .sort {
	position: absolute;
	bottom: 0;
	right: 0;
	padding: 10px;
	text-align: right;
} /*최근등록일 순 정리등 select 위치*/
ul {
	display: block;
	list-style-type: disc;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

.xans-product-additional .sort select {
	margin: 0 2px 0 0;
	border: 1px solid #bfbfbf;
	line-height: 34px;
	height: 34px;
	vertical-align: middle;
	padding-bottom: 5px;
} /*최근등록일 순 정리등 select */
.xans-product-additional .sort-wrap {
	position: relative;
}

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


</style>

</head>
<body>


	
	<%-- 상품 후기 게시판  --%>

	
		<div class="board">
			<span class="line"></span>
			<form name="frmList">
				<input type="hidden" name="sort" value> <input type="hidden"
					name="page_num" value> <input type="hidden" name="goodsno"
					value="56491">

				<div class="title_txt">
					<h2>PRODUCT REVIEW</h2>
					<div class="sort-wrap">
						<ul class="list_type1 old">
							<li>상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로
								이동될 수 있습니다.</li>
							<li>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 1:1문의에 남겨주세요.</li>
						</ul>


						<div class="sort" style="bottom: -9px">
							<select
								onchange="this.form.sort.value=this.value;this.form.submit()"">
								<option value="1">최근등록순</option>
								<option value="2">좋아요많은순</option>
								<option value="3">조회많은순</option>
							</select>
						</div>
					</div>
				</div>


				<table class="xans-board-listheader" width="100%" border="0"
					cellspacing="0">

					<colgroup>
						<col style="width: 70px;">
						<col style="width: auto;">
						<col style="width: 51px;">
						<col style="width: 77px;">
						<col style="width: 100px;">
						<col style="width: 40px;">
						<col style="width: 80px;">
					</colgroup>
					<tbody>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회</th>
						</tr>
					</tbody>
				</table>

				<c:set var="list" value="${List }" />
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="dto">
						<tr>
							<td>${dto.getR_num() }</td>
							<td><a
								href="<%=request.getContextPath()
						%>/user_review_content.do?num=${dto.getR_num()}">${dto.getR_title() }</a></td>
							<td>${dto.getUser_id() }</td>
							<td>${dto.getR_date() }</td>
							<td>${dto.getR_hit() }</td>

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
		<td colspan="5" align="right" style="border: none"><input
			type="button" value="후기쓰기" onclick="location.href='user_write.do'">
		</td>
		</table>
		</form>


		</div>
		</div>

		





</body>
</html>