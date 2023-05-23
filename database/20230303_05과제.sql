-- 05_����
-- ���ϸ� : 20230303_05����.sql
-- ������ġ : D:\java202301\database

select * from tb_student;
select * from tb_gwamok;
select * from tb_sugang;

-- ��1) ������ �������߿��� ������ ���� ���� �������� ������û�� ����� ��ȸ�Ͻÿ�
--  (�й�, �̸�, �����ڵ�)
select a.hakno, b.uname, c.gcode --3.�й�, �̸�, �����ڵ� ��ȸ
from tb_sugang a join tb_student b --1.3�� ���̺� ����
on a.hakno = b.hakno
join tb_gwamok c
on a.gcode = c.gcode
where ghakjum in (select max(ghakjum) 
                  from tb_gwamok
                  where gcode like ('d%')) --2.������ ������ ������ ���� ������ ã��
and a.gcode like ('d%')
order by ghakjum desc; --4.���������� �����ϱ�


-- ��2) �й��� ������û�� �������� ���ϰ� �й������� �����ؼ� �ٹ�ȣ 4~6�� ��ȸ�Ͻÿ�
--  (��, ������û���� ���� �л��� �������� 0���� ǥ��)
select hakno, uname, "������" --9.�й�, �̸�, "������"��ȸ
from (select D.*, rownum as rnum --6.D���̺� ��üĮ��, rownum ���̱�
      from(select a.hakno, sum(nvl(ghakjum,0)) as "������", a.uname --3.�й�, �̸�, "������" ��ȸ
          from tb_student a left join tb_sugang b --1.���̺� 3�� ����
          on a.hakno = b.hakno
          left join tb_gwamok c
          on b.gcode = c.gcode         
          group by a.hakno, a.uname --2.����, �̸����� �׷�ȭ
          order by hakno) D) --4.�й������� �����ϱ� --5.from D���̺� --7.from rownum�������̺�
where rnum BETWEEN 4 and 6; --8.rownum�� 4~6�� ��������


-- ��3) �й����� ������û �������� ���ϰ�, ������������ �������� ������
--   ������ ���� 1�Ǹ� ��ȸ�Ͻÿ� (�й�, �̸�, ������)
select hakno, uname, "������" --9.�й�, �̸�, "������"��ȸ
from (select D.*, rownum as rnum --6.D���̺� ��üĮ��, rownum ���̱�
      from(select a.hakno, sum(nvl(ghakjum,0)) as "������", a.uname --3.�й�, �̸�, "������" ��ȸ
          from tb_student a left join tb_sugang b --1.���̺� 3�� ����
          on a.hakno = b.hakno
          left join tb_gwamok c
          on b.gcode = c.gcode
          group by a.hakno, a.uname --2.����, �̸����� �׷�ȭ
          order by "������" desc) D) --4.������ �������� �����ϱ� --5.from D���̺� --7.from rownum�������̺�
where rnum = 1; --8.rownum�� ù��°�� ��������
















