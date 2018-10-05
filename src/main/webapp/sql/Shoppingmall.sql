------------------------------
------- 게시판 [ 공지사항 ]
-- 테이블 생성
create table notice ( 
 notice_num number primary key,            -- 게시물 번호 seq
 notice_subject varchar2(30) not null,     -- 게시물 제목
 notice_content varchar2(1000) not null,   -- 게시물 내용
 notice_writer varchar2(30) not null,      -- 작성자
 notice_hit number,                        -- 조회수 hit
 notice_date date default sysdate		       -- 작성일 
);
-- 테이블 삭제
drop table notice purge;
-- 시퀀스	객체 생성
create sequence notice_num nocycle nocache;
drop sequence notice_num;  -- 시퀀스 삭제
-- C R U D create, read, update, delete
-- select 읽기
select * from notice;
select * from notice where notice_num=2;
-- insert 글 쓰기
insert into notice values (notice_num.nextval, '4', '구름이 많이 꼈네', '홍길동', 1, sysdate);
-- update 글 수정
update notice set notice_subject='내일은', notice_content='금요일' where notice_num=2;
-- delete 글 삭제
delete notice where notice_num=1;
-- 저장하기
commit;
-- 마지막 커밋 이전으로 돌아가기
rollback;
-- 인덱스 뷰
-- hidden column - rownum
select * from
(select rownum rn, tt.* from 
(select * from notice order by notice_num desc) tt)
where rn>=1 and rn<=10;


------ 게시판 [ Q&A ]
create table board_qna (
 board_qna_num  number primary key,         -- 게시물 번호 seq
 board_qna_subject varchar2(100) not null,   -- 게시물 제목
 board_qna_content varchar2(300) not null,  -- 게시물 내용
 board_qna_img varchar2(30),       -- 상품 이미지
 board_qna_writer varchar2(30) not null,    -- 작성자
 	board_qna_ref number not null,			-- 관련글번호
	board_qna_lev number not null,			-- 답글레벨
	board_qna_seq number not null,			-- 관련글중 출력순서
 board_qna_date date default sysdate		    -- 작성일 
);
-- 테이블 삭제
alter table board_qna add board_qna_pwd varchar2(20);
drop table board_qna purge;
-- 시퀀스	객체
create sequence board_qna_num nocycle nocache;
drop sequence board_qna_num;  -- 시퀀스 삭제
-- C R U D create, read, update, delete
-- select 읽기
select * from board_qna;
select * from board_qna where board_qna_num=2;
-- insert 글 쓰기
insert into board_qna values (board_qna_num.nextval, '제목', '게시물 내용', 'img.jpg', '작성자', 0,0,0, sysdate);
-- update 글 수정
update notice set notice_subject='내일은', notice_content='금요일' where notice_num=2;
-- delete 글 삭제
delete notice where notice_num=1;
-- 저장하기
commit;
-- 마지막 커밋 이전으로 돌아가기
rollback;

-- Q&A 게시판 답글 인덱스 순서 대로 보기-
--select * from (select rownum rn, tt.* from "  
--		+ "(select * from board2 order by board_re_ref desc, board_re_seq asc) tt) "  -
--		+ "where rn>=? and rn<=?";

----- 게시판 [ 구매후기 ]

create table review (
  review_num number primary key,          -- 게시물 번호 seq
  review_subject varchar2(30) not null,   -- 게시물 제목
  review_content varchar2(100) not null,  -- 게시물 내용
  review_img varchar2(30) not null,       -- 상품 이미지
  review_writer varchar2(30) not null,    -- 작성자 
  review_grade varchar2(30) not null,     -- GRADE // 별점
  review_like number,                     -- LIKE
   review_ref number not null,			-- 관련글번호
	 review_lev number not null,			-- 답글레벨
	 review_seq number not null,			-- 관련글중 출력순서
  review_date date default sysdate		    -- 작성일
);
-- 시퀀스	객체
create sequence review_num nocycle nocache;
drop sequence review_num;  -- 시퀀스 삭제
-- 테이블 삭제
drop table review purge;
commit;
------------------------------
----- 회원정보
create table shop_member ( 
  id varchar2(20) primary key,        -- 아이디      // primary key 
  pwd varchar2(30) not null,          -- 비밀번호
  pwd_chk_q varchar2(30) not null,    -- 비밀번호 확인 질문
  pwd_chk_a varchar2(30) not null,    -- 비밀번호 확인 답변
  name varchar2(10) not null,         -- 이름
  addr1 varchar2(50) not null,        -- 기본주소
  addr2 varchar2(50) not null,        -- 나머지 주소
  tel1 varchar2(10) not null,         -- 일반전화 1
  tel2 varchar2(10) not null,         -- 일반전화 2 
  tel3 varchar2(10) not null,         -- 일반전화 3
  phone1 varchar2(10) not null,       -- 휴대전화 1
  phone2 varchar2(10) not null,       -- 휴대전화 2
  phone3 varchar2(10) not null,       -- 휴대전화 3
  email1 varchar2(20) not null,       -- 이메일 1
  email2 varchar2(20) not null,       -- 이메일 2
  gender varchar2(20) not null,       -- 성별
  birth_year varchar2(20) not null,   -- 생년월일 년도
  birth_month varchar2(20) not null,  -- 생년월일 월
  birth_day varchar2(20) not null,    -- 생년월일 일
  birth_solar_lunar varchar2(20) not null,  -- 양력, 음력 
  job varchar2(10) not null,          -- 직업
  accounter varchar2(10) not null,    -- 예금주
  bank_name varchar2(20) not null,    -- 은행명
  account_num varchar2(30) not null    -- 계좌번호
);
ALTER TABLE shop_member MODIFY (addr2 varchar2(80));
commit;
-- 테이블 삭제
drop table shop_member purge;
delete from shop_member where id='kgwug';
-- 테이블 정보 확인하기
desc shop_member;
-- 데이터 확인하기
select * from shop_member;
-- 데이터 삽입
insert into shop_member values ('hong', '1234', 'a', 'a', '홍길동', '서울', '종로구', 02, 1234, 5678, 010, 1234, 5678, 'hong', 'naver.com', '남', 1990, 10, 15, '양력', '공무원', '홍길동', '신한은행', '111-1111-111111');
insert into shop_member values ('go', '1234', 'a', 'a', '고길동', '서울', '종로구', 02, 1234, 5678, 010, 1234, 5678, 'go', 'naver.com','naver.com', '남', 1990, 11, 15, '양력', '공무원', '고길동', '신한은행', '123-2222-111111');
-- 데이터 삭제
delete from shop_member where id='hong'; 
-- 컬럼 삭제 --
ALTER TABLE shop_member DROP COLUMN email3;



-------------------------------
------ 상품
create table item (
 item_index number primary key,         -- 상품 인덱스 
 item_code varchar2(30) not null,       -- 상품코드   // 상품번호 primary key 
 item_category varchar2(30) not null,   -- 상품분류1
 item_detail_category varchar2(30) not null, -- 상세상품분류
 item_name varchar2(30) not null,       -- 상품명
 item_img varchar2(30) not null,        -- 상품 이미지
 item_detail_img VARCHAR2(30),          -- 상품 상세 이미지
 item_content varchar2(50) not null,    -- 상품 설명
 item_brand varchar2(20) not null,      -- 브랜드명
 item_price number not null,            -- 가격
 item_quantity number not null,            -- 재고량 (수량)
 item_color varchar2(20) not null,      -- color
 item_size varchar2(20) not null,       -- size
 item_date date default sysdate		      -- 등록일
);
-- 시퀀스	객체
create sequence item_index nocycle nocache;
drop sequence item_index;  -- 시퀀스 삭제

commit;
SELECT * FROM 
(SELECT * FROM item ORDER BY ROWNUM DESC) 
WHERE ROWNUM = 1;

SELECT *
FROM (SELECT DISTINCT item_img, item_price, item_name 
      FROM item)
WHERE ROWNUM >=1 AND ROWNUM <= 9;

select * from item where rownum >= 2 and rownum <= 3;
select * from item; 
select * from (select rownum rn, tt.* from (select * from item) tt) where rn = 2;

select * from
(select rownum rn, tt.* from 
(select * from guestbook order by guest_num desc) tt)
where rn>=1 and rn<=10;

select to_char(item_date, 'YYYY.MM.DD') as item_date from item;
create sequence item_index nocycle nocache;
drop sequence item_index;  -- 시퀀스 삭제
ALTER TABLE item ADD(item_detail_category VARCHAR2(30)); 

ALTER TABLE item ADD(item_detail_img VARCHAR2(30));

commit;
rollback;
-- 아이템 삭제 --
delete from item where item_index in (3, 4, 5);

-- 아이템 삽입 --
insert into item values (1, 'a', 'tee', '긴팔', '티', 'tee.jpg', '', '티', '티', 100, 100, 'red', 'large', sysdate);
insert into item values (2, 'a', 'tee', '긴팔', '티', 'tee.jpg', '', '티', '티', 100, 100, 'green', 'large', sysdate);
insert into item values (3, 'a', 'tee', '긴팔', '티셔츠', 'tee2.jpg', '', '티', '티', 100, 100, 'green', 'large', sysdate);
insert into item values (4, 'a', 'tee', '긴팔', '티셔츠', 'tee2.jpg', '', '티', '티', 100, 100, 'green', 'large', sysdate);
insert into item values (5, 'b', 'tee', '긴팔', '티셔츠', 'tee2.jpg', '', '티', '티', 100, 100, 'green', 'large', sysdate);
insert into item values (6, 'b', 'tee', '긴팔', '티셔츠', 'tee2.jpg', '', '티', '티', 100, 100, 'green', 'large', sysdate);
insert into item values (7, 'b', 'tee', '긴팔', '티셔츠', 'tee2.jpg', '', '티', '티', 100, 100, 'green', 'large', sysdate);
insert into item values (8, 'a', 'tee', '긴팔', '티', 'tee.jpg', '', '티', '티', 100, 100, 'red', 'large', sysdate);
insert into item values (9, 'a', 'tee', '긴팔', '티', 'tee.jpg', '', '티', '티', 100, 100, 'green', 'large', sysdate);
insert into item values (10, 'a', 'tee', '긴팔', '티셔츠', 'tee2.jpg', '', '티', '티', 100, 100, 'green', 'large', sysdate);
insert into item values (11, 'a', 'tee', '긴팔', '티셔츠', 'tee2.jpg', '', '티', '티', 100, 100, 'green', 'large', sysdate);
insert into item values (12, 'b', 'tee', '긴팔', '티셔츠', 'tee2.jpg', '', '티', '티', 100, 100, 'green', 'large', sysdate);
insert into item values (13, 'b', 'tee', '긴팔', '티셔츠', 'tee2.jpg', '', '티', '티', 100, 100, 'green', 'large', sysdate);
insert into item values (14, 'b', 'tee', '긴팔', '티셔츠', 'tee2.jpg', '', '티', '티', 100, 100, 'green', 'large', sysdate);
insert into item values (15, 'a', 'tee', '긴팔', '티', 'tee.jpg', '', '티', '티', 100, 100, 'red', 'large', sysdate);
insert into item values (16, 'a', 'tee', '긴팔', '티', 'tee.jpg', '', '티', '티', 100, 100, 'green', 'large', sysdate);
insert into item values (17, 'a', 'tee', '긴팔', '티셔츠', 'tee2.jpg', '', '티', '티', 100, 100, 'green', 'large', sysdate);
insert into item values (18, 'a', 'tee', '긴팔', '티셔츠', 'tee2.jpg', '', '티', '티', 100, 100, 'green', 'large', sysdate);
insert into item values (19, 'b', 'tee', '긴팔', '티셔츠', 'tee2.jpg', '', '티', '티', 100, 100, 'green', 'large', sysdate);
insert into item values (20, 'b', 'tee', '긴팔', '티셔츠', 'tee2.jpg', '', '티', '티', 100, 100, 'green', 'large', sysdate);
insert into item values (21, 'b', 'tee', '긴팔', '티셔츠', 'tee2.jpg', '', '티', '티', 100, 100, 'green', 'large', sysdate);

-- 상품 분류 --
select distinct item_img, item_price, item_name from item where item_category = 'tee';
-- 상세분류 리스트 --
select distinct item_img, item_price, item_name from item where item_category = 'tee' and item_detail_category='긴팔';
-- 아이템 갯수 구하기 --
select count(*) from (select distinct item_code from item);
-----------------------------------------
----- 구매 (주문항목)
create table order_list (
 order_list_num number primary key,     -- 주문항목번호 primary key
 order_list_quantity number not null,   -- 수량
 order_list_price number not null,      -- 가격
 item_index number not null,            -- 상품코드
 order_num number not null,             -- 주문번호
 constraint fk_item_code foreign key(item_index)
 references item(item_index),
 constraint fk_order_num FOREIGN key (order_num)
 REFERENCES orders(order_num)
);
-- 시퀀스	객체
create sequence order_list_num nocycle nocache;
drop sequence order_list_num;  -- 시퀀스 삭제


----- 구매 (주문)
create table orders (
  order_num number primary key,      -- 주문번호  primary key
  order_date date default sysdate,   -- 주문 날짜
  id varchar2(20) not null,          -- 고객번호(고객 아이디)
  constraint fk_id foreign key (id)
  references shop_member(id)
);
-- 시퀀스	객체
create sequence order_num nocycle nocache;
drop sequence order_num;  -- 시퀀스 삭제
-- 테이블 확인하기
desc orders;
-- 테이블 데이터베이스 확인하기
select * from orders;
-- 구매에 데이터 넣기
insert into orders values(1, sysdate, 'hong');
---관심 품목
create table wish_list(
  id varchar2(20) not null,
  item_index number not null,
  constraint pk_wish_id primary key(id, item_index),
  constraint fk_member_id foreign key(id)
  references shop_member(id),
  constraint fk_item_index foreign key(item_index)
  references item(item_index)
);
------------------------------------------
-- 테이블 삭제
drop table notice purge;
drop table board_qna purge;
drop table review purge;
drop table shop_member purge;
drop table orders purge;
drop table order_list purge;
drop table item purge;
-- 저장하기
commit;
-- 전체 테이블 보기
select * from tab;
-- 테이블 이름 변경
alter table order_item rename to orders;
------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------