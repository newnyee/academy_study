--01_SQL����
--���ϸ� : 20230222_01SQL����.spl
--������ġ : D:\java202301\database
--NCS �н� ��� 3-3 ������ �����ͺ��̽� ���̺� ���� (p95)

--�����ų ���� �巡�� + ctrl + Enter -> �����Ű��
--null �� 'null' �����ϱ�

--���̺� ����
create table sungjuck (
  uname varchar(20)
, kor int
, eng int
, mat int
, aver int
);


--���̺� ����
drop table sungjuck;


--[CRUD �۾�]

--1. ���߰�
insert into sungjuck (uname, kor, eng, mat)
values('����ȭ', 80, 85, 100);

insert into sungjuck (uname, kor, eng, mat)
values('ȫ�浿', 90, 100, 50);


--2. ��ȸ �� �˻�
select * from sungjuck;

--3. �� ����
UPDATE sungjuck
SET aver=(kor+eng+mat)/3;

--4. �� ����
--table&column�� ������ �״�� ����
delete from sungjuck;
