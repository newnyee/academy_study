-- 01_���̺�����
-- ���ϸ� : 20230302_01���̺�����.sql
-- ������ġ : D:\java202301\database


-- [���̺� ���� ��������]

-- ��ü �� ����
select * from tb_student;
select * from tb_gwamok;
select * from tb_sugang;

��2) �������� ������û �ο���, ������ ��ȸ�Ͻÿ�
select address, count(*) || '��' as cnt
from (select a.hakno, address 
      from (select hakno
            from tb_sugang
            group by hakno) a 
      inner join tb_student b
      on a.hakno = b.hakno)
group by address; --group by ���� �ش� Į���� ���� ���������� �ڵ� ������ ��

��3) ���� ���� ��û �ο���, �����ڵ�, ����� ��ȸ�Ͻÿ� 
     d001  HTML    2��
     d002  ���伥    1��
     d003  �Ϸ���Ʈ  1��
     p001  JAVA    4��
     p002  Oracle  2��
     p003  JSP     2��
     p004  Python  1��
     
select a.gcode, gname, concat(count(*), '��') as "�ο���"
from tb_sugang a inner join tb_gwamok b
on a.gcode = b.gcode
group by gname, a.gcode
order by a.gcode;

     
��4) �й��� ������û������ �������� �й��������� ��ȸ�Ͻÿ�
     g1001  ȫ�浿  12����
     g1002  ȫ�浿   8����
     g1005  ���޷�  12����
     g1006  ������   3����
     
select hakno, uname, sum(ghakjum) as "������"
from (select a.hakno, b.uname, c.ghakjum
      from tb_sugang a inner join tb_student b
      on a.hakno = b.hakno
      inner join tb_gwamok c
      on a.gcode = c.gcode)
group by hakno, uname;


��5) �й� g1001�� ������û�� ������ �����ڵ庰�� ��ȸ�Ͻÿ�
     g1001  d001  HTML
     g1001  p001  JAVA
     g1001  p002  Oracle
     g1001  p003  JSP
     g1001  p004  Python

select a.hakno, b.gcode, b.gname
from tb_sugang a 
inner join tb_gwamok b
on a.gcode = b.gcode
where a.hakno = 'g1001' --> ���� �ڹ��ڵ忡�� �й��� ����ó�� ��
order by gcode;

��6) ������û�� �� �л����� �й�, �̸� ��ȸ
     g1001  ȫ�浿
     g1002  ȫ�浿
     g1005  ���޷�
     g1006  ������

select a.hakno, b.uname
from tb_sugang a inner join tb_student b
on a.hakno = b.hakno
group by a.hakno, b.uname
order by hakno;

select hakno, uname
from tb_student
where hakno in (select hakno from tb_sugang)
order by hakno;


��7)������û�� ���� ���� �л����� �й�, �̸� ��ȸ
     g1003  ������
     g1004  ȫ�浿

select a.hakno, a.uname
from tb_student a left join tb_sugang b
on a.hakno = b.hakno
where gcode is null
group by a.hakno, a.uname
order by hakno;

select hakno, uname
from tb_student
where hakno not in (select hakno from tb_sugang)
order by hakno;









