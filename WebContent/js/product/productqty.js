const $result = document.getElementById('result');
const $totalPrice = document.getElementById('totalPrice');
const $plus_btn = document.getElementById('plusbtn');
const $minus_btn = document.getElementById('minusbtn');
const $addCart_btn = document.getElementById('addCart_btn');
const $p_num = document.getElementById('p_num');

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

// 총 상품금액, 수량 변수 저장
const totalPrice = toNumber($totalPrice); // 2900
let quantity = toNumber($result); // 1

// 수량 증가 함수
const increaseQty = () => {
	quantity += 1;
	const price = totalPrice * quantity;
	
	$result.innerHTML = quantity;
	$totalPrice.innerHTML = toMonetary(price);	
};

// 수량 감소 함수
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

const addCart = () => {
	
		$.ajax({
		type: "post",
		url: getContextPath() + "/addcart",
		async: true,
		timeout: 3000,
		data: { "p_num" : $p_num.value,
						"quantity" : quantity },
		dataType: "text",
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		success: function(isAdded) {
			if(isAdded === "true") {
				alert('장바구니에 상품이 추가되었습니다. 장바구니에 이미 상품이 추가되어있을 경우 수량만큼 추가됩니다.');
				// 추가되었다는 메시지 출력, 모달?
				
			} else if(isAdded === "request login"){
					alert('로그인이 필요한 기능입니다.');
					location.href = getContextPath() + "/user/user_login.jsp";
			} else {
					alert('CartDTO 오류 발생, 확인필요');
			}
		},
		error: function() {
			alert('일시적으로 요청이 많아 장바구니 추가에 실패하였습니다. 잠시후 다시 시도해주세요.');
		}
	});
	
}

// js로 contextPath 구하기
const getContextPath = () => {
	const hostIndex = location.href.indexOf(location.host) + location.host.length;
	const contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
	return contextPath
}

$addCart_btn.addEventListener('click', addCart);
$plus_btn.addEventListener('click', increaseQty);
$minus_btn.addEventListener('click', decreaseQty);


/*
console.log(totalPrice);
console.log(quantity);
*/

