--sungjuk.sql

[오라클 DB 서비스 확인]
	- 명령프롬프트
		-> sqlplus system/1234
		
오라클 콘솔창 세팅
set linesize1000;
col uname for a10; --col 칼럼명 for 20자
col addr for a10;

-- 성적테이블 삭제
drop table sungjuk;

-- 성적테이블 생성
create table sungjuk(
     sno   int         not null --일련번호
    ,uname varchar(50) not null --이름
    ,kor   int         not null --국어
    ,eng   int         not null --영어
    ,mat   int         not null --수학
    ,aver  int         null     --평균
    ,addr  varchar(50)          --주소
    ,wdate date                 --등록일(년월일시분초)
    ,primary key(sno)
);

-- 성적시퀀스 삭제
drop sequence sungjuk_seq;

-- 성적시퀀스 생성
create sequence sungjuk_seq;

-- 행추가
insert into sungjuk(sno, uname, kor, eng, mat, aver, addr, wdate)
values(sungjuk_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate)

-- 전체 목록 조회
select sno, uname, kor, eng, mat, aver, addr, wdate
from sungjuk
order by wdate desc;

-- 행 조회
select uname, kor, eng, mat, aver, addr, wdate
from sungjuk
where sno=?

-- 행 삭제
delete from sungjuk where sno=?

-- 행 수정
updated sungjuk
set uname=?, kor=?, eng=?, mat=?, aver=?, addr=?, wdate=sysdate
where sno=?







