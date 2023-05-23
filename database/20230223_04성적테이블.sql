-- 04_성적테이블
-- 파일명 : 20230223_04성적테이블.sql
-- 저장위치 : D:\java202301\database


-- sungjuk 테이블 삭제
drop table sungjuk;
commit;

-- sungjuk 테이블 생성
create table sungjuk (
   sno    int         not null
 , uname  varchar(50) not null
 , kor    int         not null
 , eng    int         not null
 , mat    int         not null
 , tot    int         null
 , aver   int         null
 , addr   varchar(20) null
 , wdate  date        null
);

-- table 전체 조회
select * from sungjuk;

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


-- [문제]

-- 문1) 전체행에 대해서 총점(tot), 평균(aver)을 구하시오
update sungjuk
set tot=(kor+eng+mat), aver=(kor+eng+mat)/3;

-- 문2) 이름에 '나' 글자가 있는 행을 조회하시오
select *
from sungjuk
where uname like '%나%';

-- 문3) 주소가 서울, 제주 행을 조회하시오
select *
from sungjuk
where addr in ('Seoul', 'Jeju');

-- 문4) 국영수 세과목 모두 90점 이상 행이 몇개인지 조회하시오
select count(*) cnt
from sungjuk
where kor>=90 and eng>=90 and mat>=90;

-- 문5) 주소별로 정렬해서 조회하시오. 주소가 같다면 일련번호 순으로 다시 정렬해서 조회하시오
select *
from sungjuk
order by addr, sno;

select sno, uname, kor, eng, mat, tot, aver, addr, wdate, rnum
from (select A.*, rownum as rnum from (SELECT * FROM sungjuk ORDER BY uname) A)
where rnum between 4 and 6;



select * from sungjuk;
select * from tb_student;
select * from tb_gwamok;
select * from tb_sugang;

select hakno, gcode, gname

select a.hakno, a.gcode, gname
from (select hakno, gcode from tb_sugang where hakno = 'g1001') a
join tb_gwamok b
on a.gcode = b.gcode
order by gcode;

select a.hakno, a.gcode, gname
from tb_sugang a join tb_gwamok b
on a.gcode = b.gcode
where a.hakno = 'g1001'
order by gcode;










