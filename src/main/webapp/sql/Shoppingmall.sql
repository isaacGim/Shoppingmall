------------------------------
------- �Խ��� [ �������� ]
-- ���̺� ����
create table notice ( 
 notice_num number primary key,            -- �Խù� ��ȣ seq
 notice_subject varchar2(30) not null,     -- �Խù� ����
 notice_content varchar2(1000) not null,   -- �Խù� ����
 notice_writer varchar2(30) not null,      -- �ۼ���
 notice_hit number,                        -- ��ȸ�� hit
 notice_date date default sysdate		       -- �ۼ��� 
);
-- ���̺� ����
drop table notice purge;
-- ������	��ü ����
create sequence notice_num nocycle nocache;
drop sequence notice_num;  -- ������ ����
-- C R U D create, read, update, delete
-- select �б�
select * from notice;
select * from notice where notice_num=2;
-- insert �� ����
insert into notice values (notice_num.nextval, '4', '������ ���� ����', 'ȫ�浿', 1, sysdate);
-- update �� ����
update notice set notice_subject='������', notice_content='�ݿ���' where notice_num=2;
-- delete �� ����
delete notice where notice_num=1;
-- �����ϱ�
commit;
-- ������ Ŀ�� �������� ���ư���
rollback;
-- �ε��� ��
-- hidden column - rownum
select * from
(select rownum rn, tt.* from 
(select * from notice order by notice_num desc) tt)
where rn>=1 and rn<=10;


------ �Խ��� [ Q&A ]
create table board_qna (
 board_qna_num  number primary key,         -- �Խù� ��ȣ seq
 board_qna_subject varchar2(100) not null,   -- �Խù� ����
 board_qna_content varchar2(300) not null,  -- �Խù� ����
 board_qna_img varchar2(30),       -- ��ǰ �̹���
 board_qna_writer varchar2(30) not null,    -- �ۼ���
 	board_qna_ref number not null,			-- ���ñ۹�ȣ
	board_qna_lev number not null,			-- ��۷���
	board_qna_seq number not null,			-- ���ñ��� ��¼���
 board_qna_date date default sysdate		    -- �ۼ��� 
);
-- ���̺� ����
alter table board_qna add board_qna_pwd varchar2(20);
drop table board_qna purge;
-- ������	��ü
create sequence board_qna_num nocycle nocache;
drop sequence board_qna_num;  -- ������ ����
-- C R U D create, read, update, delete
-- select �б�
select * from board_qna;
select * from board_qna where board_qna_num=2;
-- insert �� ����
insert into board_qna values (board_qna_num.nextval, '����', '�Խù� ����', 'img.jpg', '�ۼ���', 0,0,0, sysdate);
-- update �� ����
update notice set notice_subject='������', notice_content='�ݿ���' where notice_num=2;
-- delete �� ����
delete notice where notice_num=1;
-- �����ϱ�
commit;
-- ������ Ŀ�� �������� ���ư���
rollback;

-- Q&A �Խ��� ��� �ε��� ���� ��� ����-
--select * from (select rownum rn, tt.* from "  
--		+ "(select * from board2 order by board_re_ref desc, board_re_seq asc) tt) "  -
--		+ "where rn>=? and rn<=?";

----- �Խ��� [ �����ı� ]

create table review (
  review_num number primary key,          -- �Խù� ��ȣ seq
  review_subject varchar2(30) not null,   -- �Խù� ����
  review_content varchar2(100) not null,  -- �Խù� ����
  review_img varchar2(30) not null,       -- ��ǰ �̹���
  review_writer varchar2(30) not null,    -- �ۼ��� 
  review_grade varchar2(30) not null,     -- GRADE // ����
  review_like number,                     -- LIKE
   review_ref number not null,			-- ���ñ۹�ȣ
	 review_lev number not null,			-- ��۷���
	 review_seq number not null,			-- ���ñ��� ��¼���
  review_date date default sysdate		    -- �ۼ���
);
-- ������	��ü
create sequence review_num nocycle nocache;
drop sequence review_num;  -- ������ ����
-- ���̺� ����
drop table review purge;
commit;
------------------------------
----- ȸ������
create table shop_member ( 
  id varchar2(20) primary key,        -- ���̵�      // primary key 
  pwd varchar2(30) not null,          -- ��й�ȣ
  pwd_chk_q varchar2(30) not null,    -- ��й�ȣ Ȯ�� ����
  pwd_chk_a varchar2(30) not null,    -- ��й�ȣ Ȯ�� �亯
  name varchar2(10) not null,         -- �̸�
  addr1 varchar2(50) not null,        -- �⺻�ּ�
  addr2 varchar2(50) not null,        -- ������ �ּ�
  tel1 varchar2(10) not null,         -- �Ϲ���ȭ 1
  tel2 varchar2(10) not null,         -- �Ϲ���ȭ 2 
  tel3 varchar2(10) not null,         -- �Ϲ���ȭ 3
  phone1 varchar2(10) not null,       -- �޴���ȭ 1
  phone2 varchar2(10) not null,       -- �޴���ȭ 2
  phone3 varchar2(10) not null,       -- �޴���ȭ 3
  email1 varchar2(20) not null,       -- �̸��� 1
  email2 varchar2(20) not null,       -- �̸��� 2
  gender varchar2(20) not null,       -- ����
  birth_year varchar2(20) not null,   -- ������� �⵵
  birth_month varchar2(20) not null,  -- ������� ��
  birth_day varchar2(20) not null,    -- ������� ��
  birth_solar_lunar varchar2(20) not null,  -- ���, ���� 
  job varchar2(10) not null,          -- ����
  accounter varchar2(10) not null,    -- ������
  bank_name varchar2(20) not null,    -- �����
  account_num varchar2(30) not null    -- ���¹�ȣ
);
ALTER TABLE shop_member MODIFY (addr2 varchar2(80));
commit;
-- ���̺� ����
drop table shop_member purge;
delete from shop_member where id='kgwug';
-- ���̺� ���� Ȯ���ϱ�
desc shop_member;
-- ������ Ȯ���ϱ�
select * from shop_member;
-- ������ ����
insert into shop_member values ('hong', '1234', 'a', 'a', 'ȫ�浿', '����', '���α�', 02, 1234, 5678, 010, 1234, 5678, 'hong', 'naver.com', '��', 1990, 10, 15, '���', '������', 'ȫ�浿', '��������', '111-1111-111111');
insert into shop_member values ('go', '1234', 'a', 'a', '��浿', '����', '���α�', 02, 1234, 5678, 010, 1234, 5678, 'go', 'naver.com','naver.com', '��', 1990, 11, 15, '���', '������', '��浿', '��������', '123-2222-111111');
-- ������ ����
delete from shop_member where id='hong'; 
-- �÷� ���� --
ALTER TABLE shop_member DROP COLUMN email3;



-------------------------------
------ ��ǰ
create table item (
 item_index number primary key,         -- ��ǰ �ε��� 
 item_code varchar2(30) not null,       -- ��ǰ�ڵ�   // ��ǰ��ȣ primary key 
 item_category varchar2(30) not null,   -- ��ǰ�з�1
 item_detail_category varchar2(30) not null, -- �󼼻�ǰ�з�
 item_name varchar2(30) not null,       -- ��ǰ��
 item_img varchar2(30) not null,        -- ��ǰ �̹���
 item_detail_img VARCHAR2(30),          -- ��ǰ �� �̹���
 item_content varchar2(50) not null,    -- ��ǰ ����
 item_brand varchar2(20) not null,      -- �귣���
 item_price number not null,            -- ����
 item_quantity number not null,            -- ��� (����)
 item_color varchar2(20) not null,      -- color
 item_size varchar2(20) not null,       -- size
 item_date date default sysdate		      -- �����
);
-- ������	��ü
create sequence item_index nocycle nocache;
drop sequence item_index;  -- ������ ����

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
drop sequence item_index;  -- ������ ����
ALTER TABLE item ADD(item_detail_category VARCHAR2(30)); 

ALTER TABLE item ADD(item_detail_img VARCHAR2(30));

commit;
rollback;
-- ������ ���� --
delete from item where item_index in (3, 4, 5);

-- ������ ���� --
insert into item values (1, 'a', 'tee', '����', 'Ƽ', 'tee.jpg', '', 'Ƽ', 'Ƽ', 100, 100, 'red', 'large', sysdate);
insert into item values (2, 'a', 'tee', '����', 'Ƽ', 'tee.jpg', '', 'Ƽ', 'Ƽ', 100, 100, 'green', 'large', sysdate);
insert into item values (3, 'a', 'tee', '����', 'Ƽ����', 'tee2.jpg', '', 'Ƽ', 'Ƽ', 100, 100, 'green', 'large', sysdate);
insert into item values (4, 'a', 'tee', '����', 'Ƽ����', 'tee2.jpg', '', 'Ƽ', 'Ƽ', 100, 100, 'green', 'large', sysdate);
insert into item values (5, 'b', 'tee', '����', 'Ƽ����', 'tee2.jpg', '', 'Ƽ', 'Ƽ', 100, 100, 'green', 'large', sysdate);
insert into item values (6, 'b', 'tee', '����', 'Ƽ����', 'tee2.jpg', '', 'Ƽ', 'Ƽ', 100, 100, 'green', 'large', sysdate);
insert into item values (7, 'b', 'tee', '����', 'Ƽ����', 'tee2.jpg', '', 'Ƽ', 'Ƽ', 100, 100, 'green', 'large', sysdate);
insert into item values (8, 'a', 'tee', '����', 'Ƽ', 'tee.jpg', '', 'Ƽ', 'Ƽ', 100, 100, 'red', 'large', sysdate);
insert into item values (9, 'a', 'tee', '����', 'Ƽ', 'tee.jpg', '', 'Ƽ', 'Ƽ', 100, 100, 'green', 'large', sysdate);
insert into item values (10, 'a', 'tee', '����', 'Ƽ����', 'tee2.jpg', '', 'Ƽ', 'Ƽ', 100, 100, 'green', 'large', sysdate);
insert into item values (11, 'a', 'tee', '����', 'Ƽ����', 'tee2.jpg', '', 'Ƽ', 'Ƽ', 100, 100, 'green', 'large', sysdate);
insert into item values (12, 'b', 'tee', '����', 'Ƽ����', 'tee2.jpg', '', 'Ƽ', 'Ƽ', 100, 100, 'green', 'large', sysdate);
insert into item values (13, 'b', 'tee', '����', 'Ƽ����', 'tee2.jpg', '', 'Ƽ', 'Ƽ', 100, 100, 'green', 'large', sysdate);
insert into item values (14, 'b', 'tee', '����', 'Ƽ����', 'tee2.jpg', '', 'Ƽ', 'Ƽ', 100, 100, 'green', 'large', sysdate);
insert into item values (15, 'a', 'tee', '����', 'Ƽ', 'tee.jpg', '', 'Ƽ', 'Ƽ', 100, 100, 'red', 'large', sysdate);
insert into item values (16, 'a', 'tee', '����', 'Ƽ', 'tee.jpg', '', 'Ƽ', 'Ƽ', 100, 100, 'green', 'large', sysdate);
insert into item values (17, 'a', 'tee', '����', 'Ƽ����', 'tee2.jpg', '', 'Ƽ', 'Ƽ', 100, 100, 'green', 'large', sysdate);
insert into item values (18, 'a', 'tee', '����', 'Ƽ����', 'tee2.jpg', '', 'Ƽ', 'Ƽ', 100, 100, 'green', 'large', sysdate);
insert into item values (19, 'b', 'tee', '����', 'Ƽ����', 'tee2.jpg', '', 'Ƽ', 'Ƽ', 100, 100, 'green', 'large', sysdate);
insert into item values (20, 'b', 'tee', '����', 'Ƽ����', 'tee2.jpg', '', 'Ƽ', 'Ƽ', 100, 100, 'green', 'large', sysdate);
insert into item values (21, 'b', 'tee', '����', 'Ƽ����', 'tee2.jpg', '', 'Ƽ', 'Ƽ', 100, 100, 'green', 'large', sysdate);

-- ��ǰ �з� --
select distinct item_img, item_price, item_name from item where item_category = 'tee';
-- �󼼺з� ����Ʈ --
select distinct item_img, item_price, item_name from item where item_category = 'tee' and item_detail_category='����';
-- ������ ���� ���ϱ� --
select count(*) from (select distinct item_code from item);
-----------------------------------------
----- ���� (�ֹ��׸�)
create table order_list (
 order_list_num number primary key,     -- �ֹ��׸��ȣ primary key
 order_list_quantity number not null,   -- ����
 order_list_price number not null,      -- ����
 item_index number not null,            -- ��ǰ�ڵ�
 order_num number not null,             -- �ֹ���ȣ
 constraint fk_item_code foreign key(item_index)
 references item(item_index),
 constraint fk_order_num FOREIGN key (order_num)
 REFERENCES orders(order_num)
);
-- ������	��ü
create sequence order_list_num nocycle nocache;
drop sequence order_list_num;  -- ������ ����


----- ���� (�ֹ�)
create table orders (
  order_num number primary key,      -- �ֹ���ȣ  primary key
  order_date date default sysdate,   -- �ֹ� ��¥
  id varchar2(20) not null,          -- ����ȣ(�� ���̵�)
  constraint fk_id foreign key (id)
  references shop_member(id)
);
-- ������	��ü
create sequence order_num nocycle nocache;
drop sequence order_num;  -- ������ ����
-- ���̺� Ȯ���ϱ�
desc orders;
-- ���̺� �����ͺ��̽� Ȯ���ϱ�
select * from orders;
-- ���ſ� ������ �ֱ�
insert into orders values(1, sysdate, 'hong');
---���� ǰ��
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
-- ���̺� ����
drop table notice purge;
drop table board_qna purge;
drop table review purge;
drop table shop_member purge;
drop table orders purge;
drop table order_list purge;
drop table item purge;
-- �����ϱ�
commit;
-- ��ü ���̺� ����
select * from tab;
-- ���̺� �̸� ����
alter table order_item rename to orders;
------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------