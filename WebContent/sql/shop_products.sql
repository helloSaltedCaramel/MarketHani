--shop_products 테이블 생성
create table kurly_product (
	p_num number(5) primary key,
	p_image varchar2(50),
	p_price number(10) not null,		    --가격
	p_name varchar2(50) not null,
	p_name_cont varchar2(100),
	p_unit varchar2(10) not null,
	p_wrap varchar2(50) not null,
	p_wrap_cont varchar2(100),
	p_delivery varchar2(30) not null,	
	p_qty number(5) not null,
	p_point number(10) not null,
	p_category varchar2(30) not null,
	p_sub_category varchar2(30) not null,
	p_seller varchar2(30) not null,
	p_discount number(5) not null,	    --할인율
	p_contents varchar2(50),
	p_date date not null,
	p_name_cont varchar2(100),
	p_contents_spec varchar2(50)
);



-- 상품 등록하기
insert into kurly_product
	values('1', '산양유.jpg', '5000', 'PET 나 산양유 좋아해 스틱','1팩','상온/종이포장','택배배송은 에코포장이 스티로폼으로 대체됩니다.','샛별배송/택배배송', '100', '500', '반려동물', '고양이간식','조공','','', sysdate,'','');

insert into kurly_product
	values('2', '게살.jpg', '2200', 'PET 나 게살 좋아해 스틱','1팩','상온/종이포장','택배배송은 에코포장이 스티로폼으로 대체됩니다.','샛별배송/택배배송', '100', '290', '반려동물', '고양이간식','조공','','게살_상품설명.jpg', sysdate,'특별한 기회로 만나보는 홍게 간식','게살_상세정보.jpg');