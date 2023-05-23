-- 01_테이블조인
-- 파일명 : 20230302_01테이블조인.sql
-- 저장위치 : D:\java202301\database


-- [테이블 조인 연습문제]

-- 전체 행 갯수
select * from tb_student;
select * from tb_gwamok;
select * from tb_sugang;

문2) 지역별로 수강신청 인원수, 지역을 조회하시오
select address, count(*) || '명' as cnt
from (select a.hakno, address 
      from (select hakno
            from tb_sugang
            group by hakno) a 
      inner join tb_student b
      on a.hakno = b.hakno)
group by address; --group by 절은 해당 칼럼에 대해 내부적으로 자동 정렬을 함

문3) 과목별 수강 신청 인원수, 과목코드, 과목명를 조회하시오 
     d001  HTML    2명
     d002  포토샵    1명
     d003  일러스트  1명
     p001  JAVA    4명
     p002  Oracle  2명
     p003  JSP     2명
     p004  Python  1명
     
select a.gcode, gname, concat(count(*), '명') as "인원수"
from tb_sugang a inner join tb_gwamok b
on a.gcode = b.gcode
group by gname, a.gcode
order by a.gcode;

     
문4) 학번별 수강신청과목의 총학점을 학번별순으로 조회하시오
     g1001  홍길동  12학점
     g1002  홍길동   8학점
     g1005  진달래  12학점
     g1006  개나리   3학점
     
select hakno, uname, sum(ghakjum) as "총학점"
from (select a.hakno, b.uname, c.ghakjum
      from tb_sugang a inner join tb_student b
      on a.hakno = b.hakno
      inner join tb_gwamok c
      on a.gcode = c.gcode)
group by hakno, uname;


문5) 학번 g1001이 수강신청한 과목을 과목코드별로 조회하시오
     g1001  d001  HTML
     g1001  p001  JAVA
     g1001  p002  Oracle
     g1001  p003  JSP
     g1001  p004  Python

select a.hakno, b.gcode, b.gname
from tb_sugang a 
inner join tb_gwamok b
on a.gcode = b.gcode
where a.hakno = 'g1001' --> 실제 자바코드에서 학번을 변수처리 함
order by gcode;

문6) 수강신청을 한 학생들의 학번, 이름 조회
     g1001  홍길동
     g1002  홍길동
     g1005  진달래
     g1006  개나리

select a.hakno, b.uname
from tb_sugang a inner join tb_student b
on a.hakno = b.hakno
group by a.hakno, b.uname
order by hakno;

select hakno, uname
from tb_student
where hakno in (select hakno from tb_sugang)
order by hakno;


문7)수강신청을 하지 않은 학생들의 학번, 이름 조회
     g1003  개나리
     g1004  홍길동

select a.hakno, a.uname
from tb_student a left join tb_sugang b
on a.hakno = b.hakno
where gcode is null
group by a.hakno, a.uname
order by hakno;

select hakno, uname
from tb_student
where hakno not in (select hakno from tb_sugang)
order by hakno;









