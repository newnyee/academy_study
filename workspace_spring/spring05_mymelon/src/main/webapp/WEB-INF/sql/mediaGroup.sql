-- 미디어 그룹 테이블 생성
CREATE TABLE mediagroup (
    mediagroupno NUMBER        NOT NULL PRIMARY KEY, -- 그룹번호
    title        VARCHAR2(255) NOT NULL              -- 그룹제목
);

-- 시퀀스 생성
create sequence mediagroup_seq;

commit;

select *
from mediagroup;

UPDATE mediagroup SET title = ? WHERE mediagroupno = ?

SELECT *
FROM (SELECT a.*, ROWNUM AS rnum
      FROM (SELECT mediagroupno, title
            FROM mediagroup
            ORDER BY mediagroupno) a)
WHERE rnum>= ? AND rnum<= ?
ORDER BY rnum DESC;