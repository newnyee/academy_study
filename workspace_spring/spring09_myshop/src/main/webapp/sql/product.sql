-- 상품 테이블 생성
create table product (
     product_code  number          primary key       --상품번호
    ,product_name  varchar2(255)   not null          --상품명
    ,description   varchar2(2000)                    --상품내용
    ,price         number          default 0         --상품가격
    ,filename      varchar2(255)                     --파일명
    ,filesize      number          default 0         --파일크기
    ,regdate       date            default sysdate  --작성일
);

--상품번호 시퀀스 생성
create sequence product_seq;

commit;

select *
from product;
