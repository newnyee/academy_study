package oop0320;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Test07_poly {
    public static void main(String[] args) {
        // 다형 Polymorphism

        // 다형성의 예
        // Calendar now = new GregorianCalendar(); //상위 클래스 타입으로 자식객체 생성가능

        // Father 클래스 생성 후 실습

        // 1) 일반적인 방식으로 객체 생성
        // new 연산자
        // POJO(Plain Old Java Object) 방식
        /*
        Father fa = new Father();
        fa.disp();

        Son son = new Son("손흥민", "영국");
        son.disp();

        Daughter dau = new Daughter("김연아", "한국");
        dau.disp();
         */

        // 2) 다형성을 이용한 객체 생성
        // 자식클래스가 부모클래스에 대입 가능하다
        // 부모클래스는 대입된 자식클래스의 모양으로 스스로를 변환한다
        Father fa = new Son("손흥민", "영국");
        fa.disp();

        fa = new Daughter("김연아", "한국");
        fa.disp();

        System.out.println(fa.name);
        System.out.println(fa.addr);

        // System.out.println(fa.friend); 오류
        // friend 필드를 사용하고싶다면 자식클래스 타입으로 강제타입변환 시켜줘야함
        // 강제타입변환이 가능하려면 자동타입변환이 한번 일어났던 변수여야한다.
        Daughter dou = (Daughter) fa;
        System.out.println(dou.friend);
    }
}