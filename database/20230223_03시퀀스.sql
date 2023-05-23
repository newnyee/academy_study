-- 03_시퀀스
-- 파일명 : 20230223_03시퀀스.sql
-- 저장위치 : D:\java202301\database


-- 자동으로 일련번호 부여
-- Oracle Database : sequence 생성
-- M*SQL Database : identity 제약조건


-- sungjuk 삭제
drop table sungjuk; -- 테이블삭제
delete from sungjuk; -- 내용삭제
commit;

-- sungjuc 테이블 작성
create table sungjuk (
   sno    int         not null  -- 프라이머리 키
 , uname  varchar(50) not null
 , kor    int         not null
 , eng    int         not null
 , mat    int         not null
 , tot    int         null
 , aver   int         null
 , addr   varchar(20) null
 , wdate  date        null
);

-- 행추가 (수기)
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(1, '홍길동', 89, 88, 87, 'Seoul', '2023-02-23'); --날짜 데이터는 문자열 형태로 추가
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(2, '홍길동', 89, 88, 87, 'Seoul', '2023-02-23');
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(3, '홍길동', 89, 88, 87, 'Seoul', '2023-02-23');
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(4, '홍길동', 89, 88, 87, 'Seoul', '2023-02-23');

select * from sungjuk;



-- [시퀀스 Sequence]
-- 일련번호 자동 생성
-- 시퀀스 생성: create sequence 시퀀스명;
-- 시퀀스 삭제: drop sequence 시퀀스명;


-- 시퀀스 생성 형식
-- create sequence 시퀀스명; -- 1씩 증가(기본)
-- create sequence 시퀀스명 increment by 증가값 start with 시작값; -- 시작값과 증가값을 지정함

-- sungjuk 테이블에서 사용할 시퀀스 생성
create sequence sungjuk_seq;

-- 시퀀스 삭제
drop sequence sungjuk_seq;


-- [sysdate 함수] - 시스템의 현재 날짜 정보


-- 시퀀스와 sysdate함수를 이용한 행 추가 테스트
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval, '홍길동', 89, 88, 87, 'Seoul', sysdate);


delete from sungjuk where sno=2;

commit;





