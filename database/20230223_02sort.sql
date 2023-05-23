-- 02_sort
-- 파일명 : 20230223_02sort.sql
-- 저장위치 : D:\java202301\database


-- [sort 정렬]
-- 특정값(keyfield)을 기준으로 순서대로 재배치
-- 키워드 생략하면 기본 오름차순 정렬
-- 오름차순 : Ascending Sort (ASC) 1->10, A->Z, a->z, ㄱ->ㅎ
-- 내림차순 : Descending Sort (DESC)
-- 형식) order by 칼럼명1(1차정렬), 칼럼명2(2차정렬), 칼럼명3(3차정렬), ~~

-- sungjuk 테이블을 조회하시오
select * from sungjuk;

-- 전체 레코드를 이름순으로 정렬해서 조회하시오
select *
from sungjuk
order by uname asc; -- 오름차순 정렬, asc 생략가능

select *
from sungjuk
order by uname desc; -- 내림차순 정렬

-- 1차 정렬: 국어점수 순으로 정렬해서 조회하시오
select * 
from sungjuk
order by korea;

-- 2차 정렬: 국어점수가 같다면 이름을 기준으로 내림차순 정렬하시오
select * 
from sungjuk
order by korea, uname desc;

-- 3차 정렬: 국어점수, 영어점수, 수학점수를 내림차순 정렬하시오
select * 
from sungjuk
order by korea desc, eng desc, mat desc;

-- 평균 70점 이하 행을 이름순으로 조회하시오
select *
from sungjuk
where aver<=70
order by uname;






