package kr.co.itwill.order;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderDTO {

    private String orderno;
    private String id;
    private int totalamount;
    private String payment;
    private String deliverynm;
    private String deliveryaddr;
    private String deliverymsg;
    private String ordercheck;
    private String orderdate;

    public OrderDTO() {}
}
