-- 04_CSV변환
-- 파일명 : 20230302_04CSV변환.sql
-- 저장위치 : D:\java202301\database


-- [CSV 파일]
-- 모든 데이터가 ','로 구분되어 있는 파일


-- [CVS 파일을 데이터베이스로 가져오기]
-- 공공데이터포털 https://data.go.kr/ 활용


-- 문1) 도로명 우편번호 테이블 구축하기
-- 1) zipdoro.csv 준비

-- 2) zipdoro.csv 내용을 저장하는 zipdoro 테이블 생성
create table zipdoro (
   zipno       char(5)       --우편번호
 , zipaddress  varchar(1000) --주소
);
commit;
drop table zipdoro;

-- 3) 가져오기와 내보내기
-- zipdoro 테이블 우클릭 -> 데이터 임포트 (가져오기)
-- zipdoro 테이블 우클릭 -> export      (내보내기)

-- 4) 전체 행 갯수 조회하기
select count(*) from zipdoro;


-- 문2) 한국교원대학교_초중등학교위치.csv를 변환해서 테이블에 저장하시오 (11873행)
create table school_location (
   sch_id       char(10)       null
 , sch_name     varchar(100)   null
 , sch_emh      varchar(20)    null
 , sch_adr      varchar(500)   null
 , date_time    date           null
 , update_time  date           null
 , loc_lttd     number(10,8)   null
 , loc_hrdns    number(10,7)   null
);
drop table school_location;
commit;

-- 과제1) 비어있는 값(null)을 찾으시오
select *
from school_location
where sch_adr is null;
      

-- 과제2) 각 시도별 초등학교, 중학교 갯수를 
select sch_adr, sch_emh, count(*) as "학교 갯수"
from (select substr(sch_adr, 1 , 2) as sch_adr, sch_emh
      from school_location)
where sch_adr is not null
group by sch_adr, sch_emh
order by sch_adr, sch_emh desc;












