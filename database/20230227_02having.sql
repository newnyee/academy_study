-- 02_having
-- ���ϸ� : 20230227_02having.sql
-- ������ġ : D:\java202301\database


-- [having ������]
-- group by �� ���� ����ϴ� ������
-- �׷�ȭ�� �ϰ� �� ���� �������� �߰�
-- ����) having ������


-- �ּҺ� �ο����� ��ȸ�Ͻÿ�
select addr, count(*)
from sungjuk
group by addr
order by addr;


-- �ּҺ� �ο����� 3�� ���� ��ȸ
select addr, count(*)
from sungjuk
group by addr
having count(*) =3;


-- �ּҺ� �ο����� 3 �̻��� ���� ��ȸ
select addr, count(*)
from sungjuk
group by addr
having count(*) >= 3;


-- ��1) �ּҺ� ������հ��� 50�̻��� ���� �÷��� avg_kor�� ���� ��հ�����
-- �������� �Ͽ� ��ȸ�Ͻÿ�
-- (��, ��հ��� �Ҽ��� ���� �ݿø�)
select addr, round(avg(kor),0) avg_kor
from sungjuk
group by addr
having avg(kor) >= 50
order by round(avg(kor),0) desc;


-- ��2) ���(aver)�� 70�̻��� ���� ������� �ּҺ� �ο����� ���� ��,
-- �� �ο����� 2�� ������ ���� �ο��� ������ ��ȸ�Ͻÿ�.
-- �ο��� �÷����� cnt�� ��ȸ�Ͻÿ�
select addr, count(*) as cnt
from sungjuk
where aver >= 70
group by addr
having count(*)<=2
order by cnt;









