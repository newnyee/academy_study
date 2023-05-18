-- 테이블 생성
create table tb_notice(
     ntc_no       number(5)                 not null   -- 일련번호 -99999~99999
    ,ntc_subject  varchar2(100)             not null   -- 글제목
    ,ntc_content  varchar2(2000)            not null   -- 글내용
    ,ntc_readcnt  number(5)       default 0 not null   -- 글조회수
    ,ntc_regdt    date            default   sysdate   -- 글작성일
    ,ntc_fix      number(1)       default 2 not null   -- 상단고정1, 기본글2
    ,primary key(ntc_no)                               -- bbsno 기본키
);

create sequence ntc_seq;

-- 행 추가
INSERT INTO tb_notice (ntc_no, ntc_subject, ntc_content, ntc_readcnt, ntc_regdt)
VALUES (ntc_seq.nextval, ?, ?, ?, SYSDATE);

-- 전체 조회 + 검색어 조회 + 페이징
SELECT *
FROM (SELECT a.*, ROWNUM AS rnum
      FROM (SELECT ntc_subject, ntc_readcnt, ntc_regdt
            FROM tb_notice
            WHERE ? LIKE '% ? %'
            ORDER BY ntc_fix DESC , ntc_readcnt) a)
WHERE rnum>= ? AND rnum<= ?
ORDER BY rnum DESC;

-- 행 갯수 + 검색어 조회 행 갯수
SELECT COUNT(*) AS cnt
FROM tb_notice
WHERE ? LIKE '% ? %';

-- 행 조회
SELECT ntc_subject, ntc_content, ntc_readcnt, ntc_regdt
FROM tb_notice
WHERE ntc_no = ? ;

-- 행 수정 ★★★
UPDATE tb_notice SET ntc_subject = ?, ntc_content = ?, ntc_fix = ?
WHERE ntc_no = ?;

-- 행 삭제
DELETE FROM tb_notice WHERE ntc_no=?;

SELECT * FROM tb_notice;


SELECT *
FROM (SELECT a.*, ROWNUM AS rnum
      FROM (SELECT ntc_subject, ntc_readcnt, ntc_regdt, ntc_fix
            FROM tb_notice
            ORDER BY ntc_fix DESC , ntc_readcnt) a)
ORDER BY rnum DESC;

alter table tb_notice add ntc_fix number(1) not null;
alter table tb_notice drop column ntc_fix;

commit ;