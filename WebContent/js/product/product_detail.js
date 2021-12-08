/*제품 상세 페이지 스크립트*/



//페이지 로딩 시 비동기식 처리를 통해 QnA 전체 리스트를 보여주는 함수  
function qnaList(p_num, page, id) {
	
	$.ajax({
		url : "user_qna_select.do?p_num=" + p_num +"&page=" + page, 
		datatype : "xml",
		success : function(data) {
	
			// 테이블 비우기 	
			$('.qna_content_list').empty();
		
			let str = "";
		
			// QnA 리스트 출력 
			$(data).find("qna").each(function(i){
				
				let title = $(this).find("qna_title").text();
				let content = $(this).find("qna_content").text();
				let num = $(this).find("qna_num").text();
				let secret = $(this).find("qna_secret").text();
				let date = $(this).find("qna_date").text();
				let user_id = $(this).find("user_id").text();
				let status = $(this).find("qna_status").text();
				let answer = $(this).find("qna_answer").text();
				
				str += '<li class="qna_content_item">';
				
				// 비밀 글 : 제목 클릭 시 모달 함수 호출("비밀글입니다")				
				if(secret == 1){
					
					str += "<div class='content-cell secret' onclick='showSecret();'>\
									<strong id='secret_title'>\
										비밀글입니다.&nbsp;&nbsp;<img src='./img/product/qna_secret.svg'>\
									</strong>\
								</div>";
				}else{
				
					str += "<div class='content-cell' onclick='expandQna(" + i + ");'>\
									<strong id='question_title'>"
										+ title + 
									"</strong>\
								</div>";
				}
				
				str += '<div class="item-cell"><p>' + user_id + '</p></div>\
						    <div class="item-cell"><p>' + date + '</p></div>';
		
				str += '<div class="item-cell"><p>';
				
				
				if(status == 1){

					str += '<font color="#5f0081">답변완료</font>';
				}else{
					
					str += '답변대기';
				}
				
				str += '</p></div></li>';
				
				// 토글 함수에 들어가는 id값 설정하기 위한 div 
				str += '<div class="expand_div" id="' + i + '">';
				
				// 비밀 글이 아닐 때에만 질문/답변 확장 영역 로딩 
				if(secret != 1){
					
					// 질문 영역 
					if(content != 'null'){
						
						str += '<li class="qna_content_item expand">\
										<div class="content-cell expand">\
											<span><img class="qna_mark" src="./img/product/qna_question_mark.svg"></span>\
											<span><strong>' + content + '</strong></span>';
											
						if(user_id === id){
							
							str +=			'<div class="item-cell update">\
												<p>\
													<a onclick="showRevise(' + 
														num + ", '" + title + "', '" + content + "'" + ');">\
														수정\
													</a>&nbsp;&nbsp;&nbsp;\
													<a onclick="if(confirm(' + "'작성한 문의를 삭제하시겠습니까?'" + ')){'
														+ 'location.href=' +"'user_qna_delete.do?qna_num=" + num + "'" + ';'
														+ 'showDeleteConfirm();\
													}else{return; };">\
														삭제\
													</a>\
												</p>\
											</div>';
						}						
						
					str +=				'</div>\
								</li>';
								
					}else if(content == 'null'){
						
						str += '<li class="qna_content_item expand">\
										<div class="content-cell expand">\
											<span><img class="qna_mark" src="./img/product/qna_question_mark.svg"></span>\
											<span><strong><font color="#5f0081">작성하신 내용이 없습니다</font></strong></span>';
								
						if(user_id === id){
							
								str +=		'<div class="item-cell update">\
												<p>\
													<a onclick="showRevise(' + 
														num + ", '" + title + "', '" + content + "'" + ');">\
														수정\
													</a>&nbsp;&nbsp;&nbsp;\
													<a onclick="if(confirm(' + "'작성한 문의를 삭제하시겠습니까?'" + ')){'
														+ 'location.href=' +"'user_qna_delete.do?qna_num=" + num + "'" + ';'
														+ 'showDeleteConfirm();\
													}else{return; };">\
														삭제\
													</a>\
												</p>\
											</div>';
						}						
								
											
							str +=		'</div> \
								</li>';
					}
					
					// 답변 영역  - 답변이 있을 경우에만
					if(answer != 'null'){
						
						str += '<li class="qna_content_item expand">\
									<div class="content-cell expand">\
										<span><img class="qna_mark" src="./img/product/qna_answer_mark.svg"></span>\
										<span><strong>'+ answer +'</strong></span>\
									</div>\
							   </li>' 
					}
				}
				
				str += '</div>';
		
			});
			
			$('.qna_content_list').append(str);
					
			let allPage = $(data).find("pagination").find("allPage").text();
			
			if(page == 1){
				$('.prev').attr('disabled', true);
				$('.prev').css('background', 'url(./img/product/qna_page_prev_disabled.svg) 50% 0 no-repeat');
			}else{
				$('.prev').attr('disabled', false);
				$('.prev').attr('onclick', 'qnaList(' + p_num + ', ' + (page - 1) + ')');	
				$('.prev').css('background', 'url(./img/product/qna_page_prev.svg) 50% 0 no-repeat');
			}
			
			if(page == allPage){
				$('.next').attr('disabled', true);
				$('.next').css('background', 'url(./img/product/qna_page_next_disabled.svg) 50% 0 no-repeat');
			}else{
				$('.next').attr('disabled', false);
				$('.next').attr('onclick', 'qnaList(' + p_num + ', ' + (page + 1) + ')');
				$('.next').css('background', 'url(./img/product/qna_page_next.svg) 50% 0 no-repeat');
			}
				
			
		},
		
		error : function(){
			
			$('.qna_content_list').append('<li><strong>등록된 문의가 없습니다.</strong></li>');
		}
	});
}

function isSecret() {

	if($('.secret_check').prop('checked') == false){
		
		$('.secret_check').prop('checked', true);
		$('.secret_check_ico').css('background-image', 'url(./img/product/qna_write_checked.svg)');
	}else{
		
		$('.secret_check').prop('checked', false);
		$('.secret_check_ico').css('background-image', 'url(./img/product/qna_write_unchecked.svg)');
	}
	
}

function isSecretRevise() {

	if($('.secret_check.revise').prop('checked') == false){
		
		$('.secret_check.revise').prop('checked', true);
		$('.secret_check_ico.revise').css('background-image', 'url(./img/product/qna_write_checked.svg)');
	}else{
		
		$('.secret_check.revise').prop('checked', false);
		$('.secret_check_ico.revise').css('background-image', 'url(./img/product/qna_write_unchecked.svg)');
	}
	
}

function onDisplay() {

		$('#shareLayer').toggle();

} // 공유하기 버튼 클릭시 보이고 안보이고

$(document).on('click','#ul_product a',function(event){
  var headerHeight = $('header').outerHeight();
  event.preventDefault();
     $("html,body").animate({
       scrollTop : $(this.hash).offset().top - headerHeight
    },400)
});//탭 클릭시 헤당 섹션으로 부드럽게 이동시키기

$(window).scroll(function () {
   var scroll = $(window).scrollTop();
      if (scroll < 700) {
      $("#topUp a").stop().animate({
      'right':"50px",
         opacity: "0",
          }, 200);

	  }else {
        $("#topUp a").stop().animate({
           'right': "60px",
           opacity: "1",
        }, 200);
      }
});
//위로 가기 버튼 클릭시 헤당 섹션으로 부드럽게 이동시키기

function expandQna(num){
	
	$('.expand_div#' + num).toggle();
	
} // QnA 게시판 제목 클릭시 질문과 답변 토글

function showSecret(){
	
	$('.modal_overlay').show();
	$('.modal_dialog.warning').show();
	$('body').addClass('modal_body');
}/* "비밀글입니다" 메시지 보여주기 */

function hideSecret() {
	
	$('.modal_overlay').hide();
	$('.modal_dialog.warning').hide();
	$('body').removeClass('modal_body');
}/* "비밀글입니다" 메시지 감추기 */

function showWrite() {
	
	$('.modal_overlay').show();
	$('.modal_dialog_qna.write').show();
	$('body').addClass('modal_body');
}/* 질문작성창 보여주기 */

function hideWrite() {
	
	$('.modal_overlay').hide();
	$('.modal_dialog_qna.write').hide();
	$('body').removeClass('modal_body');
}/* 질문작성창 감추기 */

function hideWriteConfirm() {
	
	$('.modal_overlay').hide();
	$('.modal_dialog.confirm').hide();
	$('body').removeClass('modal_body');
}/* 작성완료 창 감추기 */

function showWriteFailure() {
	
	$('.modal_overlay').show();
	$('.modal_dialog.failure').show();
	$('body').addClass('modal_body');
}/* 작성실패창 보여주기 */

function hideWriteFailure() {
	
	$('.modal_overlay').hide();
	$('.modal_dialog.failure').hide();
	$('body').removeClass('modal_body');
}/* 작성실패 창 감추기 */

function showWriteConfirm() {
	
	$('.modal_overlay').show();
	$('.modal_dialog.confirm').show();
	$('body').addClass('modal_body');
	
}/* 작성완료 창 보여주기 */

function reloadQnA() {
	
	window.location.reload();
	
}/* QnA 테이블 새로고침 */

function showDelete() {
	
	$('.modal_overlay').show();
	$('.modal_dialog.delete').show();
	$('body').addClass('modal_body');
		
}/* 질문삭제 창 보여주기  */

function hideDelete() {
	
	$('.modal_overlay').hide();
	$('.modal_dialog.delete').hide();
	$('body').removeClass('modal_body');
		
}/* 질문삭제 창 감추기  */

function showDeleteConfirm(){
	$('.modal_overlay').show();
	$('.modal_dialog.delete_confirm').show();
	$('body').addClass('modal_body');
}/* 삭제확인 창 보여주기 */

function hideDeleteConfirm(){
	$('.modal_overlay').hide();
	$('.modal_dialog.delete_confirm').hide();
	$('body').removeClass('modal_body');
}/* 삭제확인 창 감추기 */

function showRevise(qna_num, qna_title, qna_content) {
	
	//받아온 각 데이터를 수정 폼에 전달
	$('.modal_input_title.revise').attr('value', qna_title);
	$('.modal_input_content.revise').append(qna_content);
	$('.modal_dialog_qna.revise').children('form').append('<input type="hidden" name="qna_num" value="' + qna_num + '">')
	
	//모달 보여주기
	$('.modal_overlay').show();
	$('.modal_dialog_qna.revise').show();
	$('body').addClass('modal_body');
		
}/* 질문수정 창 보여주기  */

function hideRevise() {
	
	$('.modal_overlay').hide();
	$('.modal_dialog_qna.revise').hide();
	$('body').removeClass('modal_body');
		
}/* 질문수정 창 감추기  */

function showReviseConfirm() {
	
	$('.modal_overlay').show();
	$('.modal_dialog.revise_confirm').show();
	$('body').addClass('modal_body');
}/* 질문수정완료 창 보여주기  */

function hideReviseConfirm() {
	
	$('.modal_overlay').hide();
	$('.modal_dialog.revise_confirm').hide();
	$('body').removeClass('modal_body');
}/* 질문수정완료 창 감추기  */