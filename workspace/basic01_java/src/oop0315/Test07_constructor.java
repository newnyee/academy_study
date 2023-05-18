package oop0315;

import java.util.GregorianCalendar;

public class Test07_constructor {
    public static void main(String[] args) {
        // 생성자(Constructor)
        // 오버로딩이 가능하다

        // 생성자를 메소드라 할 수 없는 이유
        // new 연산자와 함께 메모리를 할당할 때 사용한다
        // 반환값이 존재하지 않음 (void, 반환타입 사용할 수 없음)
        // 생성자의 이름은 메소드와는 달리 반드시 클래스 이름과 동일해야함

        // 객체의 소멸
        // 자바는 객체 제거 코드를 지원하지 않음
        // 참조가 모두 끊긴 객체는 가비지 컬렉터가 자동으로 삭제함
        // -> 따라서 객체를 제거하고 싶다면 그 객체의 모든 참조를 끊으면 됨

        GregorianCalendar today = new GregorianCalendar();

        if(today.isLeapYear(2023) == true) {
            System.out.println("윤년입니다");
        } else {
            System.out.println("평년입니다");
        }

        // 문) 서기 1년~서기 2023년 까지의 윤년의 갯수를 구하시오
        int count = 0;
        for(int i=1; i<=2023; i++) {
            if(today.isLeapYear(i) == true) count++;
        }

        System.out.println("서기 1년~서기 2023년 까지 윤년의 갯수: " + count);

    }
}
