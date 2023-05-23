-- 06_group
-- 파일명 : 20230223_06group.sql
-- 저장위치 : D:\java202301\database

-- sungjuk 테이블 삭제
drop table sungjuk;
commit;

-- sungjuk 테이블 생성
create table sungjuk (
   sno    int         primary key
 , uname  varchar(50) not null
 , kor    int         check(kor between 0 and 100)
 , eng    int         check(eng between 0 and 100)
 , mat    int         check(mat between 0 and 100)
 , addr   varchar(50) check(addr in ('Seoul', 'Jeju', 'Busan', 'Suwon'))
 , tot    int         default 0
 , aver   int         default 0
 , wdate  date        default sysdate
);

-- sungjuk 테이블 입력 데이터
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval,'아이티윌', 90, 85, 95, 'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'무궁화',40,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'진달래',90,50,90,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'개나리',20,50,20,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'봉선화',90,90,90,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'나팔꽃',50,50,90,'Suwon',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'선인장',70,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'소나무',90,60,90,'Busan',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'참나무',20,20,20,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'홍길동',90,90,90,'Suwon',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'무궁화',80,80,90,'Suwon',sysdate);

-- table 조회
select * from sungjuk;


-- [데이터 그룹화]

-- [distinct]
-- 칼럼에 중복 내용이 있으면 대표값 1개만 출력
-- 형식) distinct [칼럼명]
select addr from sungjuk order by addr; --sungjuk 테이블의 모든 addr칼럼의 값이 오름차순정렬로 출력됨

select distinct(addr) from sungjuk; --sungjuk 테이블의 중복내용 제거된 대표값 addr값 1개씩만 출력
select distinct(uname) from sungjuk;


-- [group by]
-- 칼럼에 동일 내용끼리 그룹화 시킴
-- 형식) group by 칼럼1, 칼럼2, 칼럼3, ...

-- 주소가 동일한 값을 그룹화 시키고 주소를 조회
select addr 
from sungjuk
group by addr; --distinct와 결과값 동일

--select [group by를 사용함으로서 알고싶은 컬럼의 데이터] --단, 그룹화 시키고 나올 수 있는 값은 1개만 가능한 값만 조회
--from [테이블명]
--group by [그룹화할 컬럼-> 컬럼 안의 값으로 그룹화 됨];

-- ORA-00979: GROUP BY 표현식이 아닙니다.
select addr
from sungjuk
group by addr, mat; --에러








