create table kurly_review (
	r_num number(10) primary key,
	user_id varchar2(30) not null,
	p_num number(5) not null,
	r_title varchar2(50) not null, 
	r_content varchar2(1000) not null,
	r_image varchar2(50) ,
	r_date date,
	r_hit number(10) default 0
);



insert into kurly_review  
	values('1', 'aaaaaa', '고양이가 좋아해요', '저희 고양이가 좋아해요','','20200101','0');
	

select * from kurly_review where user_id = 'vv1234567890'; -- 작성 완료 리뷰
select * from kurly_order where user_id = 'vv1234567890'; -- 작성 가능한 주문 건

select * from kurly_order_detail where o_id = (select o_id from kurly_order where user_id =  'vv1234567890') order by p_num desc; -- 작성 가능한 주문 1건에 있는 리뷰작성 가능 제품(1개 or 여러개)
select * from kurly_product where p_num in (select p_num from kurly_order_detail where o_id = (select o_id from kurly_order where user_id =  'vv1234567890')) order by p_num desc; -- 리뷰 1건당 제품정보

	


