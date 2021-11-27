// 수령인 주소 입력 버튼
const $modify_btn = document.querySelector('.modify_btn');

// 모달 창 취소버튼
const $btn_cancel = document.querySelector('.btn_cancel');

// modal 배경, modal 창 
const $modal_bg = document.querySelector('.modal_bg');
const $to_order_modal = document.querySelector('.to_order_modal');

// 저장 버튼 
const $btn_save = document.querySelector('.modal_button_block .btn_save');

const modal_on = () => {
	$modal_bg.style.display = 'block';
	$to_order_modal.style.display = 'block';
	document.body.style.overflow = 'hidden';
}

const modal_off = () => {
	$modal_bg.style.display = 'none';
	$to_order_modal.style.display = 'none';
	document.body.style.overflow = 'auto';
}

const toInput = (name, phone, msg) => {
	document.getElementById('receiver_text').innerHTML = name;
	document.getElementById('receiver_input').value = name;
	document.getElementById('phone_text').innerHTML = phone;
	document.getElementById('receiver_phone_input').value = phone;
	document.getElementById('message_text').innerHTML = msg;
	document.getElementById('receiver_msg_input').value = msg;
	
	document.querySelector('.receiver_info').style.display = 'none';
	document.querySelector('#receiver').style.display = 'block';
	document.querySelector('#receiver').style.paddingTop = '0';
	document.querySelector('#receiver_phone').style.display = 'block';
	document.querySelector('#receiver_message').style.display = 'block';
	
	modal_off();
}

const toInputCheck = () => {
	// 이름, 휴대폰 번호 정규식
  const name_regex = /^[가-힣]{2,4}$/;
  const phone_regex = /^01[0-9][0-9]{8}$/g;

	const name = document.getElementById('to_name').value;
	const phone = document.getElementById('to_phone').value;
	const msg = document.getElementById('to_message').value;
	
	if(name === '' || phone === '') {
		alert('이름, 휴대폰 번호는 필수 입력값입니다.');
		return;
	}
	
	if(!name_regex.test(name)) {
		alert('올바른 이름을 입력해주세요.');
		return;
	}
	
	if(!phone_regex.test(phone)) {
		alert('올바른 휴대폰 번호를 입력해주세요.');
		return;
	}
	
	if(msg === '') {
		if(confirm('배송메시지를 입력하지 않고 진행하시겠습니까?')) {
			toInput(name, phone, '없음');
			return;
		}
	}
	
	toInput(name, phone, msg);
}



$modify_btn.addEventListener('click', modal_on);
$btn_cancel.addEventListener('click', modal_off);
$btn_save.addEventListener('click', toInputCheck);