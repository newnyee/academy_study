-- 07_function
-- ���ϸ� : 20230306_07function.sql
-- ������ġ : D:\java202301\database

-- [function �Լ�]
select * from sungjuk order by sno desc;

-- ����) sno=61�� ���������� 5���� ���ϰ� ������ ���������� ��ȯ�ϴ� �Լ��� �����Ͻÿ�
create or replace function fn_update(v_sno number)
    return number
is
    v_kor number;
begin
    update sungjuk set kor=kor+5 where sno=v_sno;
    select kor into v_kor from sungjuk where sno=v_sno;
    return v_kor; --�λ�� ��������
end;

-- ���� fn_update�Լ��� ���������Ʈ���� �׽�Ʈ�ϼ���
������ �˻�
-> cmd ���������Ʈ
-> sqlplus system/1234
var korea number;
execute :korea := fn_update(61);
print korea;

���̺��������ǿ� ���������� 100���� ������ �س��ұ� ������ �����������. �ٸ� �����͸� ã�Ƽ� ����
var korea number;
execute :korea := fn_update(29);
print korea;


