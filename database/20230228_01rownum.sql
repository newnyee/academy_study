-- 01_rownum    
-- 파일명 : 20230228_01rownum.sql
-- 저장위치 : D:\java202301\database

-- [모조칼럼]
-- Oracle DBMS에서 제공하는, rownum(행번호), rowid(행의 주소값)

select sno, uname, addr, rownum, rowid
from sungjuk;

select sno, uname, addr, rownum, rowid
from sungjuk
where rownum>=1 and rownum<=5;

select sno, uname, addr, rownum
from sungjuk
where addr='Seoul';

select sno, uname, kor, rownum
from sungjuk
where kor between 80 and 89;

-- 자신의 행번호를 포함해서 정렬됨. rownum을 추가하는 시점도 고려해야함
select sno, uname, addr, rownum
from sungjuk
order by uname;
