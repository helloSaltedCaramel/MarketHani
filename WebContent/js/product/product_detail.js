/*제품 상세 페이지 스크립트*/



function qnaList(paging, num) {
	
	let page = paging; 
	let p_num = num;
	
	$.ajax({
		url : "/Market_Hani/user_qna_select.do?p_num="+ p_num + "&page=" + page,
		datatype : 'xml',
		success : function(data){
			
			console.log('여기까지 오긴 하는걸까?');
			
			console.log($(data));
			
		},
		
		error : function(){
			alert('데이터가 전달되지 않습니다');
		}
	});
}


$(document).ready(function(){
	
	qnaList();
	
});


function onDisplay() {

		$('#shareLayer').toggle();

	}; // 공유하기 버튼 클릭시 보이고 안보이고

$(document).on('click','#ul_product a',function(event){
	var headerHeight = $('header').outerHeight();
  	event.preventDefault();
  	
	$("html,body").animate({
  		scrollTop : $(this.hash).offset().top - headerHeight
  	},800);
});//링크 클릭시 헤당 섹션으로 부드럽게 이동시키기

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
	$('.qna_revise_title').attr('value', qna_title);
	$('.qna_revise_content').append(qna_content);
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