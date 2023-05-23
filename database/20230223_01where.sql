-- 01_where
-- 파일명 : 20230223_01where.sql
-- 저장위치 : D:\java202301\database


-- [between A and B] 연산자
-- A 와 B 사이 (AND)

-- 국어점수가 80 ~ 89점 사이 행을 조회하시오
select * 
from sungjuk
where korea between 80 and 89;


-- [in] 연산자
-- 목록에서 찾기 (OR)

-- 이름이 '무궁화', '봉선화'를 조회하시오
select *
from sungjuk
where uname in ('무궁화', '봉선화');

-- 국어점수 10, 30, 50점을 조회하시오
select *
from sungjuk
where korea in (10, 30, 50);


-- [like] 연산자
-- 문자열 데이터에서 비슷한 유형을 검색할 때
-- % : 글자갯수와 상관이 없음
-- _ : 글자갯수까지 일치해야 함

-- 이름에서 '홍'으로 시작하는 이름을 조회하시오
select *
from sungjuk
where uname like '홍%';

-- 이름에서 '화'로 끝나는 이름을 조회하시오
select *
from sungjuk
where uname like '%화';

-- 이름에 '나' 글자가 있는 이름을 조회하시오
select *
from sungjuk
where uname like '%나%';

-- 세글자 이름에서 '동'으로 끝나는 이름을 조회하시오
select *
from sungjuk
where uname like '__동';

-- 이름 세글자 중에서 가운데 글자가 '나'가 있는 행의 갯수를 조회하시오
select count(uname)
from sungjuk
where uname like '_나_';

-- 공지 사항의 제목+내용을 선택하고 검색어가 '파스타' 일때
select *
from '공지사항'
where '제목' like '%파스타%' or '내용' like '%파스타%';

-- 국어 점수가 50점 이상인 행에 대해서 총점과 평균값을 넣으시오
update sungjuk
set tot=korea+eng+mat, aver=(korea+eng+mat)/3
where korea>=50;

select * from sungjuk;

-- [null]
-- 비어있는 값

-- 총점의 갯수를 구하시오
select count(tot) from sungjuk; --null값은 카운트 되지 않음 5

-- 총점에 null이 있는 행의 갯수를 구하시오
select count(*) from sungjuk where tot=null; --null값 확인 못함 0
select count(*) from sungjuk where tot is null; --null값 확인 해야 하는 경우 is 키워드 사용

-- 평균에 비어있지 않은 행의 갯수를 구하시오 (null이 아닌 값)
select count(*) from sungjuk where aver is not null;

-- 비어있는 총점과 평균의 값을 모두 구해서 업데이트 하시오
update sungjuk
set tot=korea+eng+mat, aver=(korea+eng+mat)/3
where aver is null or tot is null;

select * from sungjuk;
commit;






