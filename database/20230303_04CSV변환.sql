-- 04_CSV��ȯ
-- ���ϸ� : 20230302_04CSV��ȯ.sql
-- ������ġ : D:\java202301\database


-- [CSV ����]
-- ��� �����Ͱ� ','�� ���еǾ� �ִ� ����


-- [CVS ������ �����ͺ��̽��� ��������]
-- �������������� https://data.go.kr/ Ȱ��


-- ��1) ���θ� �����ȣ ���̺� �����ϱ�
-- 1) zipdoro.csv �غ�

-- 2) zipdoro.csv ������ �����ϴ� zipdoro ���̺� ����
create table zipdoro (
   zipno       char(5)       --�����ȣ
 , zipaddress  varchar(1000) --�ּ�
);
commit;
drop table zipdoro;

-- 3) ��������� ��������
-- zipdoro ���̺� ��Ŭ�� -> ������ ����Ʈ (��������)
-- zipdoro ���̺� ��Ŭ�� -> export      (��������)

-- 4) ��ü �� ���� ��ȸ�ϱ�
select count(*) from zipdoro;


-- ��2) �ѱ��������б�_���ߵ��б���ġ.csv�� ��ȯ�ؼ� ���̺� �����Ͻÿ� (11873��)
create table school_location (
   sch_id       char(10)       null
 , sch_name     varchar(100)   null
 , sch_emh      varchar(20)    null
 , sch_adr      varchar(500)   null
 , date_time    date           null
 , update_time  date           null
 , loc_lttd     number(10,8)   null
 , loc_hrdns    number(10,7)   null
);
drop table school_location;
commit;

-- ����1) ����ִ� ��(null)�� ã���ÿ�
select *
from school_location
where sch_adr is null;
      

-- ����2) �� �õ��� �ʵ��б�, ���б� ������ 
select sch_adr, sch_emh, count(*) as "�б� ����"
from (select substr(sch_adr, 1 , 2) as sch_adr, sch_emh
      from school_location)
where sch_adr is not null
group by sch_adr, sch_emh
order by sch_adr, sch_emh desc;












