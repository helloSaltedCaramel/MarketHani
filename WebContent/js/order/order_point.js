const $point_btn = document.getElementById('point_btn');
const $input_point = document.getElementById('input_point');
const $available_point = document.getElementById('avail_point');
const $totalPrice = document.getElementById('totalPrice');

// 화폐단위를 숫자로 바꾸어주는 함수
// 변환하려는 태그의 innerText에 작성된 화폐단위를 Number로 바꿔준다.
const toNumber = (element) => {
	return parseInt(element.innerText.replace(/,| /g, ""));
}

// 화폐단위로 바꾸어주는 함수
// Number를 String으로 변환 후 3자리마다 콤마(,)가 찍히도록 정규식 작성
const toMonetary = (price) => {
	return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

const totalPrice = toNumber($totalPrice);

const use_point = () => {
	const avail_point = parseInt($available_point.value);
	const input_point = parseInt($input_point.value);
	
	if(input_point > avail_point) {
		alert('입력가능한 최대 적립금은' + toMonetary(avail_point) + '원 입니다. 다시 입력해주세요.');
		$input_point.value = 0;
		return;
	}	
	
	$input_point.value = input_point;	
	const $using_point = document.getElementById('using_point');
	$using_point.innerHTML = "-" + toMonetary(input_point);
	
	const discountedPrice = totalPrice - input_point;	
	
	document.getElementById('totalPrice_btn').innerHTML = toMonetary(discountedPrice);
	$totalPrice.innerHTML = toMonetary(discountedPrice);
}

$point_btn.addEventListener('click', use_point);
$input_point.addEventListener('focus', () => {$input_point.value = ''});