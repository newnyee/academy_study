-- 01_where
-- ���ϸ� : 20230223_01where.sql
-- ������ġ : D:\java202301\database


-- [between A and B] ������
-- A �� B ���� (AND)

-- ���������� 80 ~ 89�� ���� ���� ��ȸ�Ͻÿ�
select * 
from sungjuk
where korea between 80 and 89;


-- [in] ������
-- ��Ͽ��� ã�� (OR)

-- �̸��� '����ȭ', '����ȭ'�� ��ȸ�Ͻÿ�
select *
from sungjuk
where uname in ('����ȭ', '����ȭ');

-- �������� 10, 30, 50���� ��ȸ�Ͻÿ�
select *
from sungjuk
where korea in (10, 30, 50);


-- [like] ������
-- ���ڿ� �����Ϳ��� ����� ������ �˻��� ��
-- % : ���ڰ����� ����� ����
-- _ : ���ڰ������� ��ġ�ؾ� ��

-- �̸����� 'ȫ'���� �����ϴ� �̸��� ��ȸ�Ͻÿ�
select *
from sungjuk
where uname like 'ȫ%';

-- �̸����� 'ȭ'�� ������ �̸��� ��ȸ�Ͻÿ�
select *
from sungjuk
where uname like '%ȭ';

-- �̸��� '��' ���ڰ� �ִ� �̸��� ��ȸ�Ͻÿ�
select *
from sungjuk
where uname like '%��%';

-- ������ �̸����� '��'���� ������ �̸��� ��ȸ�Ͻÿ�
select *
from sungjuk
where uname like '__��';

-- �̸� ������ �߿��� ��� ���ڰ� '��'�� �ִ� ���� ������ ��ȸ�Ͻÿ�
select count(uname)
from sungjuk
where uname like '_��_';

-- ���� ������ ����+������ �����ϰ� �˻�� '�Ľ�Ÿ' �϶�
select *
from '��������'
where '����' like '%�Ľ�Ÿ%' or '����' like '%�Ľ�Ÿ%';

-- ���� ������ 50�� �̻��� �࿡ ���ؼ� ������ ��հ��� �����ÿ�
update sungjuk
set tot=korea+eng+mat, aver=(korea+eng+mat)/3
where korea>=50;

select * from sungjuk;

-- [null]
-- ����ִ� ��

-- ������ ������ ���Ͻÿ�
select count(tot) from sungjuk; --null���� ī��Ʈ ���� ���� 5

-- ������ null�� �ִ� ���� ������ ���Ͻÿ�
select count(*) from sungjuk where tot=null; --null�� Ȯ�� ���� 0
select count(*) from sungjuk where tot is null; --null�� Ȯ�� �ؾ� �ϴ� ��� is Ű���� ���

-- ��տ� ������� ���� ���� ������ ���Ͻÿ� (null�� �ƴ� ��)
select count(*) from sungjuk where aver is not null;

-- ����ִ� ������ ����� ���� ��� ���ؼ� ������Ʈ �Ͻÿ�
update sungjuk
set tot=korea+eng+mat, aver=(korea+eng+mat)/3
where aver is null or tot is null;

select * from sungjuk;
commit;






