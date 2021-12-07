const $disableBtns = document.getElementsByClassName('manage_btn delete');
const url = document.location.href;

const disableCheck = (e) => {
	const $parentNode = e.target.parentNode.parentNode;
	const p_num = $parentNode.querySelector('#productNum');
	
	if(confirm('제품을 비활성화 시킬 경우 제품목록에 보이지 않게됩니다.')) {
		location.href= getContextPath() + '/admin_prod_disable.do?p_num=' + p_num.value + '&url=user_new.do';
	}
}

for(btn of $disableBtns) {
	btn.addEventListener('click', disableCheck);
}
