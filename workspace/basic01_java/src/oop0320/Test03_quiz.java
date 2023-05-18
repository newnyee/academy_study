package oop0320;

public class Test03_quiz {
    public static void main(String[] args) {
        // 연습문제
        // 문1) 주민번호의 각 숫자의 합을 구하시오  (Character 클래스와 charAt()메소드 이용)
        // 8+9+1+2+3+0+1+2+3+4+5+6+7
        String jumin = "8912301234567";
        String[] ju = jumin.split("");
        int sum = 0;
        for (int i = 0; i < jumin.length(); i++) {
            char ch = jumin.charAt(i);
            sum += Character.getNumericValue(ch);
        }
        System.out.println(sum);


        // 문2) 대소분자를 서로 바꿔서 출력하시오 (Character 클래스와 charAt()메소드 이용)
        // gONE wITH tHE wIND
        String str = "Gone With The Wind";
        String result = "";
        for (int i = 0; i < str.length(); i++) {
            char ch = str.charAt(i);
            if (Character.isLowerCase(ch)) {
                result += Character.toUpperCase(ch);
            } else {
                result += Character.toLowerCase(ch);
            }
        }
        System.out.println(result);
    }
}
