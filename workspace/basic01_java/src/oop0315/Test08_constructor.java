package oop0315;

public class Test08_constructor {
    public static void main(String[] args) {
        // 생성자 연습
        // School 클래스 생성 후 연습

        School one = new School("김연아", 100, 90, 95);
        one.calc();
        one.disp();

        String a = new String(); // 빈문자열
        String b = null; // 메모리 할당을 하지 않고 b라는 참조변수 선언만 해 놓음
        System.out.println(a.length()); // 글자갯수 0
        // System.out.println(b.length()); // NullPointerException 발생

        System.out.println("null"); // 문자열 상수

    }
}
