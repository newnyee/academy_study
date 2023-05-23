-- 03_����¡
-- ���ϸ� : 20230303_03����¡.sql
-- ������ġ : D:\java202301\database


-- [rownum�� Ȱ���� ����¡]
-- �ٹ�ȣ
select hakno, uname, rownum from tb_student;

-- �ٹ�ȣ�� ��Ī �ο��ϱ�
select hakno, uname, rownum as rnum
from tb_student
order by uname;

-- �ٹ�ȣ 1~3 ���� ��ȸ
select hakno, uname, rownum from tb_student where rownum>=1 and rownum<=3;

-- �ٹ�ȣ 4~6 ���� ��ȸ (��ȸ�ȵ�)
select uname, hakno, address, rownum from tb_student where rownum>=4 and rownum<=6;


-- [rownum�� Ȱ���� ����¡]
-- rownum�� ����Į���̹Ƿ� �������� ���� ������� ����, ����Į������ �ν��� ����� ���� ��õ
-- rownumĮ���� �������� �Ŀ� �ٹ�ȣ �߰��ϰ� �������� Ȱ���Ѵ�

-- ��) �ٹ�ȣ(rownum)�� �̿��ؼ� �ٹ�ȣ 4~6 ��ȸ
select *
from (select A.*, rownum as rnum
      from (select uname, hakno, address
            from tb_student
            order by uname) A)
where rnum between 4 and 6;











