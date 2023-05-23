-- 02_SQL기초
-- 파일명 : 20230222_02SQL기초.spl
-- 저장위치 : D:\java202301\database


-- [sungjuk 테이블 삭제]
drop table sungjuk;


-- [sungjuk 테이블 생성]
create table sungjuk (
   uname varchar(50) not null --50byte 이내의 문자형, 빈값을 허용하지 않음
 , kor   int         not null --정수형, 빈값을 허용하지 않음
 , eng   int         not null --정수형, 빈값을 허용하지 않음
 , mat   int         not null --정수형, 빈값을 허용하지 않음
 , tot   int         null     --빈값 허용
 , aver  int                  --아무것도 주지 않으면 자동으로 null, 생략가능하나 웬만하면 써주는것이 좋음
);


-- [샘플 데이터 행 추가]
-- insert한 순서대로 안들어가기 때문에 정렬을 해서 봐야함
insert into sungjuk(uname,kor,eng,mat) values ('홍길동',  70, 85, 100);
insert into sungjuk(uname,kor,eng,mat) values ('무궁화',  30, 30, 40);
insert into sungjuk(uname,kor,eng,mat) values ('진달래',  90, 90, 20);
insert into sungjuk(uname,kor,eng,mat) values ('개나리',  100,60, 30);
insert into sungjuk(uname,kor,eng,mat) values ('라일락',  30, 80, 40);
insert into sungjuk(uname,kor,eng,mat) values ('봉선화',  80, 80, 20);
insert into sungjuk(uname,kor,eng,mat) values ('대한민국',10, 65, 35);
insert into sungjuk(uname,kor,eng,mat) values ('해바라기',30, 80, 40);
insert into sungjuk(uname,kor,eng,mat) values ('나팔꽃',  30, 80, 20);
insert into sungjuk(uname,kor,eng,mat) values ('대한민국',100,100,100);


-- [전체 칼럼 조회]
select uname, kor, eng, mat, tot, aver from sungjuk;


-- [전체 행 갯수 조회]
select count(*) from sungjuk; --10


-- [select]
-- 조회 및 검색
select kor, eng, mat from sungjuk;
select tot, aver from sungjuk;
select * from sungjuk; -- 전체 칼럼 조회


-- [as]
-- 칼럼명을 임시 변경
-- 만들어낸 데이터에 이름 붙일 때 사용
-- 실제 컬럼명이 바뀌는것이 아님
select kor as korea, eng as english, mat as mate from sungjuk;

-- as 생략 가능
select kor korea, eng english, mat math from sungjuk;

-- 임시 한글 컬럼명은 일시적으로 분석해야 하는 경우만 추천
select uname as 이름, kor as 국어, eng as 영어, mat as 수학, tot 총점, aver 평균
from sungjuk;


-- 칼럼의 순서는 의미가 없음
select uname, kor, eng, mat from sungjuk;
select kor, eng, mat, uname from sungjuk;


-- [count 함수]
-- 행 갯수 조회
select count(uname) from sungjuk; --count(uname) 10
select count(kor) from sungjuk; --count(kor) 10
select count(eng) from sungjuk; --count(eng) 10
select count(mat) from sungjuk; --count(mat) 10

-- null값은 카운트하지 않음 (0)
select count(tot) from sungjuk; --count(tot) 0
select count(aver) from sungjuk; --count(aver) 0

-- count와 as 함께 사용
select count(eng) as cnt_eng from sungjuk;

-- 임시 칼럼명으로 한글 가능
select count(mat) as 수학갯수 from sungjuk;

--sungjuk 테이블의 전체 행의 갯수
select count(*) from sungjuk;
select count(*) as 전체행갯수 from sungjuk;
select count(*) 전체행갯수 from sungjuk; --as 생략

