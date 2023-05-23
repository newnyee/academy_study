-- 02_left����
-- ���ϸ� : 20230302_02left����.sql
-- ������ġ : D:\java202301\database


-- [left join �� right join]
-- �л����̺��� ��� ���� ��������, �������̺��� �й��� ��ġ�ϴ� �ุ ��������
select a.*, b.*
from tb_student a left join tb_sugang b
on a.hakno = b.hakno;

-- ��1) left join�� �̿��Ͽ� ������û�� ���� ���� �й�, �̸��� ��ȸ�Ͻÿ�
select a.hakno, uname
from tb_student a left join tb_sugang b
on a.hakno = b.hakno
where gcode is null
group by a.hakno, a.uname
order by hakno;

-- ��2) right join�� �̿��Ͽ� ������û�� ���� ���� �й�, �̸��� ��ȸ�Ͻÿ�
select b.hakno, uname
from tb_sugang a right join tb_student b
on a.hakno = b.hakno
where gcode is null
group by b.hakno, b.uname
order by hakno;


-- [(+)��ȣ�� �̿��� ���̺� ����]
-- (+)��ȣ�� ��ġ���� �ʴ� ���� �������� ���� �ʿ� ���δ�

select a.hakno, a.uname, b.gcode, b.hakno
from tb_student a, tb_sugang b
where a.hakno = b.hakno (+); -- left join

select b.hakno, b.uname, a.gcode, a.hakno
from tb_sugang a, tb_student b
where a.hakno = b.hakno (+); -- right join





