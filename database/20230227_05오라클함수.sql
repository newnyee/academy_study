-- 05_����Ŭ�Լ�
-- ���ϸ� : 20230227_05����Ŭ�Լ�.sql
-- ������ġ : D:\java202301\database


-- [����Ŭ �Լ�]
-- �������̺� : dual
-- 1. ���ڿ� ���� �Լ�
select lower('Hello World') from dual; --���� �ҹ��ڷ� ��ȯ
select upper('Hello World') from dual; --���� �빮�ڷ� ��ȯ
select length('Hello World') from dual; --���� ����(��������)
select substr('Hello World', 1, 5) from dual; --���ڿ����� ������ �ε��� ��ȣ���� ������ ���ڸ�ŭ ���ڿ��� ��� (SQL������ ù��° �ε��� ��ȣ�� 1�� ���۵�)

select instr('Hello World','W') from dual; --Ư�� ���� ��ġ�� �ε��� ��ȣ�� ��ȯ��
select lpad('SKY', 5, '*') from dual; --���ڿ� ���� �Է��� ���ڸ�ŭ�� ���ڸ� ����ϴµ�, �Է��� ���ں��� ���ڿ��� ���� ������ �۴ٸ�, ���ڱ��� ������ ���°����� Ư�� ���ڷ� ä��� �Լ�
select rpad('SKY', 5, '*') from dual; --���ڿ� ���� �Է��� ���ڸ�ŭ�� ���ڸ� ����ϴµ�, �Է��� ���ں��� ���ڿ��� ���� ������ �۴ٸ�, ���ڱ��� ������ ���°����� Ư�� ���ڷ� ä��� �Լ�
select replace('HAPPY','P', 'K') from dual; --���ڿ����� ���ڿ� ���� Ư�� ���ڸ� ��� ã�Ƽ� ���� ���ο� Ư�� ���ڷ� �ٲ��ִ� �Լ�

select chr(65) from dual; --�ƽ�Ű�ڵ� ���� ��ȯ 'A'
select chr(66) from dual; --�ƽ�Ű�ڵ� ���� ��ȯ 'B'
select chr(97) from dual; --�ƽ�Ű�ڵ� ���� ��ȯ 'a'
select chr(98) from dual; --�ƽ�Ű�ڵ� ���� ��ȯ 'b'

-- ���ڿ� �����ϱ�
--concat('���ڿ�', '���ڿ�')
select concat('�ι̿�', '�ٸ���') from dual;

--concat(Į����, '���ڿ�')
select concat(uname, '�� �����'), concat(aver, '�Դϴ�') from sungjuk;
select concat(uname, '�� �����') as �̸�, concat(aver, '�Դϴ�') as ��� from sungjuk;

-- || ���տ�����
select uname || '�� �����' || aver || '�Դϴ�' from sungjuk;
select uname || '�� �����' || aver || '�Դϴ�' as str from sungjuk;


-- 2. ���� ���� �Լ�
select abs(-7) from dual; --���밪
select mod(5,3) from dual; --������ �Լ�(%)
select ceil(12.46789898) from dual; --�ø��Լ�
select trunc(13.53, 1) from dual; --�����Լ�
select round(12.978787) from dual; --�ݿø��Լ�

--to_number('���������� ���ڿ�') -> ���ڿ��� ���������� ��ȯ
select to_number('123')+1 from dual; --124 ���
select '123'+1 from dual; --���������� to_number()�� ȣ���, 124 ��µ�


-- 3. ��¥ ���� �Լ�
select sysdate from dual; --�ý����� ���� ��¥�� �ð� ������ �����ϴ� �Լ�, ��ȣ ����

-- sysdate���� ����� �����ϱ�
select extract(year from sysdate) from dual; --��
select extract(month from sysdate) from dual; --��
select extract(day from sysdate) from dual; --��

-- ��¥�������� ����
select sysdate+100 from dual; --���ó�¥ +100��
select sysdate-100 from dual; --���ó�¥ -100��

-- �ΰ��� ��¥ �����Ϳ��� ���� �� ���
select months_between('2023-02-27', '2022-10-30') from dual; --(3.9)
select months_between('2023-02-27', '2023-05-30') from dual; --(-3.9)

-- ���ڿ��� ��¥������ ��ȯ
select to_date('2023-02-27') from dual;
select to_date('2023-02-27') - to_date('2023-05-30') from dual;


-- [nvl() �Լ�] - null���� �ٸ������� �ٲ�
-- ����) �ּҰ� 'Incheon'�� ���� �������� �ִ밪, �ο����� ��ȸ�Ͻÿ�
select count(*)+1 --���갡��
from sungjuk
where addr='Incheon';

select max(kor)+1 --null���� ����Ұ�
from sungjuk
where addr='Incheon';

select nvl(max(kor), 0)+1 as max_kor --max(kor)���� null�̶�� 0���� ��ü��
from sungjuk
where addr='Incheon';


select * from sungjuk order by sno;
 

-- ����) sungjuk���̺� �Ʒ� �����͸� ���߰� �Ͻÿ�
-- sno   : max(sno)+1 (��, max()���� null�̸� 0���� �ٲ��� ����Ѵ�)
-- uname : �����
-- kor   : 100
-- eng   : 100
-- mat   : 100
-- addr  : Seoul
-- wdate : sysdate

-- 1) snoĮ������ ���� ū �� ��������
select max(sno) from sungjuk;

-- 2) ���� 1)����� null�� ������ 0���� �ٲٱ�
select nvl(max(sno),0) from sungjuk;

-- 3) 2)����� +1 �����ϱ�
select nvl(max(sno),0)+1 from sungjuk;

-- 4) ���߰�
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values((select nvl(max(sno), 0)+1 from sungjuk), '�����', 100, 100, 100, 'Seoul', sysdate);

select * from sungjuk;










