-- 04_��������
-- ���ϸ� : 20230227_04��������.sql
-- ������ġ : D:\java202301\database


-- [��������]
-- SQL�� �� �� �ٸ� SQL��
-- ���̺� ������ �ٽ� �� �� �������� ���� �� ��ȸ �� �˻�


-- ���������� ��պ��� ���� ������ ���� �л��� �̸��� ��ȸ�Ͻÿ�
select uname, kor
from sungjuk
where kor >= (select round(avg(kor),0) from sungjuk);


-- ��2) �������� �л����� ��� �������� �̻��� ���������� ���� �л��� ����, �̸�, ���������� ��ȸ�Ͻÿ�
select addr, uname, kor
from sungjuk
where kor>=(select avg(kor) from sungjuk where addr='Seoul');


-- ��3) �������� �л����� ��� �������� �̻��� ���������� ���� ���� �̿��� ���� �л��� ����, �̸�, ���������� ��ȸ�Ͻÿ�
select addr, uname, kor
from sungjuk
where kor>=(select avg(kor) from sungjuk where addr='Seoul') and addr!='Seoul';


-- ��4) ������ �ּ����� ������ �������� �Ǵ� ���������� ���� �л��� �ִ��� �̸�, ��������, ���������� ��ȸ�Ͻÿ�
select uname, eng, mat
from sungjuk
where eng<=(select min(kor) from sungjuk) or mat<=(select min(kor) from sungjuk);















