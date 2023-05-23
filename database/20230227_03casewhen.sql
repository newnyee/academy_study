-- 03_casewhen
-- ���ϸ� : 20230227_03casewhen.sql
-- ������ġ : D:\java202301\database


-- [CASE WHEN ~ THEN END ����]
-- ����)
--   CASE WHEN ����1 THEN ���Ǹ����� ��1
--        WHEN ����2 THEN ���Ǹ����� ��2
--        WHEN ����3 THEN ���Ǹ����� ��3
--          ...
--        ELSE ��
--   END ����÷���


-- �̸�, �ּҸ� ��ȸ�Ͻÿ� (��, �ּҴ� �ѱ۷� ��㼭 ��ȸ)
select uname, addr,
case addr when 'Seoul' then '����'
          when 'Jeju'  then '����'
          when 'Suwon' then '����'
          when 'Busan' then '�λ�'
          end as juso
from sungjuk;


-- ����) �̸�, ����, ���������� ��ȸ�Ͻÿ�
-- ���� : �������� 90�̻� 'A����'
--                 80�̻� 'B����'
--                 70�̻� 'C����'
--                 60�̻� 'D����'
--                 ������ 'F����'

select uname, kor,
case when kor>=90 then 'A����'
     when kor>=80 then 'B����'
     when kor>=70 then 'C����'
     when kor>=60 then 'D����'
     else 'F����'
     end as kor_grade
from sungjuk
order by kor desc;


-- Į���� �ѱ� ���� (�������)
select uname, kor,
case when kor>=90 then 'A����'
     when kor>=80 then 'B����'
     when kor>=70 then 'C����'
     when kor>=60 then 'D����'
     else 'F����'
     end as ��������
from sungjuk
order by kor desc;


-- between and ������
-- �������� ������ �����ϱ�
select uname, kor,
case when kor between 90 and 100 then 'A����'
     when kor between 80 and 89  then 'B����'
     when kor between 70 and 79  then 'C����'
     when kor between 60 and 69  then 'D����'
     else 'F����'
     end as ��������
from sungjuk
order by ��������;









