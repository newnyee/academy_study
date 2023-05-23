-- 04_테이블조인 
-- 파일명 : 20230302_04테이블조인.sql
-- 저장위치 : D:\java202301\database

-- [테이블 조인]
-- 여러 테이블을 하나의 테이블처럼 사용하는 조인
-- 두개이상의 테이블을 결합하여 데이터를 추출하는 기법
-- 두테이블의 공통값을 이용하여 컬럼을 조합하는 수단
-- 형식)
    select 칼럼명
    from 테이블1 join 테이블2
    on 조건절;                --ANSI(표준) SQL문
    
    select 칼럼명
    from 테이블1, 테이블2
    on 조건절;                --Oracle DB SQL문
    
    select x.칼럼이름A,
           y.칼럼이름B,
           z.칼럼이름C
    from 테이블X x inner join 테이블Y y
         on x.컬럼이름M=y.컬럼이름N
                   inner join 테이블이름Z z
         on y.컬럼이름O=z.컬럼이름Q;
         
-- 조건걸 : where 조건절, having 조건절, on 조건절

-- 물리적 테이블과 논리적 테이블은 서로 동등한 관계이다
-- 물리적 테이블 : 실제 create table한 테이블
-- 논리적 테이블 : SQL문에 의해 가공된 테이블

select * from tb_sugang;
select * from tb_student;
select * from tb_gwamok;


-- 학번을 기준으로 수강테이블과 학생테이블 조인
select tb_sugang.*, tb_student.*
from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno;


-- 두테이블간의 교집합 조인. inner생략가능. 가장 기본
select tb_sugang.*, tb_student.*
from tb_sugang join tb_student
on tb_sugang.hakno = tb_student.hakno;


-- 수강신청한 학생들의 학번, 과목코드, 이름, 이메일을 조회하시오
select tb_sugang.*, tb_student.uname, tb_student.email
from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno;


-- 과목코드를 기준으로 수강테이블과 과목테이블 조인
select tb_sugang.*, tb_gwamok.gname, tb_gwamok.ghakjum
from tb_sugang inner join tb_gwamok
on tb_sugang.gcode = tb_gwamok.gcode;


-- 3개 테이블 조인 : 수강테이블 + 학생테이블(이름) + 과목테이블(과목명)
select tb_sugang.*, tb_student.uname, tb_gwamok.gname
from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno
inner join tb_gwamok
on tb_sugang.gcode = tb_gwamok.gcode;


-- 테이블의 alias(별칭)도 가능 (대소문자 구분없음)
select SU.*, ST.uname, ST.email
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno;

select su.*, gw.gname, gw.ghakjum
from tb_sugang SU join tb_gwamok GW
on su.gcode = gw.gcode;


--모든테이블의 모든 칼럼 조회하기
select *
from tb_sugang su join tb_student st
on su.hakno = st.hakno join tb_gwamok gw
on su.gcode = gw.gcode;


-- 조회시 테이블간에 중복되지 않은 칼럼명은 테이블명을 생략할 수 있다
select su.*, uname, email, gname, ghakjum
from tb_sugang su join tb_student st
on su.hakno = st.hakno join tb_gwamok gw
on su.gcode = gw.gcode;


-- 중복되는 칼럼명은 소속 테이블명을 정확히 명시해야 한다
-- ORA-00918: 열의 정의가 애매합니다
select hakno, gcode, uname, email, gname, ghakjum --에러
from tb_sugang su join tb_student st
on su.hakno = st.hakno join tb_gwamok gw
on su.gcode = gw.gcode;

select su.hakno, su.gcode, uname, email, gname, ghakjum
from tb_sugang su join tb_student st
on su.hakno = st.hakno join tb_gwamok gw
on su.gcode = gw.gcode;

--------------------------------------------------------------------------------
-- [테이블 조인 연습 문제]
-- 문1) 수강신청을 한 학생들 중에서 '제주'에 사는 학생들만 학번, 이름, 주소를 조회하시오
select a.hakno, uname, address
from tb_sugang a join tb_student b
on a.hakno = b.hakno
where address = '제주';

-- 가공된 논리적 테이블의 이름을 aa라고 지정하고, 다시 재가공 할 수 있다
select aa.hakno, aa.gcode, aa.uname, aa.address
from (select su.hakno, su.gcode, uname, address
      from tb_sugang su join tb_student st
      on su.hakno = st.hakno) aa
where aa.address = '제주';

-- aa별칭 생략 가능
select hakno, gcode, uname, address
from (select su.hakno, su.gcode, uname, address
      from tb_sugang su join tb_student st
      on su.hakno = st.hakno) aa
where aa.address = '제주';

-- aa테이블의 모든 칼럼
select *
from (select su.hakno, su.gcode, uname, address
      from tb_sugang su join tb_student st
      on su.hakno = st.hakno) aa
where aa.address = '제주';

문2) 지역별로 수강신청 인원수, 지역을 조회하시오
select address, count(*) as "인원수"
from tb_sugang a join tb_student b
on a.hakno = b.hakno
group by address;

select *
from tb_sugang a right outer join tb_student b
on a.hakno = b.hakno;