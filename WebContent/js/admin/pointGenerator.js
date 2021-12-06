const $p_price = document.getElementById('p_price');

const pointInput = () => {
	let point = $p_price.value;

	point *= 0.05;
	
	document.getElementById('p_point').value = Math.ceil(point);
}

$p_price.addEventListener('focusout', pointInput);