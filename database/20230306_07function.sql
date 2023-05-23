-- 07_function
-- 파일명 : 20230306_07function.sql
-- 저장위치 : D:\java202301\database

-- [function 함수]
select * from sungjuk order by sno desc;

-- 연습) sno=61의 국어접수에 5점을 더하고 수정된 국어점수를 반환하는 함수를 생성하시오
create or replace function fn_update(v_sno number)
    return number
is
    v_kor number;
begin
    update sungjuk set kor=kor+5 where sno=v_sno;
    select kor into v_kor from sungjuk where sno=v_sno;
    return v_kor; --인상된 국어점수
end;

-- 위의 fn_update함수는 명령프롬프트에서 테스트하세요
돋보기 검색
-> cmd 명령프롬프트
-> sqlplus system/1234
var korea number;
execute :korea := fn_update(61);
print korea;

테이블제약조건에 국어점수를 100까지 제약을 해놓았기 때문에 실행되지않음. 다른 데이터를 찾아서 선택
var korea number;
execute :korea := fn_update(29);
print korea;


