--01_SQL기초
--파일명 : 20230222_01SQL기초.spl
--저장위치 : D:\java202301\database
--NCS 학습 모듈 3-3 관계형 데이터베이스 테이블 조작 (p95)

--실행시킬 영역 드래그 + ctrl + Enter -> 실행시키기
--null 과 'null' 구분하기

--테이블 생성
create table sungjuck (
  uname varchar(20)
, kor int
, eng int
, mat int
, aver int
);


--테이블 삭제
drop table sungjuck;


--[CRUD 작업]

--1. 행추가
insert into sungjuck (uname, kor, eng, mat)
values('무궁화', 80, 85, 100);

insert into sungjuck (uname, kor, eng, mat)
values('홍길동', 90, 100, 50);


--2. 조회 및 검색
select * from sungjuck;

--3. 행 수정
UPDATE sungjuck
SET aver=(kor+eng+mat)/3;

--4. 행 삭제
--table&column의 구조는 그대로 있음
delete from sungjuck;
