-- 05_과제
-- 파일명 : 20230303_05과제.sql
-- 저장위치 : D:\java202301\database

select * from tb_student;
select * from tb_gwamok;
select * from tb_sugang;

-- 문1) 디자인 교과목중에서 학점이 제일 많은 교과목을 수강신청한 명단을 조회하시오
--  (학번, 이름, 과목코드)
select a.hakno, b.uname, c.gcode --3.학번, 이름, 과목코드 조회
from tb_sugang a join tb_student b --1.3개 테이블 조인
on a.hakno = b.hakno
join tb_gwamok c
on a.gcode = c.gcode
where ghakjum in (select max(ghakjum) 
                  from tb_gwamok
                  where gcode like ('d%')) --2.디자인 과목중 학점이 높은 교과목 찾기
and a.gcode like ('d%')
order by ghakjum desc; --4.학점순으로 정렬하기


-- 문2) 학번별 수강신청한 총학점을 구하고 학번순으로 정렬해서 줄번호 4~6행 조회하시오
--  (단, 수강신청하지 않은 학생의 총학점도 0으로 표시)
select hakno, uname, "총학점" --9.학번, 이름, "총학점"조회
from (select D.*, rownum as rnum --6.D테이블 전체칼럼, rownum 붙이기
      from(select a.hakno, sum(nvl(ghakjum,0)) as "총학점", a.uname --3.학번, 이름, "총학점" 조회
          from tb_student a left join tb_sugang b --1.테이블 3개 조인
          on a.hakno = b.hakno
          left join tb_gwamok c
          on b.gcode = c.gcode         
          group by a.hakno, a.uname --2.학점, 이름으로 그룹화
          order by hakno) D) --4.학번순으로 정렬하기 --5.from D테이블 --7.from rownum고정테이블
where rnum BETWEEN 4 and 6; --8.rownum의 4~6열 가져오기


-- 문3) 학번별로 수강신청 총학점을 구하고, 총학점순으로 내림차순 정렬후
--   위에서 부터 1건만 조회하시오 (학번, 이름, 총학점)
select hakno, uname, "총학점" --9.학번, 이름, "총학점"조회
from (select D.*, rownum as rnum --6.D테이블 전체칼럼, rownum 붙이기
      from(select a.hakno, sum(nvl(ghakjum,0)) as "총학점", a.uname --3.학번, 이름, "총학점" 조회
          from tb_student a left join tb_sugang b --1.테이블 3개 조인
          on a.hakno = b.hakno
          left join tb_gwamok c
          on b.gcode = c.gcode
          group by a.hakno, a.uname --2.학점, 이름으로 그룹화
          order by "총학점" desc) D) --4.총학점 내림차순 정렬하기 --5.from D테이블 --7.from rownum고정테이블
where rnum = 1; --8.rownum의 첫번째열 가져오기
















