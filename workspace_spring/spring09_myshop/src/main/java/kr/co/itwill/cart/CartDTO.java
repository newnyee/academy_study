package kr.co.itwill.cart;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class CartDTO {

    private int cartno;
    private int product_code;
    private int price;
    private int qty;
    private String id;
    private String regdate;

    public CartDTO() {}

}
