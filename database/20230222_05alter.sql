-- 05_alter
-- 파일명 : 20230222_05alter.sql
-- 저장위치 : D:\java202301\database


-- [alter 문]
-- 테이블의 구조 수정 및 변경

-- 1. 컬럼 추가
--    형식) alter table table명 add (컬럼명 데이터타입);

-- music 칼럼 추가
alter table sungjuk add(music int null);
select * from sungjuk;


-- 2. 컬럼명 수정(물리적 수정)
--    형식) alter table table명 rename column 원래컬럼명 to 바꿀컬럼명;

-- 국어칼럼 kor을 korea칼럼명으로 수정하시오
alter table sungjuk rename column kor to korea; --물리적으로 칼럼명 수정됨
select * from sungjuk;


-- 3. 컬럼 데이터 타입 수정   
--    형식) alter table table명 modify(컬럼명 데이터타입);

-- music 칼럼의 자료형을 varchar로 수정하시오
alter table sungjuk modify(music varchar(5));
select * from sungjuk;
  
  
-- 4. 컬럼 삭제
--    형식)alter table table명 drop(컬럼명);

-- music 칼럼을 삭제하시오
alter table sungjuk drop (music);
select * from sungjuk;

commit;















