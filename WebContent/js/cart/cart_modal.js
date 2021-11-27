// modal 검은색 배경
const $modal_bg = document.querySelector('.modal_bg');
const $cart_modal = document.querySelector('.cart_modal');

const $addr_btn = document.querySelector('.result_address .btn_default');
const $modal_btn_cancel = document.querySelector('.modal_input_btn.cancel');

const modal_on = () => {
	$modal_bg.style.display = 'block';
	$cart_modal.style.display = 'block';
	document.body.style.overflow = 'hidden';
}

const modal_off = () => {
	$modal_bg.style.display = 'none';
	$cart_modal.style.display = 'none';
	document.body.style.overflow = 'auto';
}

const inputAddress = () => {
	const address = document.getElementById('modal_address').value + " " + document.getElementById('modal_address_detail').value;
	document.getElementById('input_address').value = address;
	document.getElementById('address_text').innerHTML = address;
	
	modal_off();
}

$addr_btn.addEventListener('click', modal_on);
$modal_btn_cancel.addEventListener('click', modal_off);
