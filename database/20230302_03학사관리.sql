-- 03_학사관리   
-- 파일명 : 20230302_03학사관리.sql
-- 저장위치 : D:\java202301\database


-- 1. 테이블 생성
-- [학생테이블]
create table tb_student(
   hakno    char(5)     not null         --학번
  ,uname    varchar(20) not null         --이름
  ,email    varchar(20) unique           --이메일
  ,address  varchar(20) not null         --주소
  ,phone    varchar(20)                  --전화번호
  ,regdt    date        default sysdate  --등록일
  ,primary key(hakno)                    --기본키
);

-- [과목테이블]
create table tb_gwamok(
   gcode    char(4)      not null        --과목코드 (p:프로그램교과목, d:디자인교과목)
  ,gname    varchar(20)  not null        --과목이름
  ,ghakjum  number(2)    default 1       --학점 (-99~99 까지 허용)
  ,regdt    date         default sysdate --등록일
  ,primary key(gcode)                    --기본키
);

-- [수강테이블]
create table tb_sugang(
   sno    number     not null   --일련번호
  ,hakno  char(5)    not null   --학번
  ,gcode  char(4)    not null   --과목코드
  ,primary key(sno)             --기본키
);


-- 2. 수강테이블 시퀀스 생성
create sequence sugang_seq;


-- 3. 행추가
-- [tb_student 테이블 행 추가]
insert into tb_student(hakno,uname,address,phone,email)
values('g1001','홍길동','서울','111-5558','11@naver.com');

insert into tb_student(hakno,uname,address,phone,email)
values('g1002','홍길동','제주','787-8877','33@daum.net');

insert into tb_student(hakno,uname,address,phone,email)
values('g1003','개나리','서울','554-9632','77@naver.com');

insert into tb_student(hakno,uname,address,phone,email)
values('g1004','홍길동','부산','555-8844','88@daum.net');

insert into tb_student(hakno,uname,address,phone,email)
values('g1005','진달래','서울','544-6996','33@nate.com');

insert into tb_student(hakno,uname,address,phone,email)
values('g1006','개나리','제주','777-1000','66@naver.com');


-- [tb_gwamok 테이블 행 추가]
insert into tb_gwamok(gcode,gname,ghakjum) values('p001','JAVA',3);
insert into tb_gwamok(gcode,gname,ghakjum) values('p002','Oracle',3);
insert into tb_gwamok(gcode,gname,ghakjum) values('p003','JSP',2);
insert into tb_gwamok(gcode,gname,ghakjum) values('d001','HTML',1);
insert into tb_gwamok(gcode,gname,ghakjum) values('d002','포토샵',5);
insert into tb_gwamok(gcode,gname,ghakjum) values('d003','일러스트',3);
insert into tb_gwamok(gcode,gname,ghakjum) values('d004','CSS',1);
insert into tb_gwamok(gcode,gname,ghakjum) values('p004','Python',3);
insert into tb_gwamok(gcode,gname,ghakjum) values('p005','AJAX',2);


-- [tb_sugang 테이블 행 추가]
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1002','p002');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1002','p001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1002','p003');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p003');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p004');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1005','p001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1005','d001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1005','d002');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1005','d003');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','d001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p002');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1006','p001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p005');

commit;

select * from tb_student; --6
select * from tb_gwamok; --9
select * from tb_sugang; --14

-- tb_student, tb_gwamok, tb_sugang --------------------------------------------

문1)학생테이블에서 지역별 인원수를 인원수순으로 조회하시오
select address, count(*) as "인원수"
from tb_student
group by address
order by "인원수";


문2)학생테이블에서 동명이인이 각 몇명인지 조회하시오
select uname, count(*) as "인원수"
from tb_student
group by uname;


문3)학생테이블의 학번, 이름, 주소를 조회하시오 (주소는 영문으로 출력)
select hakno, uname,
case address when '서울' then 'Seoul'
             when '부산' then 'Busan'
             when '제주' then 'Jeju'
             end as address
from tb_student;


문4)학생테이블에서 주소별 인원수가 3명미만 행을 조회하시오
select address, count(*) as "인원수"
from tb_student
group by address
having count(*) < 3;


문5)과목테이블에서 프로그램 교과목만 조회하시오
select * from tb_gwamok where gcode like ('p%');


문6)과목테이블에서 디자인 교과목중에서 3학점만 조회하시오
select *
from tb_gwamok
where gcode like ('d%') and ghakjum = 3;


문7)과목테이블에서 프로그램 교과목의 학점 평균보다 낮은 프로그램 교과목을 조회하시오
select gname
from tb_gwamok
where ghakjum < (select avg(ghakjum) from tb_gwamok);





