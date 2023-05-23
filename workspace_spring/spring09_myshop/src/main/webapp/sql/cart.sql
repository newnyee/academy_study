-- 장바구니
create table cart (
    cartno        number       primary key,      --장바구니번호(필수)
    product_code  number       not null,         --상품코드
    price         number       not null,         --상품가격(편의)
    qty           number       default 0,        --상품수량
    id            varchar(20)  not null,         --아이디
    regdate       date         default sysdate  --작성일(필수)
);

-- 시퀀스
create sequence cart_seq;

commit;

select *
from cart;

SELECT ID, CARTNO, A.PRODUCT_CODE, A.PRICE, QTY, PRODUCT_NAME, FILENAME
FROM CART A
JOIN PRODUCT B
ON A.PRODUCT_CODE = B.PRODUCT_CODE
WHERE ID = ?
