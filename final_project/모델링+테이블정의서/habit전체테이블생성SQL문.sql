-- 회원 테이블
-- 이미지 기본값 설정 해야함
CREATE TABLE user (
  user_id      varchar(25)   NOT NULL  primary key,  --유저 아이디
  user_pw      varchar(25)   NOT NULL,               --비밀번호
  user_name    varchar(15)   NOT NULL,               --이름
  user_email   varchar(40)   NOT NULL,               --이메일
  user_phone   varchar(15)   NOT NULL,               --전화번호
  user_birth   varchar(10)   NOT NULL,               --생년월일(8자리)
  user_gender  char(1)       NOT NULL,               --성별
  user_img     varchar(100)  NOT NULL  DEFAULT '',   --프로필 이미지
  user_size    int           NOT NULL  DEFAULT 0,    --이미지 사이즈
  user_status  char(1)       NOT NULL  DEFAULT 'O',  --회원 상태
  user_grade   char(1)       NOT NULL  DEFAULT 'M',  --회원 구분
  user_level   char(1)       NOT NULL  DEFAULT 'B',  --회원 등급
  user_date    datetime      NOT NULL  DEFAULT now() --가입날짜
);


-- 호스트 테이블
-- 이미지 기본값 설정 해야함
CREATE TABLE host (
  host_id        varchar(25)   NOT NULL  primary key,     --호스트 아이디
  host_name      varchar(20)   NOT NULL,                  --호스트 닉네임
  host_phone     varchar(15)   NOT NULL,                  --호스트 전화번호
  host_intro     varchar(200)  NOT NULL,                  --소개글
  host_email     varchar(40)   NOT NULL,                  --호스트 이메일
  host_img       varchar(100)  NOT NULL	 DEFAULT default, --프로필 이미지
  host_size      int	         NOT NULL	 DEFAULT 0,       --이미지 사이즈 
  host_account   varchar(50)   NOT NULL,                  --계좌번호
  host_bank      varchar(15)   NOT NULL,                  --은행
  host_acholder  varchar(15)   NOT NULL,                  --예금주
  host_date      datetime      NOT NULL	 DEFAULT now()    --호스트 등록일
);


-- 에너지 테이블
CREATE TABLE energy (
  energy_no       int	         NOT NULL	 auto_increment  primary key, --에너지 번호
  user_id         varchar(25)	 NOT NULL,                              --회원 아이디
  energy_saveuse  int	         NOT NULL,                              --적립/사용에너지
  energy_date     datetime	   NOT NULL	 DEFAULT now(),               --에너지 변경 날짜
  energy_sources  varchar(50)	 NOT NULL                               --에너지 출처
);


-- 카테고리 테이블
CREATE TABLE cate (
  cate_no      varchar(10)  NOT NULL  primary key, --카테고리 코드(식별코드 따로 만들어서 사용)
  cate_large   varchar(50)  NOT NULL,              --대분류
  cate_middle  varchar(50)  NOT NULL               --중분류
);


-- 콘텐츠 테이블
-- 이미지 기본값 설정 해야함
CREATE TABLE cont (
  cont_no        int	         NOT NULL	 auto_increment  primary key, --콘텐츠 코드
  cate_no        int 	         NOT NULL,                              --카테고리 코드
  host_id        varchar(25)	 NOT NULL,                              --호스트 아이디
  cont_name      varchar(50)	 NOT NULL,                              --콘텐츠 명
  cont_place     varchar(30)	 NOT NULL,                              --콘텐츠 장소
  cont_img       varchar(100)	 NOT NULL  DEFAULT default,             --대표이미지
  cont_size      int	         NOT NULL  DEFAULT 0,                   --이미지 사이즈
  cont_content   Text(6500)    NOT NULL,                              --콘텐츠 설명
  cont_view      int	         NOT NULL	 DEFAULT 0,                   --조회수
  cont_stdate    datetime	     NOT NULL  DEFAULT now(),               --콘텐츠 등록일
  cont_endate    datetime	     NOT NULL,                              --콘텐츠 종료일
  cont_hashtag1  varchar(35)	 NULL,                                  --해시태그1
  cont_hashtag2  varchar(35)	 NULL,                                  --해시태그2
  cont_hashtag3  varchar(35)	 NULL,                                  --해시태그3
  cont_hashtag4  varchar(35)	 NULL,                                  --해시태그4
  cont_hashtag5  varchar(35)	 NULL,                                  --해시태그5
  cont_status    char(1)	     NOT NULL  DEFAULT 'Y'                  --콘텐츠 판매 상태
);


-- 원데이클래스 테이블
CREATE TABLE one (
  pro_no      varchar(35)	 NOT NULL  primary key, --상품코드
  cont_no     int	         NOT NULL,              --콘텐츠 코드
  one_date    varchar(35)	 NOT NULL,              --상품명(수업일시)
  one_maxqty  int	         NOT NULL	 DEFAULT 0,   --최대모집인원(총수량)
  one_price   int	         NOT NULL	 DEFAULT 0,   --가격
  one_status  char(2)	     NOT NULL	 DEFAULT 'OO' --상품 상태(OO:예약가능, OC:예약불가, OS:품절)
);
-- 원데이 클래스 시퀀스(상품코드에 사용)
create sequence 데이터베이스이름.sq_one
start with 1
increment by 1
maxvalue 999999
cycle;


-- 회원권/회차권 테이블
CREATE TABLE prod (
  pro_no       varchar(35)  NOT NULL  primary key, --상품코드
  cont_no      int	        NOT NULL,              --콘텐츠 코드
  prod_name    varchar(50)	NOT NULL,              --상품명
  prod_qty     int	        NOT NULL  DEFAULT 0,   --판매수량
  prod_price   int	        NOT NULL  DEFAULT 0,   --가격
  prod_status  char(2)	    NOT NULL  DEFAULT 'PO' --상품상태(PO:구매가능, PC:구매불가, PS:품절)
);
-- 회원권/회차권 시퀀스(상품코드에 사용)
create sequence 데이터베이스이름.sq_prod
start with 1
increment by 1
maxvalue 999999
cycle;


-- 장바구니 테이블
CREATE TABLE cartlist (
  cl_no    int          NOT NULL  auto_increment  primary key, --장바구니 코드
  user_id  varchar(25)  NOT NULL,                              --구매 회원 아이디
  pro_no   varchar(35)  NOT NULL,                              --상품 코드
  cl_qty   int          NOT NULL  DEFAULT 0,                   --수량
  cl_date  datetime     NOT NULL  DEFAULT now()                --장바구니 등록일
);


-- 주문서 테이블
CREATE TABLE pay (
  pay_no      varchar(20)  NOT NULL  primary key,  --주문서 번호(식별코드 따로 만들어서 사용)
  user_id     varchar(25)  NOT NULL,               --회원아이디
  pay_total   int          NOT NULL	 DEFAULT 0,    --할인전 금액
  pay_point   int          NOT NULL	 DEFAULT 0,    --사용 에너지
  pay_method  char(1)      NOT NULL,               --결제 수단
  pay_status  char(1)      NOT NULL	 DEFAULT 'A',  --주문 상태
  pay_date    datetime     NOT NULL	 DEFAULT now() --주문 날짜
);


-- 주문 상세 테이블
CREATE TABLE payd (
  payd_no      int          NOT NULL  auto_increment  primary key, --주문 상세 번호
  pay_no       varchar(20)  NOT NULL,                              --주문서 번호
  user_id      varchar(25)  NOT NULL,                              --회원 아이디
  pro_no       varchar(35)  NOT NULL,                              --상품 코드
  payd_price   int          NOT NULL  DEFAULT 0,                   --상품 금액
  payd_qty     int          NOT NULL  DEFAULT 0,                   --주문 수량
  payd_status  char(1)      NOT NULL  DEFAULT 'R',                 --주문 상세 상태
  payd_date    datetime     NOT NULL  DEFAULT now()                --주문 날짜
  refn_status  char(3)      NOT NULL  DEFAULT 'RO'                 --환불 상태
);


-- 환불 테이블
CREATE TABLE refn (
  refn_no      int	        NOT NULL	auto_increment  primary key, --환불코드
  payd_no      int	        NOT NULL,                              --주문상세번호
  user_id      varchar(25)	NOT NULL,                              --회원아이디
  pro_no       varchar(35)	NOT NULL,                              --상품코드
  refn_qty     int	        NOT NULL	DEFAULT 0,                   --환불 수량
  refn_point   int	        NOT NULL	DEFAULT 0,                   --환불 에너지
  refn_pay     int	        NOT NULL	DEFAULT 0,                   --실 환불액
  refn_method  char(1)	    NOT NULL,                              --환불 수단
  refn_date    datetime	    NOT NULL	DEFAULT now()                --환불 날짜
);


-- 정산 테이블
CREATE TABLE calc (
  calc_no        varchar(35)	  NOT NULL  primary key,  --정산 코드(식별코드 따로 만들어서 사용)
  host_id        varchar(25)	  NOT NULL,               --호스트 아이디
  calc_date      varchar(50)	  NOT NULL,               --정산 기간
  calc_title     varchar(100) 	NOT NULL,               --정산서 제목
  calc_ttlprice  int	          NOT NULL  DEFAULT 0,    --총 지급액(수수료 전)
  calc_fee       int	          NOT NULL  DEFAULT 0,    --총 수수료 액
  calc_status    char(1)	      NOT NULL  DEFAULT 'N',  --지급 상태
  calc_addate    datetime	      NOT NULL  DEFAULT now() --정산 등록일
);


-- 정산 상세 테이블
CREATE TABLE calcd (
  calcd_no      int	         NOT NULL	 auto_increment  primary key, --정산 상세 코드
  calc_no       varchar(35)	 NOT NULL,                              --정산 코드
  payd_no       int	         NOT NULL,                              --주문 상세 번호
  pro_no        varchar(35)	 NOT NULL,                              --상품 코드
  calcd_price   int	         NOT NULL,                              --금액
  calcd_qty     int	         NOT NULL,                              --수량
  calcd_status  char(1)	     NOT NULL	,                             --주문상세상태
  calcd_date    varchar(35)	 NOT NULL                               --결제 날짜
);


-- 문의 테이블
CREATE TABLE question (
  q_no        int          NOT NULL  auto_increment  primary key, --문의 번호
  cont_no     int          NOT NULL,                              --콘텐츠 코드
  id          varchar(25)  NOT NULL,                              --회원/호스트 아이디
  q_question  TEXT(500)    NOT NULL,                              --내용
  q_bedate    datetime     NOT NULL  DEFAULT now(),               --등록일
  q_group     int          NOT NULL,                              --글 그룹번호
  q_div       char(1)      NOT NULL                               --구분코드(U:회원, H:호스트)
);


-- 리뷰 테이블
CREATE TABLE review (
  review_no       int	         NOT NULL	 auto_increment  primary key, --리뷰 코드
  user_id         varchar(25)	 NOT NULL,                              --유저 아이디
  cont_no         int	         NOT NULL,                              --콘텐츠 코드
  payed_no        int	         NOT NULL,                              --주문 상세 번호
  review_date     datetime	   NOT NULL	 DEFAULT now(),               --리뷰 등록일
  review_cont     Text(500)	   NOT NULL,                              --리뷰 내용
  review_star     int	         NOT NULL,                              --별점
  review_img      varchar(20)	 NULL,                                  --리뷰 이미지
  review_imgsize  int	         NULL,                                  --이미지 사이즈
  review_ask      varchar(10)	 NULL,                                  --공통질문
  review_status   char(1)	     NOT NULL 	DEFAULT 'Y'                 --리뷰 상태(Y:리뷰 게시중, N:리뷰 삭제)
);

-- 찜 테이블
CREATE TABLE zzim (
  zzim_no  int	        NOT NULL  auto_increment  primary key, --찜 코드
  user_id  varchar(25)	NOT NULL,                              --유저 아이디
  cont_no  int	        NOT NULL                               --콘텐츠 코드
);



-- 키워드 수집 테이블
CREATE TABLE reco (
  reco_no       int	         NOT NULL 	auto_increment  primary key, --키워드 코드
  reco_keyword  varchar(50)	 NOT NULL,                               --키워드
  reco_date     datetime	   NOT NULL	  DEFAULT now()                --키워드 생성일
);


-- 설문조사 테이블
CREATE TABLE survey (
  user_id   varchar(25)	 NOT NULL  primary key,  --유저 아이디
  ask_1     varchar(20)	 NOT NULL,               --질문1
  ask_2     varchar(20)	 NOT NULL,               --질문1
  ask_3     varchar(20)	 NOT NULL,               --질문1
  ask_4     varchar(20)	 NOT NULL,               --질문1
  ask_5     varchar(20)	 NOT NULL,               --질문1
  ask_date  datetime	   NOT NULL	 DEFAULT now() --설문 참여일
);