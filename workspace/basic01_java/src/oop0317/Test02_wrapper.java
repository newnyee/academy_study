package oop0317;
import java.lang.*; // 자바 기본 패키지, 생략가능
public class Test02_wrapper {
    public static void main(String[] args) {
        // Wrapper class 포장클래스
        // 기본자료형을 참조형화 해 놓은 클래스들
        // 대부분 java.lang 패키지에 선언되어 있음
        /*
            기본형     참조형(클래스)
            boolean    Boolean
            byte       Byte
            short      Short
            int        Integer
            long       Long
            float      Float
            double     Double
            char       Character

         */

        boolean boo1 = true;
        Boolean boo2 = new Boolean("false"); //비추천 -> static 클래스
        Boolean boo3 = true; //추천

        System.out.println(boo1);
        System.out.println(boo2);
        System.out.println(boo3.toString()); //문자열 "true"

        int in1 = 3;
        Integer in2 = new Integer(5);  //비추천 -> static 클래스
        Integer in3 = 7; //추천

        System.out.println(in1);
        System.out.println(in2);
        System.out.println(in3);

        System.out.println(in2.toString()); //문자열 "5"
        System.out.println(in3.doubleValue()); //double 타입 7.0

        System.out.println(Integer.toBinaryString(15)); //"1111"
        System.out.println(Integer.toOctalString(15)); //"17"
        System.out.println(Integer.toHexString(15)); //"f"

        System.out.println(Integer.sum(2, 4)); //6
        System.out.println(Integer.max(2, 4)); //4
        System.out.println(Integer.min(2, 4)); //2

        //★★★
        System.out.println(Integer.parseInt("123")); //정수형 123

        // NumberFormatException 발생
        //System.out.println(Integer.parseInt("KOREA"));

        long lo1 = 3; //같은 기본타입이라 int → long 자동타입변환 됨
        Long lo2 = new Long("5");
        Long lo3 = 7L; //타입이 기본타입과 참조타입으로 달라서 자동타입변환이 불가능하기때문에 L을 붙여야 한다?

        double dou1 = 2.4;
        Double dou2 = new Double("3.5"); // 문자열도 가능?
        Double dou3 = 6.7;

        // 문)실수형값들 중에서 정수의 합을 구하시오 (2+3+6)
        int hap = (int)dou1 + dou2.intValue() + dou3.intValue();
        System.out.println(hap);


        char ch1 = 'R';
        Character ch2 = new Character('a');
        Character ch3 = 'm';

        System.out.println(ch1);
        System.out.println(ch2);
        System.out.println(ch3);

        System.out.println(Character.isWhitespace(' ')); //유니코드의 문자가 공백인지 여부를 나타냄
        System.out.println(Character.toLowerCase('R'));
        System.out.println(Character.toUpperCase('a'));
    }
}
