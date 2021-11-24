const $prices = document.getElementsByClassName('selling');

let sumPrice;

const priceCheck = () => {
	for(price of $prices) {
	console.log(price.innertext);
	}
}

window.addEventListener('load', priceCheck);

