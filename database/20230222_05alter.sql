-- 05_alter
-- ���ϸ� : 20230222_05alter.sql
-- ������ġ : D:\java202301\database


-- [alter ��]
-- ���̺��� ���� ���� �� ����

-- 1. �÷� �߰�
--    ����) alter table table�� add (�÷��� ������Ÿ��);

-- music Į�� �߰�
alter table sungjuk add(music int null);
select * from sungjuk;


-- 2. �÷��� ����(������ ����)
--    ����) alter table table�� rename column �����÷��� to �ٲ��÷���;

-- ����Į�� kor�� koreaĮ�������� �����Ͻÿ�
alter table sungjuk rename column kor to korea; --���������� Į���� ������
select * from sungjuk;


-- 3. �÷� ������ Ÿ�� ����   
--    ����) alter table table�� modify(�÷��� ������Ÿ��);

-- music Į���� �ڷ����� varchar�� �����Ͻÿ�
alter table sungjuk modify(music varchar(5));
select * from sungjuk;
  
  
-- 4. �÷� ����
--    ����)alter table table�� drop(�÷���);

-- music Į���� �����Ͻÿ�
alter table sungjuk drop (music);
select * from sungjuk;

commit;















