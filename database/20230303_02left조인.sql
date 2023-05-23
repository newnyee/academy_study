-- 02_left조인
-- 파일명 : 20230302_02left조인.sql
-- 저장위치 : D:\java202301\database


-- [left join 과 right join]
-- 학생테이블의 모든 행을 가져오고, 수강테이블에서 학번이 일치하는 행만 가져오기
select a.*, b.*
from tb_student a left join tb_sugang b
on a.hakno = b.hakno;

-- 문1) left join을 이용하여 수강신청을 하지 않은 학번, 이름을 조회하시오
select a.hakno, uname
from tb_student a left join tb_sugang b
on a.hakno = b.hakno
where gcode is null
group by a.hakno, a.uname
order by hakno;

-- 문2) right join을 이용하여 수강신청을 하지 않은 학번, 이름을 조회하시오
select b.hakno, uname
from tb_sugang a right join tb_student b
on a.hakno = b.hakno
where gcode is null
group by b.hakno, b.uname
order by hakno;


-- [(+)기호를 이용한 테이블 조인]
-- (+)기호는 일치되지 않는 행이 존재하지 않은 쪽에 붙인다

select a.hakno, a.uname, b.gcode, b.hakno
from tb_student a, tb_sugang b
where a.hakno = b.hakno (+); -- left join

select b.hakno, b.uname, a.gcode, a.hakno
from tb_sugang a, tb_student b
where a.hakno = b.hakno (+); -- right join





