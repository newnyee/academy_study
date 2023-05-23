-- 02_��
-- ���ϸ� : 20230306_02��.sql
-- ������ġ : D:\java202301\database


-- [�� View]
select * from sungjuk;

-- �ּҰ� ����, ���������� �̸�, ��, ��, ��, �ּҸ� ��ȸ�Ͻÿ�
select uname, kor, eng, mat , addr
from sungjuk
where addr in ('Seoul', 'Jeju');

create or replace view test1_view
as
   select uname, kor, eng, mat , addr
   from sungjuk
   where addr in ('Seoul', 'Jeju');
   

-- ���̺�, �� ��� Ȯ��
select * from tab; --��� ��ü ���� Ȯ��
select * from tab where tabtype = 'TABLE'; --���̺� ���
select * from tab where tabtype = 'VIEW'; --�� ���


-- ������ ��� ���̺�ó�� ��� �����ϴ�
select * from test1_view;


-- �����ͻ���(user_views ���̺�)���� ���� ���� ���� Ȯ��
select * from user_views;
select text from user_views where view_name = 'TEST1_VIEW';

-- �� ����
drop view test1_view;


-- test2_view ���� (alias ��Ī)
create or replace view test2_view
as
    select uname as �̸�, kor as ����, eng as ����, mat as ����, addr as �ּ�
    from sungjuk
    where addr in ('Seoul', 'Jeju');
    
select * from test2_view;


��) ������û�� �л����� �й�, �������� ��� �����Ͻÿ�(test3_view)
     g1001  14����
     g1002  8����
     g1005  12����
     g1006  3����

-- 1) ������û������ ������ �����ͼ� �й����� ������ ���ϱ�
select a.hakno, sum(b.ghakjum) || '����' as ������
from tb_sugang a join tb_gwamok b
on a.gcode = b.gcode
group by a.hakno;

-- 2) 1)�� ����� test3_view �� �����ϱ�
create or replace view test3_view
as
    select a.hakno as �й�, sum(b.ghakjum) || '����' as ������
    from tb_sugang a join tb_gwamok b
    on a.gcode = b.gcode
    group by a.hakno;

select * from test3_view;


-- 3) 2)���� ������ ��� �л����̺��� �����ؼ� �й�, �̸�, ������ ����ϱ�
select a.uname, b.*
from tb_student a join test3_view b
on hakno = �й�
order by a.hakno;



   