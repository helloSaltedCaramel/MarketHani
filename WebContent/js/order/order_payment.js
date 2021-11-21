const $payment = document.querySelector(".td_payment");
const $infoBtn = document.getElementById("info_btn");
const $addressLayer = document.querySelector(".info_layer");
const $items_btn = document.querySelector(".items_btn");

const select = () => {
  const $kakaopay = document.getElementById("kakaopay");
  const $card = document.getElementById("card");
  const $simple = document.getElementById("simple");
  const $phone = document.getElementById("phone");

  const $kakao_label = document.querySelector(".kakaopay");
  const $card_label = document.querySelector(".card_label");
  const $simple_label = document.querySelector(".simple_label");
  const $phone_label = document.querySelector(".phone_label");

  const $simpleBenefit = document.querySelector(".simple_benefit");
  const $kakaopayBenefit = document.querySelector(".kakaopay_benefit");

  if ($kakaopay.checked) {
    $kakao_label.style.backgroundColor = "#f6e500";
    $kakao_label.style.border = "1px solid #f6e500";
    $kakaopayBenefit.style.display = "block";
  } else {
    $kakao_label.style.backgroundColor = "#fff";
    $kakao_label.style.border = "1px solid #ddd";
    $kakaopayBenefit.style.display = "none";
  }

  if ($card.checked) {
    $card_label.style.backgroundColor = "#5f0080";
    $card_label.style.color = "#fff";
  } else {
    $card_label.style.backgroundColor = "#fff";
    $card_label.style.color = "#5f0080";
  }

  if ($simple.checked) {
    $simple_label.style.backgroundColor = "#5f0080";
    $simple_label.style.color = "#fff";
    $simpleBenefit.style.display = "block";
  } else {
    $simple_label.style.backgroundColor = "#fff";
    $simple_label.style.color = "#5f0080";
    $simpleBenefit.style.display = "none";
  }

  if ($phone.checked) {
    $phone_label.style.backgroundColor = "#5f0080";
    $phone_label.style.color = "#fff";
  } else {
    $phone_label.style.backgroundColor = "#fff";
    $phone_label.style.color = "#5f0080";
  }
};

const easeIn = () => {
  $addressLayer.style.opacity = 1;
};

const easeOut = () => {
  $addressLayer.style.opacity = 0;
};

let isShort = false; // 토글변수 : true면 간략히, false면 자세히
$items_btn.style.transform = "rotate(180deg)";

const itemsToggle = () => {
  const $short_info = document.querySelector(".short_info"); // 간략하게 보여주는 태그
  const $item_list = document.querySelector(".item_list"); // 물품정보 전부 보여주는 태그

  if (isShort) {
    // 토글변수 기준 true일 때
    $short_info.style.display = "none"; // 간략정보 태그 숨김
    $item_list.style.display = "block"; // 물품정보 태그 보여주기
    $items_btn.style.transform = "rotate(0)"; // 화살표 방향 바꿈
    isShort = false; // 토글 false로 바꿈
  } else {
    // 반대
    $short_info.style.display = "block";
    $item_list.style.display = "none";
    $items_btn.style.transform = "rotate(180deg)";
    isShort = true;
  }
};

$payment.addEventListener("click", select);
$infoBtn.addEventListener("mouseenter", easeIn);
$infoBtn.addEventListener("mouseout", easeOut);
$items_btn.addEventListener("click", itemsToggle);

itemsToggle();
