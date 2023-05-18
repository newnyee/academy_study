package oop0322;

public class Test04_buyer {
    public static void main(String[] args) {
        // 상품 구매 및 반품 프로그램

        // 1) 상품 만들기
        // Product 클래스
        // SmartTV 클래스
        // Notebook 클래스
        // HandPhone 클래스

        // 2) 상품 진열하기
        SmartTV tv = new SmartTV();
        Notebook note = new Notebook();
        HandPhone phone = new HandPhone();

        // 3) 상품 구매하기
        // Buyer 클래스
        Buyer kim = new Buyer();
        kim.buy(tv);
        kim.buy(note);
        kim.buy(phone);

        kim.buy(note);
        kim.buy(note);
        kim.buy(note);

        kim.disp();
        System.out.println("------------------------------");

        // 4) 반품하기
        // Order 클래스
        // 상품을 중복해서 구매하지 않았다는 전제하에 반품
        Order lee = new Order();
        lee.buy(tv);
        lee.buy(phone);
        lee.buy(note);

        lee.disp();
        System.out.println("<<<<< 반품");
        lee.refund(note);

        System.out.println("<<<<< 결과");
        lee.disp();
    }
}