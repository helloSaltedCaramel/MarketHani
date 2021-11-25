create table kurly_qna (
	qna_num number(10) primary key,
	user_id varchar2(30) not null,  --foreign key
	qna_title varchar2(50) not null,
	qna_content varchar2(1000) not null,
	qna_date date not null,
	qna_answer varchar2(1000),
	qna_answer_date date,
	qna_status number(5) not null,
	qna_secret number(5) not null
 );

 
 insert into kurly_qna 
 values('1','aaaaaa','질문있어요','샴고양이가 잘먹을까요?','20211117','','','0','0')