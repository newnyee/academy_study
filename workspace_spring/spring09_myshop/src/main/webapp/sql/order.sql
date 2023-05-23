-- 주문서
create table orderlist (
    orderno       char(15)       primary key,      --주문서번호
    id            varchar(20)    not null,         --아이디
    totalamount   number,                          --총결제금액
    payment       varchar(100)   not null,         --결제구분
    deliverynm    varchar(100)   not null,         --받는사람
    deliveryaddr  varchar(2000)  not null,         --받는주소
    deliverymsg   varchar(2000),                   --배송메세지
    ordercheck    char(1)        not null,         --결과상태 (Y:배송완료, C:주문취소, I:진행중)
    orderdate     date           default sysdate  --주문일
);

-- 주문 상세 내역
create table orderdetail (
    ono           number    primary key,  --번호
    orderno       char(15)  not null,     --주문코드
    product_code  number    not null,     --상품코드
    qty           number    not null,     --수량
    price         number    not null      --가격
);

-- 주문 상세 내역 시퀀스 생성
create sequence orderdetail_seq;

commit;

INSERT INTO ORDERLIST (orderno, id, totalamount, payment, deliverynm, deliveryaddr, deliverymsg, ordercheck)
VALUES (#{orderno}, #{id}, #{totalamount}, #{payment}, #{deliverynm}, #{deliveryaddr}, #{deliverymsg}, 'Y');

select *
from orderlist;


-- 주문서 번호 생성
SELECT NVL(MAX(ORDERNO), CONCAT(#{date}, 0) + 1)
FORM ORDERLIST
WHERE ORDERNO LIKE #{date} || '%';