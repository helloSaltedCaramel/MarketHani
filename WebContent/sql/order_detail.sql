
create table kurly_order_detail (
	od_num number(5) primary key,
	o_id number(5) not null, -- foreign key 주문번호
    p_num number(20) not null,  --foreign key
    o_price number(20) not null,		-- 가격
    o_discount_price number(20), 	-- 할인금액
    o_final_price number(20) not null,	-- 할인 후 가격
    o_qty number(20) not null 		--  수량

);


insert into kurly_order_detail
	values('1', '1','1','5000','500','4500','2');