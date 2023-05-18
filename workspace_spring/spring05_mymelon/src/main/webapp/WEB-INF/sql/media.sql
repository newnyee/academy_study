CREATE TABLE media (
   mediano      NUMBER        NOT NULL PRIMARY KEY,          -- 미디어 번호
   title        VARCHAR2(255) NOT NULL,                      -- 제목
   poster       VARCHAR2(255) DEFAULT 'poster.jpg' NOT NULL, -- 포스터 이미지
   filename     VARCHAR2(255) NOT NULL,
   filesize     NUMBER        DEFAULT 0 NOT NULL,
   mview        CHAR(1)       DEFAULT 'Y' NOT NULL,          -- 출력모드
   rdate        DATE          NOT NULL,                      -- 등록일
   mediagroupno NUMBER        NULL                           -- 부모테이블 PK
);

-- 시퀀스 생성
create sequence media_seq;

commit ;

-- 행목록
SELECT * FROM media
WHERE mview = 'Y' AND mediagroupno = ?
ORDER BY mediano DESC;

INSERT INTO media (mediano, title, poster, filename, filesize, rdate, mediagroupno)
VALUES (media_seq.nextval, ?, ?, ?, ?, SYSDATE, ?);

select * from media;

--행 삭제
DELETE FROM media WHERE mediano = ?;

SELECT * FROM media WHERE mediano = ?;