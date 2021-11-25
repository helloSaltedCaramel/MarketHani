create table kurly_user (
	user_id varchar2(30) primary key,
	user_pwd varchar2(30) not null,
	user_name varchar2(30) not null,
	user_email varchar2(50) not null,
	user_phone varchar2(30) not null,
	user_addr varchar2(300) not null,
	user_gender varchar2(10) not null,
	user_point number(10) default 0,
	user_birthday date
);


insert into kurly_user 
	values('aaaaaa', '111111', '조재연', 'aaaaaa@naver.com','010-1111-1111','서울시 성북구','여','2000', '940401');