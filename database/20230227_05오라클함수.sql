-- 05_오라클함수
-- 파일명 : 20230227_05오라클함수.sql
-- 저장위치 : D:\java202301\database


-- [오라클 함수]
-- 가상테이블 : dual
-- 1. 문자열 관련 함수
select lower('Hello World') from dual; --전부 소문자로 전환
select upper('Hello World') from dual; --전부 대문자로 전환
select length('Hello World') from dual; --글자 갯수(공백포함)
select substr('Hello World', 1, 5) from dual; --문자열에서 지정한 인덱스 번호부터 지정한 숫자만큼 문자열을 출력 (SQL에서는 첫번째 인덱스 번호가 1로 시작됨)

select instr('Hello World','W') from dual; --특정 문자 위치의 인덱스 번호를 반환함
select lpad('SKY', 5, '*') from dual; --문자열 포함 입력한 숫자만큼의 글자를 출력하는데, 입력한 숫자보다 문자열의 문자 갯수가 작다면, 글자기준 오른쪽 남는공간을 특정 문자로 채우는 함수
select rpad('SKY', 5, '*') from dual; --문자열 포함 입력한 숫자만큼의 글자를 출력하는데, 입력한 숫자보다 문자열의 문자 갯수가 작다면, 글자기준 오른쪽 남는공간을 특정 문자로 채우는 함수
select replace('HAPPY','P', 'K') from dual; --문자열에서 문자열 안의 특정 문자를 모두 찾아서 전부 새로운 특정 문자로 바꿔주는 함수

select chr(65) from dual; --아스키코드 문자 변환 'A'
select chr(66) from dual; --아스키코드 문자 변환 'B'
select chr(97) from dual; --아스키코드 문자 변환 'a'
select chr(98) from dual; --아스키코드 문자 변환 'b'

-- 문자열 연결하기
--concat('문자열', '문자열')
select concat('로미오', '줄리엣') from dual;

--concat(칼럼명, '문자열')
select concat(uname, '의 평균은'), concat(aver, '입니다') from sungjuk;
select concat(uname, '의 평균은') as 이름, concat(aver, '입니다') as 평균 from sungjuk;

-- || 결합연산자
select uname || '의 평균은' || aver || '입니다' from sungjuk;
select uname || '의 평균은' || aver || '입니다' as str from sungjuk;


-- 2. 숫자 관련 함수
select abs(-7) from dual; --절대값
select mod(5,3) from dual; --나머지 함수(%)
select ceil(12.46789898) from dual; --올림함수
select trunc(13.53, 1) from dual; --내림함수
select round(12.978787) from dual; --반올림함수

--to_number('숫자형태의 문자열') -> 문자열을 숫자형으로 변환
select to_number('123')+1 from dual; --124 출력
select '123'+1 from dual; --내부적으로 to_number()가 호출됨, 124 출력됨


-- 3. 날짜 관련 함수
select sysdate from dual; --시스템의 현재 날짜와 시간 정보를 리턴하는 함수, 괄호 없음

-- sysdate에서 년월일 추출하기
select extract(year from sysdate) from dual; --년
select extract(month from sysdate) from dual; --월
select extract(day from sysdate) from dual; --일

-- 날짜데이터의 연산
select sysdate+100 from dual; --오늘날짜 +100일
select sysdate-100 from dual; --오늘날짜 -100일

-- 두개의 날짜 데이터에서 개월 수 계산
select months_between('2023-02-27', '2022-10-30') from dual; --(3.9)
select months_between('2023-02-27', '2023-05-30') from dual; --(-3.9)

-- 문자열을 날짜형으로 변환
select to_date('2023-02-27') from dual;
select to_date('2023-02-27') - to_date('2023-05-30') from dual;


-- [nvl() 함수] - null값을 다른값으로 바꿈
-- 문제) 주소가 'Incheon'인 행의 국어점수 최대값, 인원수를 조회하시오
select count(*)+1 --연산가능
from sungjuk
where addr='Incheon';

select max(kor)+1 --null값은 연산불가
from sungjuk
where addr='Incheon';

select nvl(max(kor), 0)+1 as max_kor --max(kor)값이 null이라면 0으로 대체함
from sungjuk
where addr='Incheon';


select * from sungjuk order by sno;
 

-- 문제) sungjuk테이블에 아래 데이터를 행추가 하시오
-- sno   : max(sno)+1 (단, max()값이 null이면 0으로 바꾼후 계산한다)
-- uname : 손흥민
-- kor   : 100
-- eng   : 100
-- mat   : 100
-- addr  : Seoul
-- wdate : sysdate

-- 1) sno칼럼에서 가장 큰 값 가져오기
select max(sno) from sungjuk;

-- 2) 만일 1)결과가 null이 나오면 0으로 바꾸기
select nvl(max(sno),0) from sungjuk;

-- 3) 2)결과에 +1 연산하기
select nvl(max(sno),0)+1 from sungjuk;

-- 4) 행추가
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values((select nvl(max(sno), 0)+1 from sungjuk), '손흥민', 100, 100, 100, 'Seoul', sysdate);

select * from sungjuk;










