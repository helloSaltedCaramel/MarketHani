const $id = document.getElementById("form_id");
const $pw = document.getElementById("pw");
const $pwCheck = document.getElementById("pw_check");
const $name = document.getElementById("name");
const $email = document.getElementById("email");
const $phone = document.getElementById("phone");
const $addr_detail = document.getElementById("address_detail");
const $birth = document.querySelector(".birth_block");

let id_checking = false;		// 아이디 확인
let pw_checking = false;		// 비밀번호 확인
let name_checking = false;	// 이름 확인
let email_checking = false;	// 이메일 확인
let phone_checking = false;	// 전화번호 확인
let birth_checking = false;	// 생일 확인
let addr_checking = false;	// 주소 확인: 

// let distinct_id = false;

/**
 * [아이디 중복확인 코드 유효성 검사]
 * 1. 소문자 알파벳으로 시작
 * 2. 6자 이상 16자 이하여야함
 * 3. ajax 연동 구현해야함(미완성)
 */
const id_check = () => {
  // 정규식 : 첫 글자 소문자 알파벳으로 시작, 영문숫자로 6자 이상 16자 이하

  const id_regex = /^[a-z][a-z0-9]{5,15}$/g;

  const text = $id.value;
  const isCorrect = id_regex.test(text);

  if (isCorrect) {
    $id.style.border = "1px solid green";
    id_checking = true;
  } else {
    alert("아이디는 알파벳으로 시작하며, 6~16자 사이로 입력해주세요.");
    $id.style.border = "1px solid salmon";
		id_checking = false;
  }
};

/**
 * [비밀번호 검증]
 * 1. 비밀번호, 비밀번호확인 value 같은지 확인
 * 2. 비밀번호가 10자 이상인지 확인
 * 3. 영문 숫자 혼합인지 확인
 * 4. 비밀번호에 공백(space bar) 있는지 확인
 * 걸리면 return 사용해서 아래코드 실행 안되도록 작성
 */
const pw_check = () => {
	
  $pwGuide = document.getElementById("pw_guide");
  // const pw_regex = /[a-z0-9]{10}/g;

  const pwText = $pw.value;
  const pwCheckText = $pwCheck.value;

  // 영문, 숫자 혼합여부
  const check_num = pwText.search(/[0-9]/g);
  const check_eng = pwText.search(/[a-z]/g);

  // 1
  if (pwText != pwCheckText) {
    $pwGuide.innerText = "비밀번호가 일치하지않습니다.";
    $pwGuide.style.display = "block";
    $pw.style.border = "1px solid salmon";
    $pwCheck.style.border = "1px solid salmon";
		pw_checking = false;
    return;
  }

  // 2
  if (pwText.length < 10 || pwCheckText < 10) {
    $pwGuide.innerText = "비밀번호는 10자 이상으로 입력해야합니다.";
    $pwGuide.style.display = "block";
    $pw.style.border = "1px solid salmon";
    $pwCheck.style.border = "1px solid salmon";
		pw_checking = false;
    return;
  }

  // 3
  if (check_num < 0 || check_eng < 0) {
    $pwGuide.innerText = "비밀번호는 영문/숫자조합으로 입력해주세요";
    $pwGuide.style.display = "block";
    $pw.style.border = "1px solid salmon";
    $pwCheck.style.border = "1px solid salmon";
		pw_checking = false;
    return;
  }

  // 4
  if (pwText.indexOf(" ") != -1 || pwCheckText.indexOf(" ") != -1) {
    $pwGuide.innerText = "비밀번호는 공백(스페이스바)이 들어갈 수 없습니다.";
    $pwGuide.style.display = "block";
    $pw.style.border = "1px solid salmon";
    $pwCheck.style.border = "1px solid salmon";
		pw_checking = false;
    return;
  }

  $pw.style.border = "1px solid green";
  $pwCheck.style.border = "1px solid green";
  $pwGuide.style.display = "none";
  pw_checking = true;
};

/**
 * [이름 유효성 검사]
 * 1. 한글 2~4글자
 * 2. 영어, 자음/모음만 작성하면 false
 */
const name_check = () => {
	
  const $name_guide = document.getElementById("name_guide");
  const name_regex = /^[가-힣]{2,4}$/;

  if (name_regex.test($name.value)) {
    $name_guide.style.display = "none";
    $name.style.border = "1px solid green";
    name_checking = true;
		return;
  } else {
    $name_guide.style.display = "block";
    $name_guide.innerText = "올바른 이름을 입력해주세요.";
    $name.style.border = "1px solid salmon";
		name_checking = false;
    return;
  }
};

/**
 * [이메일 유효성 검사]
 * 조건 : @ 들어가야함
 */
const email_check = () => {
	
  const $email_guide = document.getElementById("email_guide");
  const email_regex =
    /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/g;

  if (email_regex.test($email.value)) {
    $email_guide.style.display = "none";
    $email.style.border = "1px solid green";
		email_checking = true;
    return;
  } else {
    $email_guide.style.display = "block";
    $email_guide.innerText = "이메일 형식에 맞게 입력해주세요.";
    $email.style.border = "1px solid salmon";
		email_checking = false;
    return;
  }
};

/**
 * [휴대폰 유효성 검사]
 * 조건 : 01x
 */
const phone_check = () => {
	
  const $phone_guide = document.getElementById("phone_guide");
  const phone_regex = /^01[0-9][0-9]{8}$/g;

  if (phone_regex.test($phone.value)) {
    $phone_guide.style.display = "none";
    $phone.style.border = "1px solid green";
		phone_checking = true;
    return;
  } else {
    $phone_guide.style.display = "block";
    $phone_guide.innerText = "올바른 휴대폰 번호를 입력해주세요(숫자만 입력)";
    $phone.style.border = "1px solid salmon";
		phone_checking = false;
    return;
  }
};

// 상세주소 focusout 시 초록색, 비어있으면 rollback
const addr_check = () => {
  if ($addr_detail.value === "") {
    $addr_detail.style.border = "1px solid #ccc";
		addr_checking = false;
    return;
  }
  
	$addr_detail.style.border = "1px solid green";
  addr_checking = true;
};

/**
 * 생년월일 유효성 검사
 * 1. 년 : 19xx, 20xx
 * 2. 월 : 1~12, 일의자리는 0x 형식으로 표시
 * 3. 일 : 1~31 사이의 값, (2월이나 30일까지인 달 유효성 검사 구현못했음)
 */
const birth_check = () => {
  const $year = document.getElementById("birth_year").value;
  const $month = document.getElementById("birth_month").value;
  const $day = document.getElementById("birth_day").value;
  const $birth_guide = document.getElementById("birth_guide");

  const regex_false = (text) => {
    $birth.style.border = "1px solid salmon";
    $birth_guide.style.display = "block";
    $birth_guide.innerText = text;
  };

  const year_regex = /(19\d{2})|(20\d{2})/g;
  const month_regex = /(0[1-9]|1[0-2])/g;
  const day_regex = /(0[1-9]{1}|1\d{1}|2\d{1}|3[0-1])/g;

  if (!year_regex.test($year)) {
    regex_false("올바른 년도를 입력해주세요.");
		birth_checking = false;
    return;
  } else {
    $birth_guide.style.display = "none";
  }

  if (!month_regex.test($month)) {
    regex_false("올바른 월을 입력해주세요 (예: 1월 > 01)");
		birth_checking = false;
    return;
  } else {
    $birth_guide.style.display = "none";
  }

  if (!day_regex.test($day)) {
    regex_false("올바른 일을 입력해주세요. (예: 3일 > 03)");
		birth_checking = false;
    return;
  } else {
    $birth_guide.style.display = "none";
    $birth.style.border = "1px solid green";
  }
	
	birth_checking = true;
};

// 전체 동의합니다 클릭 시 나머지 약관 자동체크
const allCheck = () => {
  const $allCheck = document.getElementById("all_checkbox");
  const $useCheck = document.getElementById("use_checkbox");
  const $infoCheck = document.getElementById("info_use_checkbox");
  const $ageCheck = document.getElementById("age_checkbox");

  if ($allCheck.checked) {
    $useCheck.checked = true;
    $infoCheck.checked = true;
    $ageCheck.checked = true;
  } else {
    $useCheck.checked = false;
    $infoCheck.checked = false;
    $ageCheck.checked = false;
  }
};

$pw.addEventListener("keyup", pw_check);
$pwCheck.addEventListener("keyup", pw_check);
$name.addEventListener("keyup", name_check);
$email.addEventListener("keyup", email_check);
$phone.addEventListener("keyup", phone_check);
$addr_detail.addEventListener("focusout", addr_check);
$birth.addEventListener("keyup", birth_check);

// 가입하기 버튼 기능
const regist = () => {
	if(!pw_checking) {
		alert('비밀번호가 올바르지 않습니다. 다시 입력해주세요.');
		document.querySelector('#pw').focus();
		return;
	}
	
	if(!name_checking) {
		alert('올바른 형식의 이름을 입력해주세요.');
		document.querySelector('#name').focus();
		return;
	}
	
	if(!email_checking) {
		alert('올바른 형식의 이메일을 입력해주세요.');
		document.querySelector('#email').focus();
		return;
	}
	
	if(!phone_checking) {
		alert('올바른 휴대폰 번호를 입력해주세요.');
		return;
	}
	
	const $addr = document.querySelector('#address');
	if($addr.value == '') {
		alert('주소를 작성하지 않았습니다. 주소를 입력해주세요.');
		document.querySelector('#address').focus();
		return;
	}
	
	if(!birth_checking) {
		if(confirm('생년월일이 올바르게 입력되지 않았습니다. 입력하시려면 예, 입력하지않고 가입하려면 아니오를 클릭해주세요.')) {
			document.querySelector('#birth_year').focus();
			return;
		} else {
			birth_checking = true;
		}
	}
	
	const $use_checkbox = document.getElementById('use_checkbox');
	const $info_use_checkbox = document.getElementById('info_use_checkbox');
	const $age_checkbox = document.getElementById('age_checkbox');
	
	if(!$use_checkbox.checked || !$info_use_checkbox.checked || !$age_checkbox.checked) {
		alert('동의하지않은 필수약관이 있습니다. 확인해주세요.');
		return;
	}
	
	document.getElementById('registForm').submit();
}

// js로 contextPath 구하기
const getContextPath = () => {
	const hostIndex = location.href.indexOf(location.host) + location.host.length;
	const contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
	return contextPath
}
