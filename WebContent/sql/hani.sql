create table kurly_product (
	p_num number(5) primary key,
    p_image varchar2(50),		    --제품 썸네일 사진	
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
	p_contents varchar2(50),		    --상품설명
	p_date date not null,
	p_contents_spec varchar2(50)	    --상세정보
);

create table kurly_cart (
	cart_num number(5) primary key,          	 -- 카트 번호
	cart_pnum number(5) not null,
    constraint fk_infono foreign key(cart_pnum) references kurly_product(p_num),     -- 상품 제품 번호
	cart_qty number(5) not null,
	cart_userId varchar2(30) not null,
    constraint fk_userId foreign key(cart_userId) references kurly_user(user_id)-- 카트 사용자 아이디
);

select cart_qty from kurly_cart where cart_pnum = 1 and cart_userId = 1;

create sequence cart_seq
increment by 1
start with 1
minvalue 1
maxvalue 1000
nocycle
nocache;

select cart_num from kurly_cart where cart_userId = 1;

drop table kurly_cart;

select * from kurly_product;

insert into kurly_product values(1, '치아바타.jpg', 3600, '[바켄]치아바타', '쫄깃하고 담백한 이탈리아 빵', '1개', '상온/종이포장', '택배배송은 에코포장이 스티로폼으로 대체됩니다.', '샛별배송/택배배송', 100, 180, '커피/빵', '빵', '바켄', 5, '쫄깃하고 담백한 이탈리아 빵', sysdate, '해당상품은');

update kurly_product set p_name = 5 where p_num = 1;

Insert into WEB.KURLY_PRODUCT (P_NUM,P_IMAGE,P_PRICE,P_NAME,P_UNIT,P_WRAP,P_WRAP_CONT,P_DELIVERY,P_QTY,P_POINT,P_CATEGORY,P_SUB_CATEGORY,P_SELLER,P_DISCOUNT,P_CONTENTS,P_DATE,P_NAME_CONT,P_CONTENTS_SPEC) values (1,'1.jpg',5000,'[조공]PET 나 산양유 좋아해 스틱','1팩','상온/종이포장','택배배송은 에코포장이 스티로폼으로 대체됩니다.','샛별배송/택배배송',100,500,'반려동물','고양이간식','조공',0,null,to_date('21/11/15','RR/MM/DD'),null,null);
Insert into WEB.KURLY_PRODUCT (P_NUM,P_IMAGE,P_PRICE,P_NAME,P_UNIT,P_WRAP,P_WRAP_CONT,P_DELIVERY,P_QTY,P_POINT,P_CATEGORY,P_SUB_CATEGORY,P_SELLER,P_DISCOUNT,P_CONTENTS,P_DATE,P_NAME_CONT,P_CONTENTS_SPEC) values (2,'2.jpg',2900,'[조공]PET 나 게살 좋아해 스틱','1팩','상온/종이포장','택배배송은 에코포장이 스티로폼으로 대체됩니다.','샛별배송/택배배송',100,290,'반려동물','고양이간식','조공',0,'게살_상품설명.jpg',to_date('21/11/15','RR/MM/DD'),'특별한 기회로 만나보는 홍게 간식','게살_상세정보.jpg');

Insert into KURLY_PRODUCT (P_NUM,P_IMAGE,P_PRICE,P_NAME,P_UNIT,P_WRAP,P_WRAP_CONT,P_DELIVERY,P_QTY,P_POINT,P_CATEGORY,P_SUB_CATEGORY,P_SELLER,P_DISCOUNT,P_CONTENTS,P_DATE,P_NAME_CONT,P_CONTENTS_SPEC) values (1,'에스프레소.jpg',2500,'에스프레소','1','컵(리유저블종이컵)',null,'직접수령',20,300,'A1','1','폴바셋',0,null,to_date('21/11/11','RR/MM/DD'),'클래식 중의 클래식',null);
Insert into KURLY_PRODUCT (P_NUM,P_IMAGE,P_PRICE,P_NAME,P_UNIT,P_WRAP,P_WRAP_CONT,P_DELIVERY,P_QTY,P_POINT,P_CATEGORY,P_SUB_CATEGORY,P_SELLER,P_DISCOUNT,P_CONTENTS,P_DATE,P_NAME_CONT,P_CONTENTS_SPEC) values (2,'아메리카노.jpg',3000,'아메리카노','1','컵(리유저블종이컵)',null,'직접수령',20,300,'A1','1','폴바셋',0,null,to_date('21/11/11','RR/MM/DD'),'올타임 넘버원',null);
Insert into KURLY_PRODUCT (P_NUM,P_IMAGE,P_PRICE,P_NAME,P_UNIT,P_WRAP,P_WRAP_CONT,P_DELIVERY,P_QTY,P_POINT,P_CATEGORY,P_SUB_CATEGORY,P_SELLER,P_DISCOUNT,P_CONTENTS,P_DATE,P_NAME_CONT,P_CONTENTS_SPEC) values (3,'카페라떼.jpg',3500,'카페라떼','1','컵(리유저블종이컵)',null,'직접수령',20,300,'A1','1','폴바셋',0,null,to_date('21/11/12','RR/MM/DD'),'선선한 가을 날씨에 딱 알맞는',null);
Insert into KURLY_PRODUCT (P_NUM,P_IMAGE,P_PRICE,P_NAME,P_UNIT,P_WRAP,P_WRAP_CONT,P_DELIVERY,P_QTY,P_POINT,P_CATEGORY,P_SUB_CATEGORY,P_SELLER,P_DISCOUNT,P_CONTENTS,P_DATE,P_NAME_CONT,P_CONTENTS_SPEC) values (4,'아이스크림라떼.jpg',3500,'아이스크림 라떼','1','컵(리유저블종이컵)',null,'직접수령',20,300,'A1','1','폴바셋',10,null,to_date('21/11/12','RR/MM/DD'),'폴바셋의 시그니쳐 메뉴',null);
Insert into KURLY_PRODUCT (P_NUM,P_IMAGE,P_PRICE,P_NAME,P_UNIT,P_WRAP,P_WRAP_CONT,P_DELIVERY,P_QTY,P_POINT,P_CATEGORY,P_SUB_CATEGORY,P_SELLER,P_DISCOUNT,P_CONTENTS,P_DATE,P_NAME_CONT,P_CONTENTS_SPEC) values (5,'핸드드립.jpg',5000,'핸드드립','1','컵(리유저블종이컵)',null,'직접수령',20,300,'A1','1','폴바셋',15,null,to_date('21/11/12','RR/MM/DD'),'엄선된 원두에 숙련된 바리스타의 손길이 더해진',null);
Insert into KURLY_PRODUCT (P_NUM,P_IMAGE,P_PRICE,P_NAME,P_UNIT,P_WRAP,P_WRAP_CONT,P_DELIVERY,P_QTY,P_POINT,P_CATEGORY,P_SUB_CATEGORY,P_SELLER,P_DISCOUNT,P_CONTENTS,P_DATE,P_NAME_CONT,P_CONTENTS_SPEC) values (6,'프라푸치노.jpg',5500,'프라푸치노','1','컵(리유저블종이컵)',null,'직접수령',20,300,'A1','1','폴바셋',20,null,to_date('21/11/12','RR/MM/DD'),'무더위를 한 방에 날려줄',null);
Insert into KURLY_PRODUCT (P_NUM,P_IMAGE,P_PRICE,P_NAME,P_UNIT,P_WRAP,P_WRAP_CONT,P_DELIVERY,P_QTY,P_POINT,P_CATEGORY,P_SUB_CATEGORY,P_SELLER,P_DISCOUNT,P_CONTENTS,P_DATE,P_NAME_CONT,P_CONTENTS_SPEC) values (7,'깜빠뉴.jpg',5000,'깜빠뉴','1','비닐포장',null,'택배배송',20,200,'A2','2','더페이머스램',10,null,to_date('21/11/13','RR/MM/DD'),null,null);
Insert into KURLY_PRODUCT (P_NUM,P_IMAGE,P_PRICE,P_NAME,P_UNIT,P_WRAP,P_WRAP_CONT,P_DELIVERY,P_QTY,P_POINT,P_CATEGORY,P_SUB_CATEGORY,P_SELLER,P_DISCOUNT,P_CONTENTS,P_DATE,P_NAME_CONT,P_CONTENTS_SPEC) values (8,'바게트.jpg',3500,'바게트','1','비닐포장',null,'택배배송',20,200,'A2','2','더페이머스램',0,null,to_date('21/11/13','RR/MM/DD'),null,null);
Insert into KURLY_PRODUCT (P_NUM,P_IMAGE,P_PRICE,P_NAME,P_UNIT,P_WRAP,P_WRAP_CONT,P_DELIVERY,P_QTY,P_POINT,P_CATEGORY,P_SUB_CATEGORY,P_SELLER,P_DISCOUNT,P_CONTENTS,P_DATE,P_NAME_CONT,P_CONTENTS_SPEC) values (9,'식빵.jpg',3000,'식빵','1','비닐포장',null,'택배배송',20,200,'A2','2','더페이머스램',0,null,to_date('21/11/15','RR/MM/DD'),null,null);
Insert into KURLY_PRODUCT (P_NUM,P_IMAGE,P_PRICE,P_NAME,P_UNIT,P_WRAP,P_WRAP_CONT,P_DELIVERY,P_QTY,P_POINT,P_CATEGORY,P_SUB_CATEGORY,P_SELLER,P_DISCOUNT,P_CONTENTS,P_DATE,P_NAME_CONT,P_CONTENTS_SPEC) values (10,'치아바타.jpg',2500,'치아바타','1','비닐포장',null,'택배배송',20,200,'A2','2','더페이머스램',0,null,to_date('21/11/15','RR/MM/DD'),null,null);
Insert into KURLY_PRODUCT (P_NUM,P_IMAGE,P_PRICE,P_NAME,P_UNIT,P_WRAP,P_WRAP_CONT,P_DELIVERY,P_QTY,P_POINT,P_CATEGORY,P_SUB_CATEGORY,P_SELLER,P_DISCOUNT,P_CONTENTS,P_DATE,P_NAME_CONT,P_CONTENTS_SPEC) values (11,'크로와상.jpg',3000,'크로와상','1','비닐포장',null,'택배배송',20,200,'A2','2','더페이머스램',0,null,to_date('21/11/15','RR/MM/DD'),null,null);
Insert into KURLY_PRODUCT (P_NUM,P_IMAGE,P_PRICE,P_NAME,P_UNIT,P_WRAP,P_WRAP_CONT,P_DELIVERY,P_QTY,P_POINT,P_CATEGORY,P_SUB_CATEGORY,P_SELLER,P_DISCOUNT,P_CONTENTS,P_DATE,P_NAME_CONT,P_CONTENTS_SPEC) values (12,'산양유.jpg',5000,'[조공]PET 나 산양유 좋아해 스틱','1팩','상온/종이포장','택배배송은 에코포장이 스티로폼으로 대체됩니다.','샛별배송/택배배송',100,500,'반려동물','고양이간식','조공',0,null,to_date('21/11/15','RR/MM/DD'),null,null);
Insert into KURLY_PRODUCT (P_NUM,P_IMAGE,P_PRICE,P_NAME,P_UNIT,P_WRAP,P_WRAP_CONT,P_DELIVERY,P_QTY,P_POINT,P_CATEGORY,P_SUB_CATEGORY,P_SELLER,P_DISCOUNT,P_CONTENTS,P_DATE,P_NAME_CONT,P_CONTENTS_SPEC) values (13,'게살.jpg',2900,'[조공]PET 나 게살 좋아해 스틱','1팩','상온/종이포장','택배배송은 에코포장이 스티로폼으로 대체됩니다.','샛별배송/택배배송',100,290,'반려동물','고양이간식','조공',0,'2-1.gif',to_date('21/11/15','RR/MM/DD'),'특별한 기회로 만나보는 홍게 간식',null);

select c.cart_pnum, p.p_image, p.p_name, p.p_price, ROUND(p.p_price*(1-p.p_discount*0.01)) salePrice, p.p_point, c.cart_qty
from kurly_cart c
join kurly_product p
on c.cart_pnum = p.p_num
where c.cart_userid = 'alsghl9607'
order by c.cart_pnum;