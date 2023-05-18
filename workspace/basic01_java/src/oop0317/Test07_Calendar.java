package oop0317;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class Test07_Calendar {
    public static void main(String[] args) {
        // 날짜 관련 클래스 (년,월,일,시,분,초,요일)
        // GregorianCalendar
        // Calendar
        // Date

        GregorianCalendar now = new GregorianCalendar(); // 양력 달력

        // 비추천
        System.out.println(now.get(1)); // 2023 (년도)
        System.out.println(now.get(2)); // 2 -> 3월
        System.out.println(now.get(2)+1); // 출력값도 3월로 보일 수 있게 1을 더해줌
        System.out.println(now.get(5)); // 17 (일)

        // Test01_final.java 참조
        // 추천
        System.out.println(now.get(Calendar.YEAR)); // 2023 (년도)
        System.out.println(now.get(Calendar.MONTH)); // 2 -> 3월
        System.out.println(now.get(Calendar.MONTH)+1); // 출력값도 3월로 보일 수 있게 1을 더해줌
        System.out.println(now.get(Calendar.DATE)); // 17 (일)

        System.out.println(now.get(Calendar.HOUR)); // 5
        System.out.println(now.get(Calendar.MINUTE)); //13
        System.out.println(now.get(Calendar.SECOND)); //28

        // 24시간을 기준으로
        System.out.println(now.get(Calendar.HOUR_OF_DAY)); //17
        // 요일(1일 2월 3화 4수 5목 6금 7토)
        System.out.println(now.get(Calendar.DAY_OF_WEEK)); //6

        // 날짜 데이터 구성하기
        // 1989년 5월 30일
        GregorianCalendar myBirth= new GregorianCalendar();
        myBirth.set(Calendar.YEAR, 1989);
        myBirth.set(Calendar.MONTH, Calendar.MAY); // 5라고쓰면 5월인지 6월인지 알 수 없어서 Calendar 클래스의 MAY 상수를 이용
        myBirth.set(Calendar.DATE, 30);

        // 날짜 데이터 연산
        // now 날짜에서 3년 더하기
        now.add(Calendar.YEAR, 3);
        System.out.println(now.get(Calendar.YEAR));

        // now 날짜에서 5달 뻬기
        now.add(Calendar.MONTH, -5);
        System.out.println(now.get(Calendar.MONTH));

        // now 날짜에서 7일 더하기
        now.add(Calendar.DATE, 7);
        System.out.println(now.get(Calendar.DATE));

    }
}
