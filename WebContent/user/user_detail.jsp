<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%-- include product_qna.css --%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/product_qna.css" />

</head>
<body>
	
	<div align="center" width="1050">
	
		<h3>user_detail 페이지 아래에 붙일 내용들</h3>
		<hr width="50%">
		
		<div class="contents">
		
			<%-- 여기부터 시작 --%>
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
					
					<ul class="qna_content_list">
						<li class="qna_content_item">
							<div class="content-cell">
								<strong>부스러기가 너무 많아요</strong>
							</div>
							<div class="item-cell"><p>김*현</p></div>
							<div class="item-cell"><p>2021.11.19</p></div>
							<div class="item-cell"><p>답변대기</p></div>
						</li>
						
						<li class="qna_content_item">
							<div class="content-cell">
								<strong>언제 생산된 제품인 지 알 수 있나요?</strong>
							</div>
							<div class="item-cell"><p>이*욱</p></div>
							<div class="item-cell"><p>2021.11.18</p></div>
							<div class="item-cell"><p>답변대기</p></div>
						</li>
						
						<li class="qna_content_item">
							<div class="content-cell">
								<strong>배송 일정 문의드립니다</strong>
							</div>
							<div class="item-cell"><p>박*신</p></div>
							<div class="item-cell"><p>2021.11.18</p></div>
							<div class="item-cell"><p>답변대기</p></div>
						</li>
						
						<li class="qna_content_item">
							<div class="content-cell">
								<strong>재입고 문의</strong>
							</div>
							<div class="item-cell"><p>김*수</p></div>
							<div class="item-cell"><p>2021.11.16</p></div>
							<div class="item-cell"><p>답변대기</p></div>
						</li>
					</ul>
					
					<%-- Q&A 버튼의 활성화 유무 표시 필요함: 리뷰작성 가능 여부 판별 기능) --%>
					<div class="qna_button_area">
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
			<%-- 여기까지 --%>
		</div>
	</div>

</body>
</html>