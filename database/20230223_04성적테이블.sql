-- 04_�������̺�
-- ���ϸ� : 20230223_04�������̺�.sql
-- ������ġ : D:\java202301\database


-- sungjuk ���̺� ����
drop table sungjuk;
commit;

-- sungjuk ���̺� ����
create table sungjuk (
   sno    int         not null
 , uname  varchar(50) not null
 , kor    int         not null
 , eng    int         not null
 , mat    int         not null
 , tot    int         null
 , aver   int         null
 , addr   varchar(20) null
 , wdate  date        null
);

-- table ��ü ��ȸ
select * from sungjuk;

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


-- [����]

-- ��1) ��ü�࿡ ���ؼ� ����(tot), ���(aver)�� ���Ͻÿ�
update sungjuk
set tot=(kor+eng+mat), aver=(kor+eng+mat)/3;

-- ��2) �̸��� '��' ���ڰ� �ִ� ���� ��ȸ�Ͻÿ�
select *
from sungjuk
where uname like '%��%';

-- ��3) �ּҰ� ����, ���� ���� ��ȸ�Ͻÿ�
select *
from sungjuk
where addr in ('Seoul', 'Jeju');

-- ��4) ������ ������ ��� 90�� �̻� ���� ����� ��ȸ�Ͻÿ�
select count(*) cnt
from sungjuk
where kor>=90 and eng>=90 and mat>=90;

-- ��5) �ּҺ��� �����ؼ� ��ȸ�Ͻÿ�. �ּҰ� ���ٸ� �Ϸù�ȣ ������ �ٽ� �����ؼ� ��ȸ�Ͻÿ�
select *
from sungjuk
order by addr, sno;

select sno, uname, kor, eng, mat, tot, aver, addr, wdate, rnum
from (select A.*, rownum as rnum from (SELECT * FROM sungjuk ORDER BY uname) A)
where rnum between 4 and 6;



select * from sungjuk;
select * from tb_student;
select * from tb_gwamok;
select * from tb_sugang;

select hakno, gcode, gname

select a.hakno, a.gcode, gname
from (select hakno, gcode from tb_sugang where hakno = 'g1001') a
join tb_gwamok b
on a.gcode = b.gcode
order by gcode;

select a.hakno, a.gcode, gname
from tb_sugang a join tb_gwamok b
on a.gcode = b.gcode
where a.hakno = 'g1001'
order by gcode;










