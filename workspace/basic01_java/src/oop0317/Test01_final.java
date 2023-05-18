package oop0317;

import java.util.Calendar;
/*
final class Animal{}
class Elephant extends Animal {} //에러, 상속받을 수 없음
 */

// 2)final 메소드
class Fruit {
    void view() {}
    final void disp() {
        System.out.println("과일");
    }
}
class Apple extends Fruit {
    // 자식클래스 extends 부모클래스

    @Override // annotation, 재정의
    void view() {
        super.view();
    }
}
public class Test01_final {
    public static void main(String[] args) {
        // final 마지막
        // 변수 : 변수를 상수화
        // 메소드 : 오버라이딩할 수 없음
        // 클래스 : 상속할 수 없음, 종단 클래스

        int a = 3;
        a = 5; // 변수는 다른값으로 대입 가능

        final int b = 2; // 변수의 상수화
        // b = 4; 에러, final 변수는 다른값으로 대입 불가능

        System.out.println(Calendar.YEAR); //1
        System.out.println(Calendar.MONTH); //2
        System.out.println(Calendar.DATE); //5

        System.out.println(Calendar.HOUR); //10
        System.out.println(Calendar.MINUTE); //12
        System.out.println(Calendar.SECOND); //13

        /*
            class Calendar {
                static final int YEAR = 1;
            }
         */
        Apple apple = new Apple();
        apple.disp();
    }
}