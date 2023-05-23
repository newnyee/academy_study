-- 04_���̺����� 
-- ���ϸ� : 20230302_04���̺�����.sql
-- ������ġ : D:\java202301\database

-- [���̺� ����]
-- ���� ���̺��� �ϳ��� ���̺�ó�� ����ϴ� ����
-- �ΰ��̻��� ���̺��� �����Ͽ� �����͸� �����ϴ� ���
-- �����̺��� ���밪�� �̿��Ͽ� �÷��� �����ϴ� ����
-- ����)
    select Į����
    from ���̺�1 join ���̺�2
    on ������;                --ANSI(ǥ��) SQL��
    
    select Į����
    from ���̺�1, ���̺�2
    on ������;                --Oracle DB SQL��
    
    select x.Į���̸�A,
           y.Į���̸�B,
           z.Į���̸�C
    from ���̺�X x inner join ���̺�Y y
         on x.�÷��̸�M=y.�÷��̸�N
                   inner join ���̺��̸�Z z
         on y.�÷��̸�O=z.�÷��̸�Q;
         
-- ���ǰ� : where ������, having ������, on ������

-- ������ ���̺�� ���� ���̺��� ���� ������ �����̴�
-- ������ ���̺� : ���� create table�� ���̺�
-- ���� ���̺� : SQL���� ���� ������ ���̺�

select * from tb_sugang;
select * from tb_student;
select * from tb_gwamok;


-- �й��� �������� �������̺�� �л����̺� ����
select tb_sugang.*, tb_student.*
from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno;


-- �����̺��� ������ ����. inner��������. ���� �⺻
select tb_sugang.*, tb_student.*
from tb_sugang join tb_student
on tb_sugang.hakno = tb_student.hakno;


-- ������û�� �л����� �й�, �����ڵ�, �̸�, �̸����� ��ȸ�Ͻÿ�
select tb_sugang.*, tb_student.uname, tb_student.email
from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno;


-- �����ڵ带 �������� �������̺�� �������̺� ����
select tb_sugang.*, tb_gwamok.gname, tb_gwamok.ghakjum
from tb_sugang inner join tb_gwamok
on tb_sugang.gcode = tb_gwamok.gcode;


-- 3�� ���̺� ���� : �������̺� + �л����̺�(�̸�) + �������̺�(�����)
select tb_sugang.*, tb_student.uname, tb_gwamok.gname
from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno
inner join tb_gwamok
on tb_sugang.gcode = tb_gwamok.gcode;


-- ���̺��� alias(��Ī)�� ���� (��ҹ��� ���о���)
select SU.*, ST.uname, ST.email
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno;

select su.*, gw.gname, gw.ghakjum
from tb_sugang SU join tb_gwamok GW
on su.gcode = gw.gcode;


--������̺��� ��� Į�� ��ȸ�ϱ�
select *
from tb_sugang su join tb_student st
on su.hakno = st.hakno join tb_gwamok gw
on su.gcode = gw.gcode;


-- ��ȸ�� ���̺��� �ߺ����� ���� Į������ ���̺���� ������ �� �ִ�
select su.*, uname, email, gname, ghakjum
from tb_sugang su join tb_student st
on su.hakno = st.hakno join tb_gwamok gw
on su.gcode = gw.gcode;


-- �ߺ��Ǵ� Į������ �Ҽ� ���̺���� ��Ȯ�� ����ؾ� �Ѵ�
-- ORA-00918: ���� ���ǰ� �ָ��մϴ�
select hakno, gcode, uname, email, gname, ghakjum --����
from tb_sugang su join tb_student st
on su.hakno = st.hakno join tb_gwamok gw
on su.gcode = gw.gcode;

select su.hakno, su.gcode, uname, email, gname, ghakjum
from tb_sugang su join tb_student st
on su.hakno = st.hakno join tb_gwamok gw
on su.gcode = gw.gcode;

--------------------------------------------------------------------------------
-- [���̺� ���� ���� ����]
-- ��1) ������û�� �� �л��� �߿��� '����'�� ��� �л��鸸 �й�, �̸�, �ּҸ� ��ȸ�Ͻÿ�
select a.hakno, uname, address
from tb_sugang a join tb_student b
on a.hakno = b.hakno
where address = '����';

-- ������ ���� ���̺��� �̸��� aa��� �����ϰ�, �ٽ� �簡�� �� �� �ִ�
select aa.hakno, aa.gcode, aa.uname, aa.address
from (select su.hakno, su.gcode, uname, address
      from tb_sugang su join tb_student st
      on su.hakno = st.hakno) aa
where aa.address = '����';

-- aa��Ī ���� ����
select hakno, gcode, uname, address
from (select su.hakno, su.gcode, uname, address
      from tb_sugang su join tb_student st
      on su.hakno = st.hakno) aa
where aa.address = '����';

-- aa���̺��� ��� Į��
select *
from (select su.hakno, su.gcode, uname, address
      from tb_sugang su join tb_student st
      on su.hakno = st.hakno) aa
where aa.address = '����';

��2) �������� ������û �ο���, ������ ��ȸ�Ͻÿ�
select address, count(*) as "�ο���"
from tb_sugang a join tb_student b
on a.hakno = b.hakno
group by address;

select *
from tb_sugang a right outer join tb_student b
on a.hakno = b.hakno;