-- 02_sort
-- ���ϸ� : 20230223_02sort.sql
-- ������ġ : D:\java202301\database


-- [sort ����]
-- Ư����(keyfield)�� �������� ������� ���ġ
-- Ű���� �����ϸ� �⺻ �������� ����
-- �������� : Ascending Sort (ASC) 1->10, A->Z, a->z, ��->��
-- �������� : Descending Sort (DESC)
-- ����) order by Į����1(1������), Į����2(2������), Į����3(3������), ~~

-- sungjuk ���̺��� ��ȸ�Ͻÿ�
select * from sungjuk;

-- ��ü ���ڵ带 �̸������� �����ؼ� ��ȸ�Ͻÿ�
select *
from sungjuk
order by uname asc; -- �������� ����, asc ��������

select *
from sungjuk
order by uname desc; -- �������� ����

-- 1�� ����: �������� ������ �����ؼ� ��ȸ�Ͻÿ�
select * 
from sungjuk
order by korea;

-- 2�� ����: ���������� ���ٸ� �̸��� �������� �������� �����Ͻÿ�
select * 
from sungjuk
order by korea, uname desc;

-- 3�� ����: ��������, ��������, ���������� �������� �����Ͻÿ�
select * 
from sungjuk
order by korea desc, eng desc, mat desc;

-- ��� 70�� ���� ���� �̸������� ��ȸ�Ͻÿ�
select *
from sungjuk
where aver<=70
order by uname;






