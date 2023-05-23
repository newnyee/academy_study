-- 03_페이징
-- 파일명 : 20230303_03페이징.sql
-- 저장위치 : D:\java202301\database


-- [rownum을 활용한 페이징]
-- 줄번호
select hakno, uname, rownum from tb_student;

-- 줄번호에 별칭 부여하기
select hakno, uname, rownum as rnum
from tb_student
order by uname;

-- 줄번호 1~3 사이 조회
select hakno, uname, rownum from tb_student where rownum>=1 and rownum<=3;

-- 줄번호 4~6 사이 조회 (조회안됨)
select uname, hakno, address, rownum from tb_student where rownum>=4 and rownum<=6;


-- [rownum을 활용한 페이징]
-- rownum은 모조칼럼이므로 조건절에 직접 사용하지 말고, 실제칼럼으로 인식후 사용할 것을 추천
-- rownum칼럼은 셀프조인 후에 줄번호 추가하고 조건절에 활용한다

-- 문) 줄번호(rownum)을 이용해서 줄번호 4~6 조회
select *
from (select A.*, rownum as rnum
      from (select uname, hakno, address
            from tb_student
            order by uname) A)
where rnum between 4 and 6;











