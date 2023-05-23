-- 02_자료형   
-- 파일명 : 20230228_02자료형.sql
-- 저장위치 : D:\java202301\database


-- [오라클 DB 자료형]
-- 1. 숫자형(고정소수점 방식)
-- number      전체자릿수(38)까지 표현. 표준SQL문의 int형과 동일하지만, 소수점 표현도 가능함
-- number(3)   전체자릿수(3) -999~999
-- number(6,2) 전체 자릿수(6)이고, 6칸내에서 소수점 자릿수(2)

-- 2. 문자형
-- char        고정형, 최대길이 2000byte
-- varchar2    가변형, 최대길이 4000byte 
-- long        최대 2GB까지

-- 3. 이진파일
-- blob
-- 주의사항 : 파일 자체를 데이터베이스에 저장하지 않음

-- 4. 날짜형
-- date       년월일시분초
-- timestamp  기본날짜형을 확장한 자료형


-- [Maria DB 자료형]
-- 1. 숫자형 : tinyint, smallint, mediumint, int, bigint, float, double, boolean
-- TINYINT(자리수) 
-- SMALLINT(자리수)
-- MEDIUMINT(자리수)
-- INT(자리수)
-- BIGINT(자리수)
-- FLOAT(전체자리수, 소수점이하자리수)
-- DOUBLE(전체자리수, 소수점이하자리수)

-- 2. 문자형 : char, varchar, tinytext, text, mediumtext, longtext
-- CHAR(글자수)    => 255자까지
-- VARCHAR(글자수) => 255자까지
-- TINYTEXT        => 255자까지
-- TEXT            => 65535자까지
-- MEDIUMTEXT      => 16777215자까지
-- LONGTEXT        => 4294967295자까지

-- 3. 날짜형 : date, datetime,timestamp, time, year












