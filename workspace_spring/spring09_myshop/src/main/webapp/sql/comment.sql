-- 상품 댓글 테이블
create table pcomment (
    product_code  number         not null,        --상품번호
    cno           number         primary key,     --댓글번호
    content       varchar2(255)  not null,        --댓글 내용
    wname         varchar2(100)  not null,        --작성자
    regdate       date           default sysdate --작성일
);

drop table pcomment;

-- 댓글 시퀀스
create sequence pcomment_seq;

-- INSERT
INSERT INTO PCOMMENT(PRODUCT_CODE, CNO, CONTENT, WNAME)
VALUES (?, PRODUCT_SEQ.nextval, ?, ?)

-- DELETE
DELETE FROM PCOMMENT WHERE CNO = ? AND PRODUCT_CODE = ?

-- UPDATE
UPDATE PCOMMENT SET CNO = ?, CONTENT = ?, WNAME = ?
WHERE CNO = ? AND PRODUCT_CODE = ?

-- SELECT : 전체 행 조회
SELECT CNO, CONTENT, WNAME, REGDATE
FROM PCOMMENT
WHERE PRODUCT_CODE = ?

commit;

select *
from PCOMMENT;

