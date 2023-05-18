package oop0320;

public class Test04_super {
    public static void main(String[] args) {
        // super 부모, 조상
        // superclasses 부모 클래스들
        // subclassed 자식 클래스들

        // super : 자식클래스에서 부모클래스의 멤버에 접근할 때
        // super() : 자식클래스의 생성자 함수가 부모 클래스의 생성자 함수를 호출할 때

        // this : 멤버변수와 일반 지역변수를 구분하기 위해 사용
        // this() : 자신의 생성자 안에서 자신의 생성자를 호출할 때 사용

        // School 클래스 생성 후 실습

        // 상속관계에서 생성성자 호출 순서
        // 부모생성자가 먼저 호출되고 자신의 생성자가 호출된다

        MiddleSchool ms = new MiddleSchool();
        // 1. School()... 부모생성자 호출
        // 2. MiddleSchool()... 자식생성자 호출
        ms.disp(); // 부모클래스 필드의 값 그대로 출력

        HighSchool hs = new HighSchool();
        // 1. School()... 부모생성자 호출
        // 2. HighSchool()... 자식생성자 호출
        hs.disp();

    }
}