-- 02_having
-- 파일명 : 20230227_02having.sql
-- 저장위치 : D:\java202301\database


-- [having 조건절]
-- group by 와 같이 사용하는 조건절
-- 그룹화를 하고 난 후의 조건절을 추가
-- 형식) having 조건절


-- 주소별 인원수를 조회하시오
select addr, count(*)
from sungjuk
group by addr
order by addr;


-- 주소별 인원수가 3인 행을 조회
select addr, count(*)
from sungjuk
group by addr
having count(*) =3;


-- 주소별 인원수가 3 이상인 행을 조회
select addr, count(*)
from sungjuk
group by addr
having count(*) >= 3;


-- 문1) 주소별 국어평균값이 50이상의 행을 컬럼명 avg_kor로 국어 평균값으로
-- 내림차순 하여 조회하시오
-- (단, 평균값은 소수점 없이 반올림)
select addr, round(avg(kor),0) avg_kor
from sungjuk
group by addr
having avg(kor) >= 50
order by round(avg(kor),0) desc;


-- 문2) 평균(aver)이 70이상인 행을 대상으로 주소별 인원수를 구한 후,
-- 그 인원수가 2명 이하인 행을 인원수 순으로 조회하시오.
-- 인원수 컬럼명은 cnt로 조회하시오
select addr, count(*) as cnt
from sungjuk
where aver >= 70
group by addr
having count(*)<=2
order by cnt;









