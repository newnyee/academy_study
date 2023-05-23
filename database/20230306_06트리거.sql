-- 06_Ʈ����
-- ���ϸ� : 20230306_06Ʈ����.sql
-- ������ġ : D:\java202301\database

-- [Ʈ���� Trigger]

-- �ܼ�â ���(dbms_output.put_line)�� �����
set serveroutput on;

-- ����)
-- sungjuk���̺��� ���������� ����� ���Ͻÿ�
select avg(kor) from sungjuk;

-- ���������� �߰�, ����, ������ �Ǹ� ��ü ������յ� �޶�����, �ٲ� ������� ���� ����Ѵ�.
create or replace trigger kor_trigger
after
    insert or update or delete on sungjuk
declare
    avg_kor number;
begin
    select avg(kor) into avg_kor from sungjuk;
    dbms_output.put_line('�������: ' || avg_kor);
end;

select * from sungjuk order by sno desc;

-- �����
update sungjuk set kor=0 where sno=31;

-- �����
delete from sungjuk where sno=31;

-- ���߰�
insert into sungjuk (sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval, '�̼���',100,100,100, 'Seoul', sysdate);






