package oop0315; // 현재 클래스의 저장위치, 한번만 선언함

// 클래스를 사용하려면 저장위치(package)를 선언하고 사용한다
import java.io.*; //import는 여러개 선언 가능
import java.sql.*;
import java.util.Arrays; //해당 클래스를 직접 선언
import java.awt.*; //GUI 클래스 선언
import javax.swing.*; //GUI 클래스 선언
import oop0314.*;

/*
    접근제한자 (Access Modifier) / 접근제어, 접근수정
    -> private 비공개, 클래스 내부에서만 접근 가능하다, 은닉할 수 있다.
    -> default(package) 아무것도 쓰지 않으면 기본값으로 default 가 됨, 현재 package(oop0315)내에서만 접근 가능하다
    -> protected 상속관계에 있는 클래스가 다른 패키지에 있는 경우 접근 가능하다
    -> public 공개, basic01_java 프로젝트 내에서 모두 접근 가능하다
 */
public class Test06_class {
    public static void main(String[] args) {
        // 클래스와 객체(Object)
        // -> 클래스 명의 첫 글자는 대문자로 쓴다
        // -> 클래스 구성멤버 : 멤버변수(field), 메소드(method)

        // System.out.println(Math.E); //Math 클래스의 멤버변수
        // System.out.println(Math.abs(-3)); //Math 클래스의 메소드

        // Sungjuk 클래스 생성 후 테스트

        // 자료형
        // -> 기본자료형
        // -> 참조자료형(reference) -> 클래스

        // new 연산자
        // -> 클래스를 사용하려면 메모리를 할당하고 사용한다
        // -> 형식) new 클래스명();
        // -> 클래스 객체(Object) 또는 인스턴스(instance) 라고 한다

        // 객체 지향 프로그램 (Object Oriented Program)

        // 기본자료형
        // int a = 3; //int 는 메모리 4바이트 할당

        // 참조자료형
        // RAM(Random Access Memory)의 heap 영역에 메모리가 할당되고 주소값이 발생된다
        // new Sungjuk(); -> new 연산자로 객체의 메모리 할당

        Sungjuk sj = new Sungjuk();
        // sj -> 참조변수 : 메모리가 할당된 곳을 주소를 가리킨다
        // 예)100번지

        // 도트 연산자(.)
        // -> 참조변수를 통해 객체에 접근하는 연산자
        sj.name = "손흥민";
        sj.kor = 100;
        sj.eng = 95;
        sj.mat = 80;
        // sj.aver; private 속성은 클래스 외부에서 접근 불가능
        sj.calc();
        sj.disp();
        //sj.view(); 에러. private 속성은 클래스 외에서 접근 불가능


        Sungjuk one = new Sungjuk();
        one.name = "박지성";
        one.kor = 20;
        one.eng = 30;
        one.mat = 35;
        one.calc();
        one.disp();


        Sungjuk two = new Sungjuk();
        one.name = "김연아";
        one.kor = 100;
        one.eng = 95;
        one.mat = 90;
        one.calc();
        one.disp();

        Sungjuk three = one;
        System.out.println(three.name);

        // Object.hashCode() -> 참조변수가 가지고 있는 객체의 주소값 반환
        System.out.println(one.hashCode());
        System.out.println(two.hashCode());
        System.out.println(three.hashCode());
        System.out.println(one == three);

    }
}
