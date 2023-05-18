package oop0316;

public class Sawon {
    // 멤버변수 field
    String sabun; // 사원번호
    String name; // 이름
    int pay; // 급여

    // 생성자 constructor
    public Sawon() {}
    public Sawon(String sabun, String name, int pay) {
        this.sabun = sabun;
        this.name = name;
        this.pay = pay;
    }

    static String COMPANY = "(주)아이티윌";
    static int SUDANG = 10;
    static double TAX = 0.03;

    static void line() {
        System.out.println("---------------------");
    }


    // 메소드
}
