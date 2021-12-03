const cart_btns = document.getElementsByClassName('btn_cart');

const addCart = (e) => {
	const parent = e.target.parentNode;
	const p_num = parent.previousSibling.previousSibling;

	$.ajax({
		type: "post",
		url: getContextPath() + "/addcart",
		async: true,
		timeout: 3000,
		data: { "p_num" : p_num.value },
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
};

for(element of cart_btns) {
	element.addEventListener('click', addCart);
}


// js로 contextPath 구하기
const getContextPath = () => {
	const hostIndex = location.href.indexOf(location.host) + location.host.length;
	const contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
	return contextPath
}
