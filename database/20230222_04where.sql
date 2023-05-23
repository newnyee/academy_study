-- 04_where
-- 파일명 : 20230222_04where.spl
-- 저장위치 : D:\java202301\database


-- [where 조건절]
-- 조건을 만족하는 행들에 대해서
-- 조건에 만족하는 레코드만 대상으로 조회(select), 수정(update), 삭제(delete)하기 위해서


select * from sungjuk;

--문1) 국어점수가 50점이상 행을 조회하시오
select * from sungjuk where kor>=50;
  
  
--문2) 영어 점수가 50점미만 행을 조회하시오
select * from sungjuk where eng<50;
  
  
--문3) 이름이 '대한민국' 행을 조회(출력)하시오
select * from sungjuk where uname='대한민국';
  
  
--문4) 이름이 '대한민국' 아닌 행을 조회하시오
select * from sungjuk where not uname='대한민국';
select * from sungjuk where uname!='대한민국';
select * from sungjuk where uname<>'대한민국'; --좌우가 서로 같지 않다


--문5) 국어, 영어, 수학 세과목의 점수가 모두 90이상 행을 조회하시오
select * from sungjuk where kor>=90 and eng>=90 and mat>=90;


--문6) 국어, 영어, 수학 중에서 한과목이라도 40미만 행을 조회하시오
select * from sungjuk where kor<40 or eng<40 or mat<40;


--문7) 국어점수가 80 ~ 89점 사이 행을 조회하시오
select * from sungjuk where kor>=80 and kor<=89;


--문8) 이름이 '무궁화', '봉선화'인 행을 조회하시오
select * from sungjuk where uname='무궁화' or uname='봉선화';


-- 문9) 국, 영, 수 모두 100점 아닌 행을 조회하시오
select * from sungjuk where kor!=100 or eng!=100 or mat!=100;
select * from sungjuk where not (kor=100 and eng=100 and mat=100);








