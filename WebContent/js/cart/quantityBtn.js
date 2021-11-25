const $plusBtns = document.getElementsByClassName('btn minus');
const $minusBtns = document.getElementsByClassName('btn plus');
const $deleteBtns = document.getElementsByClassName('delete_btn');
const $costPrice = document.querySelector('#costPrice');
const $totalPrice = document.querySelector('#totalPrice');
const $discountedPrice = document.querySelector('#discountedPrice');
const $delivery_cost = document.querySelector("#delivery_cost");

let costPrice = parseInt($costPrice.innerText.replace(/,| /g, "")); 						// 원가
let totalPrice = parseInt($totalPrice.innerText.replace(/,| /g, ""));						// 총 합계

// 수량 감소 함수
const decreaseQty = (e) => {
	// 수량이 1미만으로 내려가면 안되므로 조건맞는지 체크
	let $quantity_num = e.target.nextElementSibling;	
	if($quantity_num.value == 1) {
		alert('최소 수량은 1이어야합니다.');
		return;
	}
	
	// cartNum value 가져오기	
	const $cartNum = e.target.parentNode.firstChild.nextElementSibling.value;
	
	// 이벤트 발생한 제품의 원가, 세일가격 확인
	const childNodes = e.target.parentNode.childNodes;
	const p_price = parseInt(childNodes[3].value);
	const sale_price = parseInt(childNodes[5].value);
	
	// 이벤트 발생한 태그의 부모의 부모 태그를 가져오고, 이벤트 발생한 제품의 가격 표시되는 자식태그 찾기
	const $grandParent = e.target.parentNode.parentNode;
	const $p_salePrice = $grandParent.querySelector('#product_sale_price');
	const $p_costPrice = $grandParent.querySelector('#product_cost_price');
	
	// 가격 숫자로 변환
	// p_salePrice: 할인가, 만약 할인하지 않을 경우에는 원가로 취급된다.
	let p_salePrice = parseInt($p_salePrice.innerText.replace(/,| /g, ""));
	
	// p_costPrice : 원가, 제품이 할인상태이면 취소선으로 나오게되는 가격텍스트
	// 할인을 하지 않는 제품이 있을 경우에는 원가를 사용하지 않으므로 null이 아닐경우에만 작동하도록 한다.
	let p_costPrice;
	if($p_costPrice !== null) {
		p_costPrice = parseInt($p_costPrice.innerText.replace(/,| /g, ""));
	}

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
				
				$quantity_num.stepDown();
				costPrice -= p_price;
				totalPrice -= sale_price;
				
				// $totalPrice가 3만원 이상일 때, 배송비 3000원 추가
				if(totalPrice < 30000) {
					$delivery_cost.innerHTML = '3,000';
				}
				
				$discountedPrice.innerHTML = (totalPrice - costPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$costPrice.innerHTML = costPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$totalPrice.innerHTML = delivery_check(totalPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

				p_salePrice -= sale_price;
				$p_salePrice.innerHTML = p_salePrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				
				if($p_costPrice !== null) {
					p_costPrice -= p_price;
					$p_costPrice.innerHTML = p_costPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				}
				
			} else if(isSuccess === "error"){
				alert('알 수 없는 오류가 발생했습니다.');
			}
		},
		error: function() {
			alert('서버 통신에 실패하였습니다. 잠시 후 다시 시도해주세요.');
		}
	});
}

// 수량 증가 함수
const increaseQty = (e) => {
	// 수량, 제품번호 가져오기
	let $quantity_num = e.target.previousElementSibling;
	const $cartNum = e.target.parentNode.firstChild.nextElementSibling.value;
	
	// 제품 원가, 할인 가격 가져오기
	const childNodes = e.target.parentNode.childNodes;
	const p_price = parseInt(childNodes[3].value);
	const sale_price = parseInt(childNodes[5].value);	
	
	// 이벤트 발생한 태그의 부모의 부모 태그를 가져오고, 이벤트 발생한 제품의 가격 표시되는 자식태그 찾기
	const $grandParent = e.target.parentNode.parentNode;
	const $p_salePrice = $grandParent.querySelector('#product_sale_price');
	const $p_costPrice = $grandParent.querySelector('#product_cost_price');
	
	// 가격 숫자로 변환
	// p_salePrice: 할인가, 만약 할인하지 않을 경우에는 원가로 취급된다.
	let p_salePrice = parseInt($p_salePrice.innerText.replace(/,| /g, ""));
	
	// p_costPrice : 원가, 제품이 할인상태이면 취소선으로 나오게되는 가격텍스트
	let p_costPrice;
	if($p_costPrice !== null) {
		p_costPrice = parseInt($p_costPrice.innerText.replace(/,| /g, ""));
	}

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
				
				// 수량 1 증가, 상품금액, 결제예정금액에 해당 제품의 가격 추가
				$quantity_num.stepUp();
				costPrice += p_price;
				totalPrice += sale_price;
								
				$discountedPrice.innerHTML = (totalPrice - costPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$costPrice.innerHTML = costPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$totalPrice.innerHTML = delivery_check(totalPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				
				p_salePrice += sale_price;
				$p_salePrice.innerHTML = p_salePrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				
				if($p_costPrice !== null) {
					p_costPrice += p_price;
					$p_costPrice.innerHTML = p_costPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				}

			} else if(isSuccess === "error"){
				alert('CartData 오류 발생, 확인필요');
			}
		},
		error: function() {
			alert('서버 통신에 실패하였습니다. 잠시 후 다시 시도해주세요.');
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
					
					$discountedPrice.innerHTML = (totalPrice - costPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					$costPrice.innerHTML = costPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					$totalPrice.innerHTML = delivery_check(totalPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

					e.target.parentNode.parentNode.remove();
					return;
				} 
				
				if(isDeleted === "error") {
					alert('오류가 발생하였습니다: CartDeleteProduct.java');
					return;
				}
								
				alert('알 수 없는 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.');
			},
			error: function() {
				alert('서버 통신에 실패하였습니다. 잠시 후 다시 시도해주세요.');
			}	
		});
	}
}

// 배송비 확인 함수
const delivery_check = (totalPrice) => {
	// $totalPrice가 3만원 이상일 때, 배송비 0원으로 설정
	if(totalPrice >= 30000) {
		$delivery_cost.innerHTML = '0';
	} else {
		$delivery_cost.innerHTML = '3,000';
	}
	return totalPrice + parseInt($delivery_cost.innerText.replace(/,| /g, ""));		// 배송비
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