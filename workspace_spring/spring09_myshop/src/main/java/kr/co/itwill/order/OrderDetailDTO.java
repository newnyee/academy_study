package kr.co.itwill.order;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Setter @Getter
public class OrderDetailDTO {

    private int ono;
    private String orderno;
    private int product_code;
    private int qty;
    private int price;

    public OrderDetailDTO() {}
}
