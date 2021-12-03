const $result = document.getElementById('result');
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

let totalPrice = toNumber($totalPrice); // 2900
let quantity = toNumber($result); // 1

console.log(totalPrice);
console.log(quantity);