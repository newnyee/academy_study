-- 03_������
-- ���ϸ� : 20230223_03������.sql
-- ������ġ : D:\java202301\database


-- �ڵ����� �Ϸù�ȣ �ο�
-- Oracle Database : sequence ����
-- M*SQL Database : identity ��������


-- sungjuk ����
drop table sungjuk; -- ���̺����
delete from sungjuk; -- �������
commit;

-- sungjuc ���̺� �ۼ�
create table sungjuk (
   sno    int         not null  -- �����̸Ӹ� Ű
 , uname  varchar(50) not null
 , kor    int         not null
 , eng    int         not null
 , mat    int         not null
 , tot    int         null
 , aver   int         null
 , addr   varchar(20) null
 , wdate  date        null
);

-- ���߰� (����)
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(1, 'ȫ�浿', 89, 88, 87, 'Seoul', '2023-02-23'); --��¥ �����ʹ� ���ڿ� ���·� �߰�
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(2, 'ȫ�浿', 89, 88, 87, 'Seoul', '2023-02-23');
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(3, 'ȫ�浿', 89, 88, 87, 'Seoul', '2023-02-23');
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(4, 'ȫ�浿', 89, 88, 87, 'Seoul', '2023-02-23');

select * from sungjuk;



-- [������ Sequence]
-- �Ϸù�ȣ �ڵ� ����
-- ������ ����: create sequence ��������;
-- ������ ����: drop sequence ��������;


-- ������ ���� ����
-- create sequence ��������; -- 1�� ����(�⺻)
-- create sequence �������� increment by ������ start with ���۰�; -- ���۰��� �������� ������

-- sungjuk ���̺��� ����� ������ ����
create sequence sungjuk_seq;

-- ������ ����
drop sequence sungjuk_seq;


-- [sysdate �Լ�] - �ý����� ���� ��¥ ����


-- �������� sysdate�Լ��� �̿��� �� �߰� �׽�Ʈ
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval, 'ȫ�浿', 89, 88, 87, 'Seoul', sysdate);


delete from sungjuk where sno=2;

commit;





