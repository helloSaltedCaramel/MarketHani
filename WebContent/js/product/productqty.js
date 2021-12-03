const $result = document.getElementById('result');
const $totalPrice = document.getElementById('totalPrice');
const $plus_btn = document.getElementById('plusbtn');
const $minus_btn = document.getElementById('minusbtn');

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

const totalPrice = toNumber($totalPrice); // 2900
let quantity = toNumber($result); // 1

const increaseQty = () => {
	quantity += 1;
	const price = totalPrice * quantity;
	
	$result.innerHTML = quantity;
	$totalPrice.innerHTML = toMonetary(price);	
};

const decreaseQty = () => {
	if(quantity === 1) {
		alert('최소수량은 1이어야 합니다.');
		return;
	}
	
	quantity -= 1;
	const price = totalPrice * quantity;
	
	$result.innerHTML = quantity;
	$totalPrice.innerHTML = toMonetary(price);	
};

$plus_btn.addEventListener('click', increaseQty);
$minus_btn.addEventListener('click', decreaseQty);

/*
console.log(totalPrice);
console.log(quantity);
*/

