-- 여행상품 코드 테이블 명세서
create table tbl_tourcode_02 (
	tcode   char(4)       not null  primary key, --상품코드
	tarea   varchar2(30),						 --여행지역
	tdate   char(8),							 --출발일자
	ttime   char(4),							 --출발시간
	tday    number(2),							 --숙박일수
	thotel  varchar2(30),						 --숙박호텔
	tmoney  number(7),							 --여행금액
	tair    varchar2(30)						 --항공정보
);

insert into tbl_tourcode_02 (tcode, tarea, tdate, ttime, tday, thotel, tmoney, tair)
values ('JJ01', '제주', '20181201', '0930', 2, 'J 호텔', 360000, 'J 항공');

insert into tbl_tourcode_02(tcode, tarea, tdate, ttime, tday, thotel, tmoney, tair)
values('JJ02', '부산', '20181202', '1000', 2, 'B 호텔', 280000, 'B 항공');

insert into tbl_tourcode_02(tcode, tarea, tdate, ttime, tday, thotel, tmoney, tair)
values('JJ03', '제주', '20181204', '1000', 2, 'J 호텔', 360000, 'J 항공');

insert into tbl_tourcode_02(tcode, tarea, tdate, ttime, tday, thotel, tmoney, tair)
values('JJ04', '제주', '20181207', '1100', 3, 'J 호텔', 420000, 'J 항공');

insert into tbl_tourcode_02(tcode, tarea, tdate, ttime, tday, thotel, tmoney, tair)
values('JJ05', '부산', '20181209', '1330', 2, 'B 호텔', 360000, 'B 항공');

insert into tbl_tourcode_02(tcode, tarea, tdate, ttime, tday, thotel, tmoney, tair)
values('JJ06', '제주', '20181210', '0930', 3, 'J 호텔', 460000, 'J 항공');


-- 예약 등록 테이블
create table tbl_reserve_01 (
	rno      char(8)       not null  primary key, --예약번호
	rjumin   varchar2(13),						  --주민번호
	rname    varchar2(20),                        --예약자 성명
	rphone1  char(3),                             --예약자전화1
	rphone2  char(4),                             --예약자전화1
	rphone3  char(4),                             --예약자전화1
	remail   varchar2(30),                        --고객이메일
	rstat    char(1),                             --결제상태
	tcode    char(4)                              --상품코드
);


-- 상품코드 조회하기
-- 예) [JJ01] 제주 20181201 출발
select tcode, tarea, tdate from tbl_tourcode_02;


-- travelList.jsp 예약 내역 조회
select rno, rjumin, rname, rphone1, rphone2, rphone3, a.tcode,
tarea, tdate, ttime, thotel, tair, rstat, tmoney
from tbl_reserve_01 a
join tbl_tourcode_02 b
on a.tcode = b.tcode
order by tcode;
