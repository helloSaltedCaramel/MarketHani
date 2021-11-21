<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

	body {
		color: #4c4c4c;
		font-family: 'Noto Sans KR', sans-serif; 
		font-size: 12px;
	    line-height: 1;
    	letter-spacing: -.05em;
	}
	
	ul {
		list-style-type: none;
	}
	
	.qna_container{
		width: 1010px;
	}
	
	.qna_header{
		padding-bottom: 38px;
    	font-family: Noto Sans;
	}
	
	.qna_header strong {
	    display: block;
	    padding-bottom: 16px;
	    font-size: 16px;
	    font-weight: 700;
	    line-height: 24px;
	    color: #333;
	}
	
	.qna_header ul {
	    font-family: Noto Sans;
	    font-size: 14px;
	    line-height: 24px;
	    font-weight: 400;
	    color: #999;
	    padding: 0;
	}
	
	.qna_header ul li {
    	padding-left: 12px;
	}
	
	.qna_header ul li:before {
	    display: inline-block;
	    width: 2px;
	    height: 2px;
	    margin: 11px 6px 0 -10px;
	    background: #999;
	    vertical-align: top;
	    content: "";
	}
	
	.qna_header ul li a {
	    font-weight: 700;
	    color: #999;
	    text-decoration: underline;
	}
	
	.qna_content {
	    position: relative;
	    font-family: Noto Sans;
	    border-top: 2px solid #333;
	    width: 1010px;
	}


	.qna_content_title {
	    display: table;
	    table-layout: fixed;
	    border-bottom: 1px solid #333;
	}
	
	.qna_content_title div {
	    display: table-cell;
	    text-align: center;
	    padding: 18px 0 20px;
	    width: 100px;
	    font-family: Noto Sans;
	    font-size: 14px;
	    line-height: 20px;
	    font-weight: 700;
	    letter-spacing: -.5px;
	    color: #333;
	}
	
	.qna_notice_list {
		position: relative;
	}
	.qna_content_list {
		position: relative;
	}
	
	.qna_button {
		position: relative;
	}
	
	.qna_notice_item {
	    display: table;
	    width: 100%;
	    table-layout: fixed;
	    padding: 16px 0;
	    font-family: Noto Sans;
	    font-size: 14px;
	    line-height: 20px;
	    text-align: center;
	    border-bottom: 1px solid #f4f4f4;
		padding: 0;
    	height: 61px;
	}

	
	.item-cell {
	    display: table-cell;
	    vertical-align: middle;
	    width: 100px;
	}
	
	
	.notice-cell {
		display: table-cell;
	    vertical-align: middle;
	    width: 710px;
	    text-align: left;
	    padding: 0 20px;
	    min-height: 22px;
	    box-sizing: border-box;
	    cursor: pointer;
	}
	
	.notice-cell span {
	    display: inline-block;
	    overflow: hidden;
	    border-radius: 4px;
	    margin-right: 12px;
	    padding: 0 8px;
	    font-size: 12px;
	    line-height: 22px;
	    font-weight: 500;
	    color: #666;
	    background: hsla(0,0%,40%,.06);
	    vertical-align: top;
	}
	
	.notice-cell strong {
	    display: inline-block;
	    overflow: hidden;
	    max-width: 613px;
	    font-size: 14px;
	    font-weight: 700;
	    line-height: 40px;
	    color: #333;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    vertical-align: top;
	}

	
</style>
</head>
<body>
	
	<div align="center" width="1050">
	
		<h3>user_detail 페이지 아래에 붙일 내용들</h3>
		<hr width="50%">
		<div class="contents">
		
			<div class="qna_container">
				<div class="qna_header" align="left">
					<strong>PRODUCT Q&A</strong>
					<ul>
						<li>상품에 대한 문의를 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
						<li>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 <a>1:1문의</a>에 남겨주세요.</li>
					</ul>
				</div>
				
				<div class="qna_content">
					<div class="qna_content_title">
						<div style="width: 710px;">제목</div>
						<div>작성자</div>
						<div>작성일</div>
						<div>답변상태</div>
					</div>
					
					<%-- 비밀글 여부 표시 필요 : isSecret() 기능 필요 --%>
					<ul class="qna_notice_list">
						<li class="qna_notice_item">
							<div class="notice-cell">
								<span>공지</span>
								<strong>판매 (일시)중단 제품 안내 (21.11.12 업데이트)</strong>
							</div>
							<div class="item-cell"><p>Marketkurly</p></div>
							<div class="item-cell"><p>2021.11.18</p></div>
							<div class="item-cell"><p>-</p></div>
						</li>
					</ul>
					
					.item-cell notice-cell
	.item-cell
	
					
					<ul class="qna_content_list">
						<li class="qna_content_item">
							<div></div>
							<div></div>
							<div></div>
							<div></div>
						</li>
					</ul>
					
					<%-- Q&A 버튼의 활성화 유무 표시 필요함: 리뷰작성 가능 여부 판별 기능) --%>
					<div class="qna_button">
						<div class="qna_paging_nav">
							<button type="button" class="prev"><span>이전</span></button>
							<button type="button" class="next"><span>다음</span></button>
						</div>
						<button class="qna_write_btn">
							<span>문의하기</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>