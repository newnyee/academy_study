-- 05_��������
-- ���ϸ� : 20230223_05��������.sql
-- ������ġ : D:\java202301\database


-- sungjuk ���̺� ����
drop table sungjuk;
commit;

-- sungjuk ���̺� ��ȸ
select uname, tot, aver, wdate from sungjuk;

-- sungjuk ���̺� ����
create table sungjuk (
   sno    int         primary key
 , uname  varchar(50) not null
 , kor    int         check(kor between 0 and 100) --�������� 0 ~ 100 ���̸� �Է� ����
 , eng    int         check(eng between 0 and 100) --�������� 0 ~ 100 ���̸� �Է� ����
 , mat    int         check(mat between 0 and 100) --�������� 0 ~ 100 ���̸� �Է� ����
 , addr   varchar(50) check(addr in ('Seoul', 'Jeju', 'Busan', 'Suwon'))
 , tot    int         default 0
 , aver   int         default 0
 , wdate  date        default sysdate --�μ�Ʈ �Ǵ� ������ �ڵ����� ����Ʈ ���� ��
);


-- primary key ��������
-- ORA-00001: ���Ἲ ���� ����(SYSTEM.SYS_C007314)�� ����˴ϴ�
-- sno Į���� �⺻Ű(PK)�̹Ƿ� �ߺ��� ���� ������� ����
insert into sungjuk(sno, uname) values(1, 'ȫ�浿'); --2�� �������� �� ���� �߻�


-- not null ����
-- ORA-01400: NULL�� ("SYSTEM"."SUNGJUK"."UNAME") �ȿ� ������ �� �����ϴ�
insert into sungjuk(sno) values(2); --uname Į���� not null �̹Ƿ� �ݵ�� ���� �Է��ؾ� ��

insert into sungjuk(sno, uname) values(2, '1234567890');
insert into sungjuk(sno, uname) values(3, 'ABCDEFGHIJ');
insert into sungjuk(sno, uname) values(4, 'ABCDEFGHIJK');
insert into sungjuk(sno, uname) values(5, '����ȭ');
insert into sungjuk(sno, uname) values(6, '���ѹα�');


-- check ��������
insert into sungjuk(sno, uname, kor, eng, mat)
values(1, 'ȫ�浿', -10, 20, 300);

insert into sungjuk(sno, uname, kor, eng, mat, addr)
values(2, 'ȫ�浿', 10, 20, 30, 'Incheon');


-- default ��������
-- tot�� aver�� 0 �Է�, wdate�� ���� ��¥�� �Էµ�
insert into sungjuk(sno, uname, kor, eng, mat, addr)
values(2, 'ȫ�浿', 10, 20, 30, 'Seoul');



