-- bbs.sql
-- 답변형 및 댓글형 게시판

-- 테이블 삭제
drop table tb_bbs;


-- 테이블 생성
create table tb_bbs(
     bbsno    number(5)       not null -- 일련번호 -99999~99999
    ,wname    varchar2(20)    not null -- 작성자
    ,subject  varchar2(100)   not null -- 글제목
    ,content  varchar2(2000)  not null -- 글내용
    ,passwd   varchar2(10)    not null -- 글비밀번호
    ,readcnt  number(5)       default 0 not null -- 글조회수
    ,regdt    date            default  sysdate   -- 글작성일
    ,grpno    number(5)       not null  -- 글 그룹번호 (답변쓰기)
    ,indent   number(5)       default 0 -- 들여쓰기 (답변쓰기)
    ,ansnum   number(5)       default 0 -- 글순서 (답변쓰기)
    ,ip       varchar2(15)    not null  -- 사용자 요청 PC의 IP
    ,primary key(bbsno)                 -- bbsno 기본키
);


-- 시퀀스 생성
create sequence bbs_seq;


-- 시퀀스 삭제
drop sequence bbs_seq;

-- 새글쓰기
-- bbsno                           : 시퀀스를 이용해서 일련변호
-- wname, subject, content, passwd : 사용자가 입력
-- readcnt, regdt,indent, ansnum   : default 값 있음
-- ip                              : 요청 PC의 IP 저장
-- grpno                           : max(bbsno) + 1


-- 그룹번호(grpno) 만들기
SELECT NVL(MAX(bbsno), 0)+1 FROM tb_bbs;


-- 행추가
INSERT INTO tb_bbs (bbsno, wname, subject, content, passwd, ip, grpno)
VALUES (bbs_seq.nextval, ?, ?, ?, ?, ?, (SELECT NVL(MAX(bbsno), 0)+1 FROM tb_bbs));


-- 전체 글 목록 조회
SELECT a.*, ROWNUM AS rnum
FROM (SELECT bbsno, wname, subject, readcnt, regdt, indent
      FROM tb_bbs
      ORDER BY grpno DESC, ansnum ASC) a;


-- 전제 행 갯수 조회
SELECT COUNT(*) FROM tb_bbs;


-- 상세보기
SELECT bbsno, wname, subject, content, readcnt, regdt, ip, grpno, indent, ansnum
FROM tb_bbs WHERE bbsno=?;


-- 조회수 증가
UPDATE tb_bbs SET readcnt=readcnt+1 WHERE bbsno=?;


-- 행 삭제
DELETE FROM tb_bbs WHERE bbsno=? AND passwd=?;


-- 행 수정
UPDATE tb_bbs SET wname=?, subject=?, content=?, ip=?
WHERE bbsno=? AND passwd=?;

-- 답변쓰기 알고리즘
-- 새글 쓰기 : 부모글
-- 답변 쓰기 : 자식글

-- 그룹 번호(grpno) : 자식글 그룹번호 = 부모글 그룹번호
-- 들여쓰기(indent) : 자식글 들여쓰기 = 부모글 들여쓰기 + 1 (최상위 부모로 부터 몇번째 자손인지)
-- 글순서(ansnum) : 그룹 내에서의 글순서

-- 번호 제목            그룹번호 들여쓰기 글순서
--  1   제주도             1       0       0
--       →애월읍           1       1       1
--         →제주공항       1       2       2
--       →서귀포           1       1       3
--  2   서울시             2       0       0
--       →마포구           2       1       1
--         →이대           2       2       2
--         →신촌           2       2       3
--       →강남구           2       1       4
--         →역삼동         2       2       5
--           →삼원타워     2       3       6
--       →종로구           2       1       7
--  3   부산시             3       0       0


-- 글순서(ansnum) 재조정
update tb_bbs
set ansnum = ansnum +1
where grpno = 2 and ansnum>=2;


-- 답글 갯수 표시
SELECT COUNT(*)-1 AS replyAll
FROM tb_bbs
WHERE grpno = (SELECT grpno FROM tb_bbs WHERE bbsno = ? AND indent=0);


-- 검색
-- 제목+내용에서 '파스타'가 있는지 검색
select * from tb_bbs where subject like '%파스타%' or content like '%파스타%';
-- 제목에서 '파스타'가 있는지 검색
select * from tb_bbs where subject like '%파스타%';
-- 내용에서 '파스타'가 있는지 검색
select * from tb_bbs where content like '%파스타%';
-- 작성자에서 '파스타'가 있는지 검색
select * from tb_bbs where wname like '%파스타%';


-- 페이징
SELECT *
FROM (SELECT c.*, ROWNUM AS r
      FROM (SELECT *
            FROM(SELECT a.*, ROWNUM AS rnum
                 FROM (SELECT bbsno, wname, subject, readcnt, regdt, grpno, indent
                       FROM tb_bbs
                       ORDER BY grpno ASC, ansnum DESC) a) b
            ORDER BY rnum DESC) c);


-- 페이징 + 검색
SELECT *
FROM (SELECT c.*, ROWNUM AS r
      FROM (SELECT *
            FROM(SELECT a.*, ROWNUM AS rnum
                 FROM (SELECT bbsno, wname, subject, readcnt, regdt, grpno, indent
                       FROM tb_bbs
                       WHERE subject LIKE '%파스타%'
                       ORDER BY grpno ASC, ansnum DESC) a) b
            ORDER BY rnum DESC) c)
WHERE r>=1 AND r<=10;


-- [과제] 제목에 댓글(자식글)의 갯수를 조회하시오 (indent칼럼 참조)
select bbsno, subject, a.grpno, replycnt
from (select bbsno, subject, grpno
      from tb_bbs
      where indent=0) a
join (select grpno, count(*)-1 as replycnt
      from tb_bbs
      group by grpno) b
on a.grpno = b.grpno
where replycnt>0;


SELECT *
FROM (SELECT a.*, ROWNUM AS rnum
      FROM (SELECT bbsno, wname, subject, readcnt, regdt, grpno, indent
      FROM tb_bbs
      ORDER BY grpno ASC, ansnum DESC) a)
WHERE rnum>=-5 and rnum<=3
ORDER BY rnum DESC;
