-- 01_group
-- 파일명 : 20230227_01group.sql
-- 저장위치 : D:\java202301\database

select * from sungjuk order by addr;

-- [group by]
-- 칼럼에 동일 내용끼리 그룹화 시킴
-- 형식) group by 칼럼1, 칼럼2, 칼럼3


-- 주소가 동일한 값을 그룹화시키고 주소를 조회
select addr
from sungjuk
group by addr; --distinct와 결과값 동일


-- 문1) 주소별 인원수를 조회하시오
select addr, count(*) cnt --as 생략 가능
from sungjuk
group by addr
order by addr;


-- 주소별 내림차순 정렬해서 조회
select addr
from sungjuk
group by addr
order by addr desc;


--주소별 인원수를 내림차순 정렬해서 조회
select addr, count(*) cnt
from sungjuk
group by addr
order by cnt desc;


-- [집계함수]
-- 문2) 주소별 국어점수에 대해서 집계하시오
-- 갯수, 최대값, 최소값, 합계, 평균
-- round(값, i) : 값을 i번째 소수점 아래(i+1번째 소수점) 에서 반올림하고 소수점 i번째까지만 표현
select addr, count(*), max(kor), min(kor), sum(kor), round(avg(kor),0)
from sungjuk
group by addr
order by addr;


-- 국어평균을 소수점 없이 반올림하고 내림차순 정렬해서 조회
-- 칼럼명 부여

select addr
    , count(*) cnt
    , max(kor) max_kor
    , min(kor) min_kor
    , sum(kor) sum_kor
    , round(avg(kor),0) avg_kor
from sungjuk
group by addr
order by round(avg(kor),0) desc;


-- 문3) 총점(tot), 평균(aver) 구하시오
update sungjuk set tot=kor+eng+mat, aver=(kor+eng+mat)/3;
commit;
select * from sungjuk;


-- 문4) 평균(aver)이 80점 이상 행을 대상으로 주소별 인원수를 인원 수 순으로 조회하시오
select addr, count(*)
from sungjuk
where aver>=80
group by addr
order by count(*);

-- [2차 그룹]
-- 주소별(1차)로 그룹을 하고, 주소가 같다면 국어점수(2차)
select addr, kor, count(*)
from sungjuk
group by addr, kor
order by addr, kor;


-- 1차그룹(kor), 2차그룹(eng), 3차그룹(mat)
select kor, eng, mat, count(*)
from sungjuk
group by kor, eng, mat
order by kor, eng, mat;


















