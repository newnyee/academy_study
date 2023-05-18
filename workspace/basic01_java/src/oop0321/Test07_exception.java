package oop0321;

public class Test07_exception {
    public static void main(String[] args) {
        // 예외처리 Exception
        /*
            Runtime exception
            자바 클래스 실행(Run)시 발생하는 에러
            try ~ catch ~ finally (finally 생략가능)
            throws
         */

        // 1) 예외처리 하지 않은 경우
        /*
        System.out.println(1);
        // Exception이 발생되면 프로그램은 정상적으로 종료되지 않음
        System.out.println(3/0); //ArithmeticException 발생
        System.out.println(5);
        System.out.println("END");
         */

        // 2) 예외처리를 한 경우
        // Exception이 발생하더라도 정상적으로 프로그램은 종료시킬 수 있다
        /*
        try {
            // 예외 발생이 예상되는 코드 작성
            System.out.println(1);
            System.out.println(3 / 0);
            System.out.println(5);
        } catch (Exception e) {
            // 예외가 발생되었을 때 처리할 코드 작성
            System.out.println(e); //프로그램 실행 중 예외 정보(예외종류) 출력
            e.printStackTrace(); //프로그램 전체 종료 된 후 예외 정보(예외종류, 예외가 발생한 코드 줄번호) 출력 -> 인텔리제이에서만 인듯
        }
        System.out.println("END"); //프로그램 정상 종료
         */

        // 3)
        /*
        try {
            System.out.println(1);
            int[] num = new int[3];
            num[5] = 7;
            System.out.println(9);
        } catch (Exception e) {
            e.printStackTrace(); //ArrayIndexOutOfBoundsException
        }
        System.out.println("END");
         */

        // 4)
        /*
        try {
            System.out.println(1);
            int num = Integer.parseInt("KOREA");
            System.out.println(num);
            System.out.println(3);
        } catch (Exception e) {
            e.printStackTrace(); //NumberFormatException
        }
        System.out.println("END");
         */

        // 5)
        /*
        try {
            System.out.println(1);
            Integer inte = null;
            System.out.println(5/inte);
        } catch (Exception e) {
            System.out.println(e); //NullPointerException
        }
        System.out.println("END");
         */

        // 6) 다중 catch문
        /*
        try {
            int a = 2/0;
            int b = Integer.parseInt("KOREA");
            int[] num = new int[3];
            num[5] = 7;
        } catch (ArithmeticException e) {
            System.out.println(e);
        } catch (NumberFormatException e) {
            System.out.println(e);
        } catch (ArrayIndexOutOfBoundsException e) {
            System.out.println(e);
        } catch (NullPointerException e) {
            System.out.println(e);
        }
        System.out.println("END");
         */

        // 7)
        try {
            int a = 2/0;
            int b = Integer.parseInt("KOREA");
            int[] num = new int[3];
            num[5] = 7;
        } catch (Exception e) { //다형성
            // Exception 클래스 : 모든 예외 발생의 최상위 클래스
            System.out.println(e);
        }
        System.out.println("END");

        // 8) finally문
        // 예외발생 유무에 상관없이 무조건 실행됨\
        try {
            System.out.println("OPEN");
            System.out.println(1/0);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            System.out.println("CLOSE");
        }
        System.out.println("END");
    }
}
