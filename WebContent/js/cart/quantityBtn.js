const $plusBtns = document.getElementsByClassName('btn minus');
const $minusBtns = document.getElementsByClassName('btn plus');
const $deleteBtns = document.getElementsByClassName('delete_btn');
const $costPrice = document.querySelector('#costPrice');
const $totalPrice = document.querySelector('#totalPrice');
const $discountedPrice = document.querySelector('#discountedPrice');
const $delivery_cost = document.querySelector("#delivery_cost");

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


let costPrice = toNumber($costPrice); 																	// 상품금액(원가)
let totalPrice = toNumber($totalPrice);																	// 결제예정금액(종 합계)
let discountedPrice = toNumber($discountedPrice);												// 상품할인금액
let deliveryCost = toNumber($delivery_cost) === 3000 ? true : false; 		// 배송비: JSP에서 금액을 받아왔을 때 3만원이 넘어있으면 true, 아니면 false

// decreaseQty: 각 제품의 '-' 버튼을 클릭하면 수량이 감소되는 함수이다.
const decreaseQty = (e) => {
	
	// 수량이 1미만으로 내려가면 안되므로 조건맞는지 체크
	let $quantity_num = e.target.nextElementSibling;	
	if($quantity_num.value == 1) {
		alert('최소 수량은 1이어야합니다.');
		return;
	}
	
	// 제품번호 가져오기(input hidden)
	const $cartNum = e.target.parentNode.firstChild.nextElementSibling.value;
	
	// 제품의 원가, 할인가 가져오기
	const childNodes = e.target.parentNode.childNodes;
	const p_price = parseInt(childNodes[3].value);
	const sale_price = parseInt(childNodes[5].value);
	
	// 개수를 감소시켰을 때 해당 제품의 가격표를 감소시키기 위해 해당 태그 querySelector 가져오기
	// p_salePrice = 할인가 태그, p_costPrice = 원가 태그
	const $grandParent = e.target.parentNode.parentNode;
	const $p_salePrice = $grandParent.querySelector('#product_sale_price');
	const $p_costPrice = $grandParent.querySelector('#product_cost_price');
	
	/*
	 * 이벤트가 발생했을 때 해당 제품의 원가와 할인가 가져오기
	 * p_salePrice: 할인가, 만약 할인하지 않을 경우에는 원가가 입력된다.
	 * p_costPrice: 제품이 할인상태이면 취소선으로 나오게되는 원가, 할인하지 않을 경우에는 null로 나오게된다.
	 * 할인을 하지 않는 제품은 p_costPrice의 innerText가 null이므로 이 경우 p_salePrice와 값이 같도록 설정해준다.
	 * p_discountedPrice: 할인가와 원가를 뺀 값. 상품할인금액(discountedPrice)을 감소시키기 위해서 사용한다. 
	 */
	let p_salePrice = toNumber($p_salePrice);
	let p_costPrice = ($p_costPrice !== null) ? toNumber($p_costPrice) : p_salePrice;
	const p_discountedPrice = (p_salePrice - p_costPrice) / parseInt($quantity_num.value);

	$.ajax({
		type: "post",
		url: getContextPath() + "/cart_quantity",
		async: true,
		timeout: 1000,
		data: { "cart_num" : $cartNum,
						"type" : "decrease" },
		dataType: "text",
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		success: function(isSuccess) {
			
			if(isSuccess === "updated") {
				
				// 수량을 1 감소시키고 상품금액, 결제예정금액, 상품할인금액을 제품의 원가, 할인가 만큼 감소시킨다.
				$quantity_num.value = parseInt($quantity_num.value) - 1;
				costPrice -= p_price;
				totalPrice -= sale_price;
				discountedPrice -= p_discountedPrice;
				
				// 각 항목의 innerHTML을 화폐단위로 변환후 수정한다.
				$discountedPrice.innerHTML = toMonetary(discountedPrice);
				$costPrice.innerHTML = toMonetary(costPrice);
				deliveryCheck();
				$totalPrice.innerHTML = toMonetary(totalPrice);
				
				p_salePrice -= sale_price;
				$p_salePrice.innerHTML = toMonetary(p_salePrice);
				
				if($p_costPrice !== null) {
					p_costPrice -= p_price;
					$p_costPrice.innerHTML = toMonetary(p_costPrice);
				}
			} else if(isSuccess === "error"){
				alert('오류가 발생하였습니다. 관리자에게 문의해주세요. (error: CartData_decrease)');
			}
		},
		error: function() {
			alert('서버와의 연결이 원활하지 않습니다. 잠시 후 다시 시도해주세요.');
		}
	});
}

// 각 제품의 '+' 버튼을 클릭하면 수량이 증가하는 함수이다.
const increaseQty = (e) => {
	// 수량, 제품번호 가져오기
	const $quantity_num = e.target.previousElementSibling;
	const $cartNum = e.target.parentNode.firstChild.nextElementSibling.value;
	const p_qty = parseInt(e.target.nextElementSibling.value);

	// 이벤트 발생한 제품의 최대수량 이상으로 증가시킬 경우 메시지 출력
	if(parseInt($quantity_num.value) === p_qty) {
		alert('해당 제품의 주문가능한 최대 수량은 ' + p_qty + '개 입니다.');
		return;
	}
	
	// 제품 원가, 할인 가격 가져오기
	const childNodes = e.target.parentNode.childNodes;
	const p_price = parseInt(childNodes[3].value);
	const sale_price = parseInt(childNodes[5].value);	
	
	// 이벤트 발생한 태그의 부모의 부모 태그를 가져오고, 이벤트 발생한 제품의 가격 표시되는 자식태그 찾기
	const $grandParent = e.target.parentNode.parentNode;
	const $p_salePrice = $grandParent.querySelector('#product_sale_price');
	const $p_costPrice = $grandParent.querySelector('#product_cost_price');
	
	let p_salePrice = toNumber($p_salePrice);
	let p_costPrice = ($p_costPrice !== null) ? toNumber($p_costPrice) : p_salePrice;
	const p_discountedPrice = (p_salePrice - p_costPrice) / parseInt($quantity_num.value);

	$.ajax({
		type: "post",
		url: getContextPath() + "/cart_quantity",
		async: true,
		timeout: 1000,
		data: { "cart_num" : $cartNum,
						"type" : "increase" },
		dataType: "text",
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		success: function(isSuccess) {
			
			if(isSuccess === "updated") {
				
				$quantity_num.value = parseInt($quantity_num.value) + 1;
				costPrice += p_price;
				totalPrice += sale_price;
				discountedPrice += p_discountedPrice;
								
				$discountedPrice.innerHTML = toMonetary(discountedPrice);
				$costPrice.innerHTML = toMonetary(costPrice);
				deliveryCheck();
				$totalPrice.innerHTML = toMonetary(totalPrice);
				
				p_salePrice += sale_price;
				$p_salePrice.innerHTML = toMonetary(p_salePrice);
				
				if($p_costPrice !== null) {
					p_costPrice += p_price;
					$p_costPrice.innerHTML = toMonetary(p_costPrice);
				}
				
			} else if(isSuccess === "error"){
				alert('오류가 발생하였습니다. 관리자에게 문의해주세요. (error: CartData_increase)');
			}
		},
		error: function() {
			alert('서버와의 연결이 원활하지 않습니다. 잠시 후 다시 시도해주세요.');
		}
	});
}

const deleteProduct = (e) => {
	if(confirm('해당 상품을 삭제하시겠습니까?')) {
		const $quantity = e.target.parentNode.querySelector('.quantity').childNodes;
		const cart_num = $quantity[1].value;
				
		$.ajax({
			type: "post",
			url: getContextPath() + "/cart_delete",
			async: true,
			timeout: 1000,
			data: { "cart_num" : cart_num },
			dataType: "text",
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success: function(isDeleted) {
				
				if(isDeleted === "deleted") {
					
					let p_price = $quantity[3].value;
					let sale_price = $quantity[5].value;
					const quantity = $quantity[9].value;

					costPrice -= p_price * quantity;
					totalPrice -= (p_price === sale_price) ? p_price * quantity : sale_price * quantity; 
					discountedPrice -= (sale_price - p_price) * quantity;
					
					$discountedPrice.innerHTML = toMonetary(discountedPrice);
					$costPrice.innerHTML = toMonetary(costPrice);
					deliveryCheck();
					$totalPrice.innerHTML = toMonetary(totalPrice);
					
					e.target.parentNode.parentNode.remove();
					return;
				} 
				
				if(isDeleted === "error") {
					alert('오류가 발생하였습니다. 관리자에게 문의해주세요. (error: CartData_delete)');
					return;
				}
								
				alert('알 수 없는 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.');
			},
			error: function() {
				alert('서버와의 연결이 원활하지 않습니다. 잠시 후 다시 시도해주세요.');
			}	
		});
	}
}

// 배송비 확인 함수 :  totalPrice가 3만원 이상일 경우에는 배송비 0원, 3만원 미만이면 3000원으로 처리
const deliveryCheck = () => {
	if((costPrice + discountedPrice) >= 30000) {
		$delivery_cost.innerHTML = '0';
		if(deliveryCost) {
			totalPrice -= 3000;
			deliveryCost = false;
		}
	} else {
		$delivery_cost.innerHTML = '3,000';
		if(!deliveryCost) {
			totalPrice += 3000;
			deliveryCost = true;
		}
	}
}

// EventListener 추가하기
for(plusbtn of $plusBtns) {plusbtn.addEventListener('click', decreaseQty);}
for(minusbtn of $minusBtns) {minusbtn.addEventListener('click', increaseQty);}
for(deletebtn of $deleteBtns) {deletebtn.addEventListener('click', deleteProduct);}

const getContextPath = () => {
	const hostIndex = location.href.indexOf(location.host) + location.host.length;
	const contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
	return contextPath
}