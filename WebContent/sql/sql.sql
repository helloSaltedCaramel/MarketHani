create table kurly_admin (
	admin_id varchar2(30) primary key,
admin_pwd varchar2(30) not null,
	admin_name varchar2(30) not null,
	admin_email varchar2(100) not null,
	admin_date date
);

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

- 이용약관동의는 화면에서 체크여부만 확인 후 넘어가도록 처리
- 회원등급은 여유되면 만들기 (+ 회원등급별 포인트 차등 적용도)

create table kurly_product (
	p_num number(5) primary key,
	p_image varchar2(50),
	p_price number(10) not null,		    --가격
	p_name varchar2(50) not null,
	p_unit varchar2(10) not null,
	p_wrap varchar2(10) not null,
	p_wrap_cont varchar2(50),
	p_delivery varchar2(30) not null,	
	p_qty number(5) not null,
	p_point number(10) not null,
	p_category varchar2(30) not null,
	p_sub_category varchar2(30) not null,
	p_seller varchar2(30) not null,
	p_discount number(5) not null,	    --할인율
	p_contents varchar2(50),
	p_date date
);

- p_contents 그림파일로
- keyword : 크리스마스, 빼빼로데이, 연말 (optional)

create table  kurly_category (
	c_category
	c_code
	c_name 정육*계란
);

create table kurly_scategory (
	c_scategory
	c_category
	c_code
	c_name 정육*계란
);

쇼핑관련
create table kurly_cart (
	cart_num number(5) primary key,          	 -- 카트 번호
	cart_pnum number(5) not null foreign key,     -- 상품 제품 번호
	cart_qty number(5) not null,
	cart_userId varchar2(30) not null         	 -- 카트 사용자 아이디
);

create table kurly_order (
	o_id number(5) primary key,	-- 주문번호
	userId fk varchar2(30) not null, -- 회원아이디
	o_to_name varchar2(30) not null, -- 수령인 이름
	o_to_addr varchar2(30) not null, -- 수령주소
	o_to_phone varchar2(30) not null,
	o_to_message varchar2(30) not null,
	o_point_use number(10),	-- 사용할 포인트
	o_point_get number(10), 	-- 적립 포인트
	o_pay_method varchar2(30),  -- 결제수단 : “신용카드”, “계좌이체”, “무통장입금”, 
	o_date date,    -- 결제일
	o_total number(20),   -- 결제 총액
	o_del_fee number(10)  -- 배송비
);
- 배송비 부과 기준 : 3만원 이상 구매 시 / 3,000원
- 도서산간지방 배송비 차등 적용(optional)
- o_addr_detail : 상세주소를 사용할 경우 주소검색 API 사용해야함(optional)

create table kurly_order_detail (
	o_id number(5) foreign key not null, -- 주문번호
	p_num number(20) foreign key not null,
	o_price number(20) not null,		-- 가격
	o_discount_price number(20), 	-- 할인금액
	o_final_price number(20) not null,	-- 할인 후 가격
	o_qty number(20) not null 		--  수량
);

- 적립금 사용란 만들어야함, 쿠폰은 제외

create table kurly_qna (
	qna_num number(10) primary key,
	user_id varchar2(30) foreign key not null,
	qna_title varchar2(50) not null,
	qna_content varchar2(1000) not null,
	qna_date date not null,
	qna_answer varchar2(300),
	qna_answer_date date,
	qna_status number(5) not null,
	qna_secret number(5) not null
 );

- 비밀글 설정 기능 (qna_secret, 0: 공개, 1: 비공개)
- 게시판 내부 답글 기능
- 작성자 ⇒ kurly_user 테이블의 user_name을 가져와서 가운데글씨 “*” 처리(user_id 활용)
- qna_status : 숫자표기(0 : 답변대기, 1 : 답변완료)

create  kurly_review (
	r_num number(10) primary key,
	user_id varchar2(30) foreign key not null,
	r_title varchar2(50) not null, 
	r_content varchar2(50) not null,
	r_image varchar2(50) not null,
	r_date date not null,
	r_hit number(10) default 0
);

- 만드는 사람이 r_help 넣을 지 말지 선택(도움이 돼요 기능)
- r_writer ⇒ kurly_user 테이블의 user_name을 가져와서 가운데글씨 “*” 처리(user_id 활용)
- 페이징 처리
- 후기 삭제 버튼 필요함
- 후기 이미지 파일 업로드
