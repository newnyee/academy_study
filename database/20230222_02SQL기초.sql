-- 02_SQL����
-- ���ϸ� : 20230222_02SQL����.spl
-- ������ġ : D:\java202301\database


-- [sungjuk ���̺� ����]
drop table sungjuk;


-- [sungjuk ���̺� ����]
create table sungjuk (
   uname varchar(50) not null --50byte �̳��� ������, ���� ������� ����
 , kor   int         not null --������, ���� ������� ����
 , eng   int         not null --������, ���� ������� ����
 , mat   int         not null --������, ���� ������� ����
 , tot   int         null     --�� ���
 , aver  int                  --�ƹ��͵� ���� ������ �ڵ����� null, ���������ϳ� �����ϸ� ���ִ°��� ����
);


-- [���� ������ �� �߰�]
-- insert�� ������� �ȵ��� ������ ������ �ؼ� ������
insert into sungjuk(uname,kor,eng,mat) values ('ȫ�浿',  70, 85, 100);
insert into sungjuk(uname,kor,eng,mat) values ('����ȭ',  30, 30, 40);
insert into sungjuk(uname,kor,eng,mat) values ('���޷�',  90, 90, 20);
insert into sungjuk(uname,kor,eng,mat) values ('������',  100,60, 30);
insert into sungjuk(uname,kor,eng,mat) values ('���϶�',  30, 80, 40);
insert into sungjuk(uname,kor,eng,mat) values ('����ȭ',  80, 80, 20);
insert into sungjuk(uname,kor,eng,mat) values ('���ѹα�',10, 65, 35);
insert into sungjuk(uname,kor,eng,mat) values ('�عٶ��',30, 80, 40);
insert into sungjuk(uname,kor,eng,mat) values ('���Ȳ�',  30, 80, 20);
insert into sungjuk(uname,kor,eng,mat) values ('���ѹα�',100,100,100);


-- [��ü Į�� ��ȸ]
select uname, kor, eng, mat, tot, aver from sungjuk;


-- [��ü �� ���� ��ȸ]
select count(*) from sungjuk; --10


-- [select]
-- ��ȸ �� �˻�
select kor, eng, mat from sungjuk;
select tot, aver from sungjuk;
select * from sungjuk; -- ��ü Į�� ��ȸ


-- [as]
-- Į������ �ӽ� ����
-- ���� �����Ϳ� �̸� ���� �� ���
-- ���� �÷����� �ٲ�°��� �ƴ�
select kor as korea, eng as english, mat as mate from sungjuk;

-- as ���� ����
select kor korea, eng english, mat math from sungjuk;

-- �ӽ� �ѱ� �÷����� �Ͻ������� �м��ؾ� �ϴ� ��츸 ��õ
select uname as �̸�, kor as ����, eng as ����, mat as ����, tot ����, aver ���
from sungjuk;


-- Į���� ������ �ǹ̰� ����
select uname, kor, eng, mat from sungjuk;
select kor, eng, mat, uname from sungjuk;


-- [count �Լ�]
-- �� ���� ��ȸ
select count(uname) from sungjuk; --count(uname) 10
select count(kor) from sungjuk; --count(kor) 10
select count(eng) from sungjuk; --count(eng) 10
select count(mat) from sungjuk; --count(mat) 10

-- null���� ī��Ʈ���� ���� (0)
select count(tot) from sungjuk; --count(tot) 0
select count(aver) from sungjuk; --count(aver) 0

-- count�� as �Բ� ���
select count(eng) as cnt_eng from sungjuk;

-- �ӽ� Į�������� �ѱ� ����
select count(mat) as ���а��� from sungjuk;

--sungjuk ���̺��� ��ü ���� ����
select count(*) from sungjuk;
select count(*) as ��ü�హ�� from sungjuk;
select count(*) ��ü�హ�� from sungjuk; --as ����

