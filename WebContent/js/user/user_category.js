//상단 카테고리를 출력하는 메서드
function display_category(cname){
	
	let category = cname.charAt(0);
	let str = "";
	let title = "";
	let banner = "";
		
	if(category == 'A'){
		
		str += '<li id="A"><a href="user_category.do?cat=A&sort=new">전체보기</a></li> \
				<li id="A1"><a href="user_category.do?cat=A1&sort=new">파티 메인요리</a></li> \
				<li id="A2"><a href="user_category.do?cat=A2&sort=new">크리스마스 에디션</a></li> \
				<li id="A3"><a href="user_category.do?cat=A3&sort=new">시즌 디저트</a></li>';	
		title += '하니스마스';
		banner += '<img src="./img/main/categoryBanner1.png" width="1050px" width="100%">';
		
	}else if(category == 'B'){
		
		str += '<li id="B"><a href="user_category.do?cat=B&sort=new">전체보기</a></li> \
				<li id="B1"><a href="user_category.do?cat=B1&sort=new">고구마·감자·당근</a></li> \
				<li id="B2"><a href="user_category.do?cat=B2&sort=new">브로콜리·파프리카·배추</a></li> \
				<li id="B3"><a href="user_category.do?cat=B3&sort=new">양파·대파·마늘</a></li> \
				<li id="B4"><a href="user_category.do?cat=B4&sort=new">오이·호박·고추</a></li> \
				<li id="B5"><a href="user_category.do?cat=B5&sort=new">기타 채소</a></li>';
		title += '채소';
		banner += '<img src="./img/main/categoryBanner2.png" width="1050px" width="100%">';
		
	}else if(category == 'C'){
		
		str += '<li id="C"><a href="user_category.do?cat=C&sort=new">전체보기</a></li> \
				<li id="C1"><a href="user_category.do?cat=C1&sort=new">베이커리</a></li> \
				<li id="C2"><a href="user_category.do?cat=C2&sort=new">케이크</a></li> \
				<li id="C3"><a href="user_category.do?cat=C3&sort=new">커피</a></li>';
		title += '베이커리, 커피';
		banner += '<img src="./img/main/categoryBanner3.png" width="1050px" width="100%">';
		
	}else if(category == 'D'){
		
		str += '<li id="D"><a href="user_category.do?cat=D&sort=new">전체보기</a></li> \
				<li id="D1"><a href="user_category.do?cat=D1&sort=new">반려동물 간식</a></li> \
				<li id="D2"><a href="user_category.do?cat=D2&sort=new">반려동물 주식</a></li> \
				<li id="D3"><a href="user_category.do?cat=D3&sort=new">반려동물 용품</a></li>';
		title += '반려동물';
		banner += '<img src="./img/main/categoryBanner4.png" width="1050px" width="100%">';
	}
	
	$('#sub_category').append(str);
	$('.category span').append(title);
	$('.category_banner').append(banner);
}


//제품 리스트 정렬방식을 전달하여 액션을 호출하는 메서드
function sort(category, sort) {

	$('.top_line form').attr('action', 'user_category.do?cat=' + category + '&sort=' + sort); 
	$('.sort').submit();
}