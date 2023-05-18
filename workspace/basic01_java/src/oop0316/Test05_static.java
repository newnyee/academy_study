package oop0316;

public class Test05_static {
    public static void main(String[] args) {
        // static 정적
        // 변수, 메소드
        // 메모리 생성 1번, 소멸도 1번

        // static은 클래스명으로 직접 접근 가능하다
        // 클래스명.변수
        // 클래스명.메소드

        // System.out.println(Math.PI); // 클래스명.변수
        // System.out.println(Math.abs(-3)); // 클래스명.메소드

        //static변수와 static메소드는 클래스명으로 직접 접근한다
        System.out.println(Sawon.COMPANY);
        System.out.println(Sawon.SUDANG);
        System.out.println(Sawon.TAX);
        Sawon.line();

        // 1)static의 특징을 적용하지 않은 경우(비추천)
        Sawon one = new Sawon("1001", "개나리", 100);
        // 나의 세금
        double myTax = one.pay * one.TAX;
        // 나의 총 지급액
        int total = (int) (one.pay - myTax + one.SUDANG);

        System.out.println("회사: " + one.COMPANY);
        System.out.println("사번: " + one.sabun);
        System.out.println("이름: " + one.name);
        System.out.println("급여: " + one.pay);
        System.out.println("수당: " + one.SUDANG);
        System.out.println("세금: " + myTax);
        System.out.println("총지급액: " + total);
        one.line();

        // 2)static의 특징을 적용한 경우(추천)
        Sawon two = new Sawon("2002", "진달래", 200);
        myTax = two.pay * Sawon.TAX;
        total = (int) (two.pay - myTax + Sawon.SUDANG);

        System.out.println("회사: " + one.COMPANY);
        System.out.println("사번: " + one.sabun);
        System.out.println("이름: " + one.name);
        System.out.println("급여: " + one.pay);
        System.out.println("수당: " + one.SUDANG);
        System.out.println("세금: " + myTax);
        System.out.println("총지급액: " + total);
        one.line();

        // 3)static 변수의 연산
        // 생성도 1번, 소멸도 1번

        Sawon kim = new Sawon("1003", "무궁화", 300);
        Sawon lee = new Sawon("1004", "봉선화", 400);

        System.out.println(kim.SUDANG);
        System.out.println(lee.SUDANG);

        kim.SUDANG = kim.SUDANG + 1;
        System.out.println(lee.SUDANG);

        lee.SUDANG = lee.SUDANG + 1;
        System.out.println(kim.SUDANG);

        Sawon.SUDANG = Sawon.SUDANG + 1;
        System.out.println(Sawon.SUDANG); //추천
        System.out.println(kim.SUDANG);
        System.out.println(lee.SUDANG);


    }
}
