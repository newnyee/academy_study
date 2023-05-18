package oop0322;

import java.util.ArrayList;
import java.util.List;

// 상품 반품 관련 클래스
class Order {
    private int myMoney = 1000; //나의 총 재산
    private int myMileage = 0; //나의 마일리지 점수(bonusPoint 누적)
    private int i = 0;

    // 상품을 구매했을 때 어떤 상품을 구매했는지 저장 (나의 구매상품 목록)
    private List<Product> item = new ArrayList<>();

    public Order() {}

    /*
        메소드 오버로드 (함수명 중복 정의)
        public void buy(SmartTV a) {}
        public void buy(Notebook a) {}
        public void buy(HandPhone a) {}
     */
    public void buy(Product p) {
        // Product -> SmartTV, Notebook, HandPhone 클래스의 부모클래스
        if(this.myMoney<p.price) {
            System.out.println("잔액이 부족합니다");
            return;
        }
        item.add(p); //구매상품 저장
        this.myMoney -= p.price;
        this.myMileage += p.bonusPoint;
    }

    public void refund(Product p) {
        if (!item.contains(p)) {
            System.out.println("구매한 상품이 아닙니다");
            return;
        }
        item.remove(p);
        this.myMoney += p.price;
        this.myMileage -= p.bonusPoint;
        System.out.println(p + " 반품되었습니다");
    }

    public void disp() {

        if (item.isEmpty()) {
            System.out.println("구매 상품 없음");
            return;
        }
        // 구매한 상품 목록과 구매한 상품의 총 합계 금액을 구하시오

        // 방법1
        /*
        StringBuilder shoplist = new StringBuilder();
        shoplist.append(item.get(0));
        int sum = item.get(0).price;
        for (int i = 1; i < item.size(); i++) {
            shoplist.append( ", " + item.get(i));
            sum += item.get(i).price;
        }
         */

        // 방법2
        int sum = 0; //총 사용금액
        for (int i = 0; i < item.size(); i++) {
            sum += item.get(i).price;
        }

        // 방법1 출력
        // System.out.println("구매한 상품 목록 : " + shoplist);

        // 방법2 출력
        System.out.println("구매한 상품 목록 : " + item);
        System.out.println("구매한 상품의 총 합계 금액 : " + sum);
        System.out.println("나의 남은 재산 : " + this.myMoney);
        System.out.println("나의 마일리지 : " + this.myMileage);
    }
}
