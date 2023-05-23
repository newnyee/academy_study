
I:\java202301\database\20230228_03emp테이블문제.sql
////////////////////////////////////////////////////////////////////////////////

commit;

문1) emp 사원테이블을 생성하시오
create table emp(
  empno       number(4)     primary key --사번(-9999~9999)
  ,ename      varchar2(50)              --이름
  ,job        varchar2(10)              --직급
  ,mgr        number(4)                 --매니저정보
  ,hiredate   date                      --입사일
  ,sal        number(7,2)               --급여(소수점 2자리)
  ,comm       number(7,2)               --커미션(보너스)
  ,deptno     number(2)                 --부서코드(-99~99)
);


문2) emp사원테이블에 행을 추가하시오
insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7369, '개나리', '사원', 7902, '2000-12-17', 200, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7499, '진달래', '주임', 7698, '2001-12-15', 360, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7521, '라일락', '주임', 7698, '2001-02-17', 355, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7654, '손흥민', '과장', 7839, '2002-01-11', 400, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7698, '박지성', '주임', 7698, '2000-07-12', 325, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7782, '김연아', '사원', 7698, '2001-12-17', 225, 10);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7778, '무궁화', '사원', 7839, '2005-11-14', 200, 10);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7839, '홍길동', '부장', 7566, '2006-06-17', 450, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7844, '송강호', '과장', 7566, '2018-09-17', 400, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7876, '정우성', '대표', 7839, '2004-09-09', 500, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7900, '김혜수', '사원', 7902, '2001-12-03', 200, 20);
////////////////////////////////////////////////////////////////////////////////


문3) 전체 행의 갯수를 조회하시오
select count(*) from emp;


문4) 테이블의 칼럼(필드) 목록을 확인하시오
select * from emp;


문5) 사원이름순(오름차순) 정렬하시오
select * from emp order by ename;


문6) 사원이름순(내림차순) 정렬하시오
select * from emp order by ename desc;


문7) 급여 내림차순으로 사원이름(ename), 급여(sal), 부서코드(deptno)를 조회하시오
select ename, sal, deptno from emp order by sal desc;


문8) 부서코드 오름차순, 급여 내림차순으로
     사원이름(ename), 급여(sal), 부서코드(deptno)를 조회하시오
select ename, sal, deptno from emp order by deptno desc;


문9) 이름(ename)/입사일자(hiredate)/부서코드(deptno)를
      부서코드 오름차순, 입사일자(hiredate) 오름차순으로 조회하시오
select ename, hiredate, deptno from emp order by deptno, hiredate;


문10) 직급(job) 칼럼의 중복데이터를 하나씩만 조회하시오
select job from emp group by job;
select distinct(job) from emp;


문11) emp테이블의 job 오름차순, sal 내림차순으로 정렬해서
      ename 이름, job 직급, sal 급여 칼럼명으로 별칭을 바꿔서 조회하시오
select ename as "이름", job as "직급", sal as "급여" 
from emp order by "직급", "급여";


문12) 급여가 100보다 많고 400보다 작은 직원 조회하기(급여 내림차순)
select * from emp where sal>100 and sal<400 order by sal desc;


문13) 급여가 100이하 또는 400 이상의 직원 검색하기(급여 내림차순)
select * from emp where sal<=100 or sal>=400 order by sal desc;


문14) 직급(job)이 과장 또는 부장인 직원들을 이름순으로 조회하시오
select * from emp where job in('과장', '부장') order by ename;


문15) 부서코드(deptno)가 30인 직원을 조회하시오
select * from emp where deptno=30;


문16) 중복된 부서코드를 한개씩만 조회하시오
select deptno from emp group by deptno;


문17) 부서코드가 10 또는 20 또는 30인 직원을 조회하시오
      (or, in연산자 각각 활용해서 조회)
select * from emp where deptno in(10, 20, 30);
select * from emp where deptno = 10 or deptno = 20 or deptno = 30;


문18) 급여가 300~500인 직원을 급여순으로 조회하시오
      (and, between연산자 각각 활용해서 조회)
select * from emp where sal between 300 and 500 order by sal;
select * from emp where sal>=300 and sal<=500 order by sal;


문19) 이름이 무궁화 조회하시오
select * from emp where ename='무궁화';


문20) 김씨성을 조회하시오
select * from emp where ename like ('김%');


문21) 이름에 '화' 포함된 줄을 조회하시오
select * from emp where ename like ('%화%');


문22) 부서코드가 20인 행에 대해서 급여의 1%를 커미션으로 책정하시오
update emp set comm=sal*0.01 where deptno = 20;


문23) 연봉을 아래와 같이 구한후 이름, 부서, 급여, 커미션, 연봉을 조회하시오
      연봉구하는 식 : 급여(sal)*12개월+보너스(comm)
select ename, deptno, sal, comm, sal*12+nvl(comm,0) as "연봉" from emp;


문24) 커미션이 null이면 0으로 바꾼후 연봉을 다시 계산해서
      이름, 급여, 커미션, 연봉을 조회하시오
select ename, sal, nvl(comm,0) as comm, 
       sal*12+nvl(comm,0) as "연봉" 
from emp;


문25) 각 사람의 급여를 검색해서 '누구누구의 급여는 얼마입니다'로 조회하시오
      (|| 결합연산자)
select uname || '의 급여는' || sal || '입니다' from emp;


-- 연산자 우선순위
() 괄호 : 연산자 우선순위보다 우선함
1순위 : 비교연산자, SQL연산자, 산술연산자
2순위 : not
3순위 : and
4순위 : or
5순위 : 결합연산자   

문26) emp테이블에서 입사일(hiredate)이 2005년 1월 1일 이전인 사원에 대해
      사원의 이름(ename), 입사일, 부서번호(deptno)를 입사일순으로 조회하시오
select ename, hiredate, deptno 
from emp 
where to_char(hiredate, 'YYYYMMDD')<20050101 
order by hiredate;


문27) emp테이블에서 부서번호가 20번이나 30번인 부서에 속한
     사원들에 대하여 이름, 직업코드(job), 부서번호를 이름순으로 조회하시오
     (or, in연산자 각각 활용해서 모두 조회)
select ename, job, deptno from emp where deptno in(20, 30) order by ename;
     

문28) 사번, 이름, 부서를 조회하시오
      (단, 부서코드가 10이면 관리부
                      20이면 영업부
                      30이면 교육부로 바꿔서 출력)
select empno, ename,
case deptno when 10 then '관리부' 
            when 20 then '영업부' 
            when 30 then '교육부' 
            end as deptno
from emp;

문29) 다음의 SQL문을 분석하시오
      select empno, sal 
      from emp
      where not(sal>200 and sal<300)
      order by sal;
      
-> emp 테이블에서 급여가 200이하 또는 300이상의 사번과 급여를 급여기준 오름차순하여 조회하시오

문30) 다음의 SQL문을 분석하시오
      select empno, sal 
      from emp
      where not sal>200 and sal<300
      order by sal;

-> emp 테이블에서 급여가 200이하인 사번과 급여를 급여 기준으로 오름차순하여 조회하시오


//////////////////////////////////////////////////////////////////////////////////////////////////////

[emp테이블 관련 연습문제]


문31) 부서코드별 급여합계를 구하시오
select deptno, sum(sal) as "급여합계" 
from emp 
group by deptno;


문32) 부서코드별 급여합계를 구해서  그 합계값이 1500이상만 조회하시오
select * 
from (select deptno, sum(sal) as "급여합계" from emp group by deptno) 
where "급여합계">=1500;

select deptno, sum(sal) as "급여합계"
from emp
group by deptno
having sum(sal)>=1500;


문33) 부서별 급여평균이 300이상 조회하시오
select * 
from (select deptno, avg(sal) as "급여평균" from emp group by deptno) 
where "급여평균" >=300;

select deptno, avg(sal) as "급여평균" 
from emp 
group by deptno
having avg(sal)>=300;


문34) 급여가 300이상 데이터중에서 부서코드별 급여평균을 구해서 급여평균순으로 조회하시오
select deptno, avg(sal) as "급여평균" 
from (select deptno, sal from emp where sal>=300) 
group by deptno
order by "급여평균";

select deptno, avg(sal) as "급여평균" 
from emp
where sal>=300
group by deptno
order by "급여평균";


문35) 급여가 300이상 데이터중에서 부서코드별 급여평균이 400이상을 급여순으로 조회하시오
select * 
from (select deptno, avg(sal) as "급여평균" from (select deptno, sal from emp where sal>=300) group by deptno) 
where "급여평균" >=400
order by "급여평균";

select deptno, avg(sal) as "급여평균" 
from emp
where sal>=300
group by deptno
having avg(sal)>=400
order by "급여평균";


문36) hiredate칼럼을 사용하여 월별로 입사한 인원수를 구하시오
select "입사월", count(*) as "인원수"
from (select to_char(hiredate,'MM') as "입사월" from emp) 
group by "입사월";

select to_char(hiredate,'MM') as "입사월", count(*) as "인원수"
from emp
group by to_char(hiredate,'MM');


문37) 매니저별 담당인원수를 조회하시오
select mgr as "매니저", count(*) as "담당인원수"
from emp 
group by mgr;


문38) 사원번호 7654의 급여보다 적은 행을 조회하시오
select * 
from emp 
where sal<(select sal from emp where empno=7654);


문39) 부서별로 급여+커미션를 구했을때 최대값, 최소값, 평균값을 소수점 둘째 자리에서 반올림하여 부서순으로 조회하시오
select deptno,
       round(max(sal_comm),0) as max,
       round(min(sal_comm),0) as min,
       round(avg(sal_comm),0) as avg
from (select deptno, sal + nvl(comm,0) as sal_comm from emp)
group by deptno
order by deptno;

select deptno,
       round(max(sal + nvl(comm,0)),1) as max,
       round(min(sal + nvl(comm,0)),1) as min,
       round(avg(sal + nvl(comm,0)),1) as avg
from emp
group by deptno
order by deptno;


문40) 각 직원들에 대해서 직원의 이름과 근속연수를 구하시오
select ename,
ceil((sysdate-hiredate)/365) as "근속연수"
from emp;


문41) 아래와 같이 출력 하시오
      예) 박지성의 근속년수 : 20년
select ename || '의 근속연수 : ' || ceil((sysdate-hiredate)/365) || '년' from emp;


문42) 손흥민의 근속년수와 동일한 행을 조회(이름, 근속년수)하시오
select ename, "근속연수"
from (select ename, ceil((sysdate-hiredate)/365) as "근속연수" from emp)
where "근속연수" = (select ceil((sysdate-hiredate)/365) 
                    from emp 
                    where ename = '손흥민');


문43) 입사한지 만20년 이상된 사람에 한해 현재연봉에서 10% 인상시켰을 때 
      사번, 이름, 입사일, 현재연봉, 인상후연봉, 인상된금액으로 고액연봉순으로 조회하시오
      연봉구하는 식 : 급여(sal)*12개월+보너스(comm)
select empno, ename, hiredate,
       (sal*12+nvl(comm,0)) as "현재연봉" ,
       round((sal*12+nvl(comm,0))*1.1,0) as "인상후연봉",
       (sal*12+nvl(comm,0))*0.1 as "인상된금액"
from emp
where trunc((sysdate-hiredate)/365) >=20
order by "인상후연봉" desc;


문44) 입사년도가 짝수인 직원들의 급여의 평균을 job별로 출력하시오
select job, avg(sal) as "급여평균" 
from (select hiredate, job, sal from emp where mod(extract(year from hiredate),2)=0) 
group by job;

select job, avg(sal) as "급여평균"
from emp
where mod(extract(year from hiredate),2)=0
group by job;





