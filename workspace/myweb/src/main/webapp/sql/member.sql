-- member.spl

-- [회원등급]
-- A1: 관리자
-- B1: 중간 관리자
-- C1: 우수 사용자
-- D1: 일반 사용자 (기본)
-- E1: 비회원
-- F1: 탈퇴한 회원

-- 회원 테이블
CREATE TABLE member (
    id       VARCHAR(10)  NOT NULL,         -- 아이디, 중복 안됨.
    passwd   VARCHAR(10)  NOT NULL,         -- 패스워드
    mname    VARCHAR(20)  NOT NULL,         -- 성명
    tel      VARCHAR(14)  NULL,             -- 전화번호
    email    VARCHAR(50)  NOT NULL  UNIQUE, -- 전자우편 주소, 중복 안됨
    zipcode  VARCHAR(7)   NULL,             -- 우편번호, 12345
    address1 VARCHAR(255) NULL,             -- 주소 1
    address2 VARCHAR(255) NULL,             -- 주소 2(나머지주소)
    job      VARCHAR(20)  NOT NULL,         -- 직업
    mlevel   CHAR(2)      NOT NULL,         -- 회원 등급, A1, B1, C1, D1, E1, F1
    mdate    DATE         NOT NULL,         -- 가입일
    PRIMARY  KEY (id)
);

-- Test용 행 추가
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values('webmaster', '12341234', '웹마스터', '123-4567', 'webmaster@itwill.com'
      , '12345', '서울시 강남구 역삼동', '삼원타워4층', 'A02', 'A1', sysdate );

insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values('itwill', '12341234', '웹마스터', '123-4567', 'itwill@itwill.com'
      , '12345', '서울시 강남구 역삼동', '삼원타워4층', 'A02', 'D1', sysdate );

insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values('korea', '12341234', '웹마스터', '123-4567', 'user1@soldesk.com'
      , '12345', '서울시 종로구 관철동', '코아빌딩8층', 'A02', 'F1', sysdate );

select * from member;

-- 로그인
-- 아이디/비번 일치하면 회원등급 가져오기
-- 단, 비회원과 탈퇴회원은 제외
SELECT mlevel
FROM member
WHERE id = ? AND passwd = ? AND NOT mlevel IN ('E1', 'F1');

-- 아이디 중복확인
SELECT COUNT(*) AS cnt
FROM member
WHERE id = ?;

-- 회원가입
INSERT INTO member (id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ? ,'D1', SYSDATE);

select * from member;

-- 아이디 비번 찾기
-- 1. 이름과 이메일을 입력받아서 일치가 되면 id를 가져오고
SELECT id
FROM member
WHERE mname=? AND email=?;


-- 2. 임시 비밀번호를 발급한다
----> 대문자, 소문자, 숫자를 이용해서 랜덤하게 10글자를 만든다
----> 생성된 임시 비밀번호를 테이블에서 수정하기
UPDATE member SET passwd=? WHERE id=? AND email=?;


-- 3. 아이디와 임시 비밀번호를 이메일로 전송하기
-- 4. 임시비밀번호로 로그인 한 후, 본인이 회원 정보 수정에서 비밀번호를 수정한다
SELECT id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate
FROM member WHERE id=?;


-- 회원 탈퇴 (회원등급 변경)
update member set mlevel=? where passwd=? and id=?;

delete from member where id='an_seona';

select * from member;

commit ;