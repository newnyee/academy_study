-- 06_group
-- ���ϸ� : 20230223_06group.sql
-- ������ġ : D:\java202301\database

-- sungjuk ���̺� ����
drop table sungjuk;
commit;

-- sungjuk ���̺� ����
create table sungjuk (
   sno    int         primary key
 , uname  varchar(50) not null
 , kor    int         check(kor between 0 and 100)
 , eng    int         check(eng between 0 and 100)
 , mat    int         check(mat between 0 and 100)
 , addr   varchar(50) check(addr in ('Seoul', 'Jeju', 'Busan', 'Suwon'))
 , tot    int         default 0
 , aver   int         default 0
 , wdate  date        default sysdate
);

-- sungjuk ���̺� �Է� ������
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval,'����Ƽ��', 90, 85, 95, 'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',40,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'���޷�',90,50,90,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'������',20,50,20,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',90,90,90,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'���Ȳ�',50,50,90,'Suwon',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'������',70,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'�ҳ���',90,60,90,'Busan',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'������',20,20,20,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'ȫ�浿',90,90,90,'Suwon',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',80,80,90,'Suwon',sysdate);

-- table ��ȸ
select * from sungjuk;


-- [������ �׷�ȭ]

-- [distinct]
-- Į���� �ߺ� ������ ������ ��ǥ�� 1���� ���
-- ����) distinct [Į����]
select addr from sungjuk order by addr; --sungjuk ���̺��� ��� addrĮ���� ���� �����������ķ� ��µ�

select distinct(addr) from sungjuk; --sungjuk ���̺��� �ߺ����� ���ŵ� ��ǥ�� addr�� 1������ ���
select distinct(uname) from sungjuk;


-- [group by]
-- Į���� ���� ���볢�� �׷�ȭ ��Ŵ
-- ����) group by Į��1, Į��2, Į��3, ...

-- �ּҰ� ������ ���� �׷�ȭ ��Ű�� �ּҸ� ��ȸ
select addr 
from sungjuk
group by addr; --distinct�� ����� ����

--select [group by�� ��������μ� �˰���� �÷��� ������] --��, �׷�ȭ ��Ű�� ���� �� �ִ� ���� 1���� ������ ���� ��ȸ
--from [���̺��]
--group by [�׷�ȭ�� �÷�-> �÷� ���� ������ �׷�ȭ ��];

-- ORA-00979: GROUP BY ǥ������ �ƴմϴ�.
select addr
from sungjuk
group by addr, mat; --����








