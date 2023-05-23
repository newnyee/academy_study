-- 05_제약조건
-- 파일명 : 20230223_05제약조건.sql
-- 저장위치 : D:\java202301\database


-- sungjuk 테이블 삭제
drop table sungjuk;
commit;

-- sungjuk 테이블 조회
select uname, tot, aver, wdate from sungjuk;

-- sungjuk 테이블 생성
create table sungjuk (
   sno    int         primary key
 , uname  varchar(50) not null
 , kor    int         check(kor between 0 and 100) --국어점수 0 ~ 100 사이만 입력 가능
 , eng    int         check(eng between 0 and 100) --영어점수 0 ~ 100 사이만 입력 가능
 , mat    int         check(mat between 0 and 100) --수학점수 0 ~ 100 사이만 입력 가능
 , addr   varchar(50) check(addr in ('Seoul', 'Jeju', 'Busan', 'Suwon'))
 , tot    int         default 0
 , aver   int         default 0
 , wdate  date        default sysdate --인서트 되는 시점에 자동으로 디폴트 값이 들어감
);


-- primary key 제약조건
-- ORA-00001: 무결성 제약 조건(SYSTEM.SYS_C007314)에 위배됩니다
-- sno 칼럼은 기본키(PK)이므로 중복된 값을 허용하지 않음
insert into sungjuk(sno, uname) values(1, '홍길동'); --2번 실행했을 때 에러 발생


-- not null 조건
-- ORA-01400: NULL을 ("SYSTEM"."SUNGJUK"."UNAME") 안에 삽입할 수 없습니다
insert into sungjuk(sno) values(2); --uname 칼럼은 not null 이므로 반드시 값을 입력해야 함

insert into sungjuk(sno, uname) values(2, '1234567890');
insert into sungjuk(sno, uname) values(3, 'ABCDEFGHIJ');
insert into sungjuk(sno, uname) values(4, 'ABCDEFGHIJK');
insert into sungjuk(sno, uname) values(5, '무궁화');
insert into sungjuk(sno, uname) values(6, '대한민국');


-- check 제약조건
insert into sungjuk(sno, uname, kor, eng, mat)
values(1, '홍길동', -10, 20, 300);

insert into sungjuk(sno, uname, kor, eng, mat, addr)
values(2, '홍길동', 10, 20, 30, 'Incheon');


-- default 제약조건
-- tot와 aver는 0 입력, wdate는 현재 날짜가 입력됨
insert into sungjuk(sno, uname, kor, eng, mat, addr)
values(2, '홍길동', 10, 20, 30, 'Seoul');



