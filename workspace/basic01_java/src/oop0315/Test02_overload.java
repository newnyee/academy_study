package oop0315;

public class Test02_overload {
    public static void hap (int a) {
        System.out.println(a);
    }

    public static void hap (int a, int b) {
        System.out.println(a + b);
    }

    public static void hap (double a) {
        System.out.println(a);
    }

    public static void hap (double a, double b) {
        System.out.println(a + b);
    }

//    public static int hap (double a, double b) {
//        return a + b;
//        // 리턴타입이 달라도 매개변수의 갯수와 타입이 같으면 컴파일 에러남
//        // 메소드 오버로딩은 매개변수의 갯수와 타입만 관련이 있다.
//    }

    public static void main(String[] args) {
        // Method Overload 메소드명 중복 정의
        // -> 함수명을 중복해서 사용할 수 있다
        // 메소드 오버로드의 전제조건
        // -> 매개변수의 갯수가 달라야한다
        // -> 매개변수의 자료형이 달라야한다

        hap(3);
        hap(2, 4);
        hap(5.6);
        hap(9.8, 7.6);

        //절대값 구하기
        System.out.println(Math.abs(-3)); //int형
        System.out.println(Math.abs(4L)); //long형
        System.out.println(Math.abs(5.6f)); //float형
        System.out.println(Math.abs(7.8)); //double형
    }
}
