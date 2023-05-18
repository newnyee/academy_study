package oop0316;

public class Test01_constructor {
    public static void main(String[] args) {
        // 생성자
        // 클래스명과 동일한 함수
        // 오버로딩이 가능하다
        // new 연산자와 함께 메모리 할당할 때 사용한다

        new School();

        // 생성자 함수의 전달값은 객체 선언과 동시에 초기값을 전달해 주는 역할을 한다
        School one = new School("김연아", 100, 90, 95);
        one.calc();
        one.disp();

    }
}
