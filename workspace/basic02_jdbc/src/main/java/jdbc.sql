-- sungjuk테이블 추가
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval, '손흥민', 99, 98, 97, 'Seoul', sysdate);

select * from sungjuk order by sno desc;

select count(*) from sungjuk;

select sno, uname, kor, eng, mat, tot, aver, addr, wdate from sungjuk where sno = 101;

--sqlplus 사용자 추천
--오라클 콘솔창 예쁘게 출력
set linesize 1000;
col hakno for a10;
col addr for a10;
col uname for a10;
col email for a20;
col address for a10;
col phone for a15;
col regdt for a15;
col gname for a10;

select * from sungjuk;
select * from tb_student;
select * from tb_gwamok;
select * from tb_sugang;

select aver from sungjuk where addr = 'Seoul';

select * from sungjuk where uname like '%나%' order by sno desc;

select sno, uname, kor, eng, mat, tot, aver, addr, wdate,