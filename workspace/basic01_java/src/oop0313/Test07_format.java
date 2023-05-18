package oop0313;

public class Test07_format {
    public static void main(String[] args) {
        //출력서식
        //교재 p90 참조
        /*
            \n 줄바꿈
            \t 탭
            \r
            \b

            %d 정수형
            %f 실수형
            %c char 타입
            %s String 타입

            System.out.printf("출력서식", 값);
        */

        System.out.print("사과\n참외\n수박\n\n\n");
        System.out.print("바\t나\t나");
        System.out.print("\n딸\n기\n");

        System.out.printf("%d %d %d\n", 3, 5, 7);
        System.out.printf("나이:%d\n", 25);
        System.out.printf("a:%d\t b:%d\t c:%d\n", 2, 4, 6);

        System.out.printf("#%5d#\n", 123);  // #  123#
        System.out.printf("#%-5d#\n", 123); // #123  #
        System.out.printf("#%05d#\n", 123); // #00123#

        System.out.printf("x:%f y:%f z:%f\n", 1.2, 3.4, 5.6); // x:1.200000 y:3.400000 z:5.600000
        System.out.printf("#:%6.2f#\n", 7.8); // #:  7.80#
        System.out.printf("#:%-6.2f#\n", 7.8); // #:7.80  #
        System.out.printf("#:%.2f#\n", 7.8); // #:7.80#

        System.out.printf("%s %s %s\n", "Year", "Month", "Date"); // Year Month Date
        System.out.printf("#%8s#\n", "HAPPY"); // #   HAPPY#
        System.out.printf("#%-8s#\n", "HAPPY"); // #HAPPY   #

        System.out.println(String.format("%.4f", 10/3.0)); // 3.3333
    }
}
