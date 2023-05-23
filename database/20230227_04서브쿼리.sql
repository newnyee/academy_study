-- 04_서브쿼리
-- 파일명 : 20230227_04서브쿼리.sql
-- 저장위치 : D:\java202301\database


-- [서브쿼리]
-- SQL문 속 또 다른 SQL문
-- 테이블 내에서 다시 한 번 쿼리문에 의해 행 조회 및 검색


-- 국어점수의 평균보다 높은 점수를 받은 학생의 이름을 조회하시오
select uname, kor
from sungjuk
where kor >= (select round(avg(kor),0) from sungjuk);


-- 문2) 서울지역 학생들의 평균 국어점수 이상의 국어점수를 받은 학생의 지역, 이름, 국어점수를 조회하시오
select addr, uname, kor
from sungjuk
where kor>=(select avg(kor) from sungjuk where addr='Seoul');


-- 문3) 서울지역 학생들의 평균 국어점수 이상의 국어점수를 받은 서울 이외의 지역 학생의 지역, 이름, 국어점수를 조회하시오
select addr, uname, kor
from sungjuk
where kor>=(select avg(kor) from sungjuk where addr='Seoul') and addr!='Seoul';


-- 문4) 국어의 최소점수 이하의 영어점수 또는 수학점수를 받은 학생이 있는지 이름, 영어점수, 수학점수를 조회하시오
select uname, eng, mat
from sungjuk
where eng<=(select min(kor) from sungjuk) or mat<=(select min(kor) from sungjuk);















