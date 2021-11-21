const $totalCategory = document.getElementById("total_category"); //span
const $gnb_sub = document.querySelector(".gnb_sub"); // 카테고리나오는 부분
const $categoryBlock = document.querySelector(".menu1"); // span태그 감싸는 영역(div)
const $categoryIco = document.getElementById("icon");
const $totalText = document.querySelector(".total_txt");

const $category = document.querySelector(".gnb_menu");
const $children = $category.childNodes;
const $locZone = document.querySelector(".location_zone");
const $locLayer = document.querySelector(".location_layer");


const categoryIn = () => {
  $gnb_sub.style.display = "block";
	$categoryIco.className = "ico_hover";
	$totalText.style.color = "#5f0080";
	$totalText.style.fontWeight = "700";
};

const categoryOut = () => {
  $gnb_sub.style.display = "none";
  $gnb_sub.style.width = "219px";
	$categoryIco.className = "ico";
	$totalText.style.color = "";
};

const subCategoryIn = () => {
  $gnb_sub.style.width = "438px";
};

const subCategoryOut = () => {
  $gnb_sub.style.width = "219px";
};

const setCurrent = (e) => {
  e.target.className = "current";
};

const setNone = (e) => {
  e.target.className = "";
};

const locLayerIn = () => {
  $locLayer.style.display = "block";
};

const locLayerOut = () => {
  $locLayer.style.display = "none";
};

for (node of $children) {
  node.addEventListener("mouseenter", setCurrent);
  node.addEventListener("mouseleave", setNone);
}

// 일정 스크롤 넘어가면 position: fixed 처리하는 클래스되도록 변경
const fixHeader = (e) => {
  if (window.scrollY >= 200) {
    document.getElementById("header3").className = "gnb_stop";
  } else {
    document.getElementById("header3").className = "";
  }
};

window.addEventListener("wheel", fixHeader);

/*$totalCategory.addEventListener("mouseleave", categoryOut);*/
$categoryBlock.addEventListener('mouseover', categoryIn);
$categoryBlock.addEventListener('mouseout', categoryOut);
$gnb_sub.addEventListener("mouseenter", categoryIn);
$gnb_sub.addEventListener("mouseleave", categoryOut);

$category.addEventListener("mouseenter", subCategoryIn);
$category.addEventListener("mouseleave", subCategoryOut);

$locZone.addEventListener("mouseover", locLayerIn);
$locZone.addEventListener("mouseout", locLayerOut);
$locLayer.addEventListener("mouseover", locLayerIn);
$locLayer.addEventListener("mouseleave", locLayerOut);

console.log('header loaded, github checked');
