-- 04_where
-- ���ϸ� : 20230222_04where.spl
-- ������ġ : D:\java202301\database


-- [where ������]
-- ������ �����ϴ� ��鿡 ���ؼ�
-- ���ǿ� �����ϴ� ���ڵ常 ������� ��ȸ(select), ����(update), ����(delete)�ϱ� ���ؼ�


select * from sungjuk;

--��1) ���������� 50���̻� ���� ��ȸ�Ͻÿ�
select * from sungjuk where kor>=50;
  
  
--��2) ���� ������ 50���̸� ���� ��ȸ�Ͻÿ�
select * from sungjuk where eng<50;
  
  
--��3) �̸��� '���ѹα�' ���� ��ȸ(���)�Ͻÿ�
select * from sungjuk where uname='���ѹα�';
  
  
--��4) �̸��� '���ѹα�' �ƴ� ���� ��ȸ�Ͻÿ�
select * from sungjuk where not uname='���ѹα�';
select * from sungjuk where uname!='���ѹα�';
select * from sungjuk where uname<>'���ѹα�'; --�¿찡 ���� ���� �ʴ�


--��5) ����, ����, ���� �������� ������ ��� 90�̻� ���� ��ȸ�Ͻÿ�
select * from sungjuk where kor>=90 and eng>=90 and mat>=90;


--��6) ����, ����, ���� �߿��� �Ѱ����̶� 40�̸� ���� ��ȸ�Ͻÿ�
select * from sungjuk where kor<40 or eng<40 or mat<40;


--��7) ���������� 80 ~ 89�� ���� ���� ��ȸ�Ͻÿ�
select * from sungjuk where kor>=80 and kor<=89;


--��8) �̸��� '����ȭ', '����ȭ'�� ���� ��ȸ�Ͻÿ�
select * from sungjuk where uname='����ȭ' or uname='����ȭ';


-- ��9) ��, ��, �� ��� 100�� �ƴ� ���� ��ȸ�Ͻÿ�
select * from sungjuk where kor!=100 or eng!=100 or mat!=100;
select * from sungjuk where not (kor=100 and eng=100 and mat=100);








