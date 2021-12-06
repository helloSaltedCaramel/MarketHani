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
	
	


