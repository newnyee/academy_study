-- 01_group
-- ���ϸ� : 20230227_01group.sql
-- ������ġ : D:\java202301\database

select * from sungjuk order by addr;

-- [group by]
-- Į���� ���� ���볢�� �׷�ȭ ��Ŵ
-- ����) group by Į��1, Į��2, Į��3


-- �ּҰ� ������ ���� �׷�ȭ��Ű�� �ּҸ� ��ȸ
select addr
from sungjuk
group by addr; --distinct�� ����� ����


-- ��1) �ּҺ� �ο����� ��ȸ�Ͻÿ�
select addr, count(*) cnt --as ���� ����
from sungjuk
group by addr
order by addr;


-- �ּҺ� �������� �����ؼ� ��ȸ
select addr
from sungjuk
group by addr
order by addr desc;


--�ּҺ� �ο����� �������� �����ؼ� ��ȸ
select addr, count(*) cnt
from sungjuk
group by addr
order by cnt desc;


-- [�����Լ�]
-- ��2) �ּҺ� ���������� ���ؼ� �����Ͻÿ�
-- ����, �ִ밪, �ּҰ�, �հ�, ���
-- round(��, i) : ���� i��° �Ҽ��� �Ʒ�(i+1��° �Ҽ���) ���� �ݿø��ϰ� �Ҽ��� i��°������ ǥ��
select addr, count(*), max(kor), min(kor), sum(kor), round(avg(kor),0)
from sungjuk
group by addr
order by addr;


-- ��������� �Ҽ��� ���� �ݿø��ϰ� �������� �����ؼ� ��ȸ
-- Į���� �ο�

select addr
    , count(*) cnt
    , max(kor) max_kor
    , min(kor) min_kor
    , sum(kor) sum_kor
    , round(avg(kor),0) avg_kor
from sungjuk
group by addr
order by round(avg(kor),0) desc;


-- ��3) ����(tot), ���(aver) ���Ͻÿ�
update sungjuk set tot=kor+eng+mat, aver=(kor+eng+mat)/3;
commit;
select * from sungjuk;


-- ��4) ���(aver)�� 80�� �̻� ���� ������� �ּҺ� �ο����� �ο� �� ������ ��ȸ�Ͻÿ�
select addr, count(*)
from sungjuk
where aver>=80
group by addr
order by count(*);

-- [2�� �׷�]
-- �ּҺ�(1��)�� �׷��� �ϰ�, �ּҰ� ���ٸ� ��������(2��)
select addr, kor, count(*)
from sungjuk
group by addr, kor
order by addr, kor;


-- 1���׷�(kor), 2���׷�(eng), 3���׷�(mat)
select kor, eng, mat, count(*)
from sungjuk
group by kor, eng, mat
order by kor, eng, mat;


















