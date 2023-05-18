package oop0316;

import java.util.StringTokenizer;

public class Test02_String {
    public static void main(String[] args) {
        // 문자열 관련 클래스

        String str = "HAPPY";
        String name = new String("HAPPY");
        if(str == name) {
            System.out.println("같다");
        } else {
            System.out.println("다르다");
        }

        // 문자열의 내용을 비교하는 경우 == 연산자 사용하지 않고 equals() 메소드를 사용할 것
        if(str.equals(name)) {
            System.out.println("같다");
        } else {
            System.out.println("다르다");
        }

        // 문자열의 갯수가 0인지 확인하는 메소드
        if(str.isEmpty()) {
            System.out.println("빈문자열");
        } else {
            System.out.println("빈문자열이 아님");
        }

        // 특정 문자를 기준으로 문자열 분리하기 (split)
        str = new String("Gone With The Wind");
        String[] words = str.split(" "); // 단어와 단어사이를 공백으로 분리시켜서 배열의 형태로 저장함
        for(int i=0; i< words.length; i++) {
            System.out.println(words[i]);
        }

        // 특정 문자를 기준으로 문자열 분리하기 (StringTokenizer)
        StringTokenizer st = new StringTokenizer(str, " "); // 저장되는 방법 알아보기
        while(st.hasMoreElements()) { //토큰할 문자가 있는지 확인
            System.out.println(st.nextToken()); // sr.nextToken -> String 타입으로 토큰할 문자열 리턴
        }

        // 문자열 연산 속도
        // String < StringBuffer < StringBuilder

        // Strign 연산
        String s1 = "";
        System.out.println(s1.length());

        s1 = s1 + "SEOUL";
        System.out.println(s1.length());

        s1 = s1 + "JEJU";
        System.out.println(s1.length());

        s1 = s1 + "BUSAN";
        System.out.println(s1.length());

        System.out.println(s1);

        // 모든 문자열 지우기(빈 문자열 대입)
        s1 = "";
        System.out.println(s1.length());
        System.out.println("#" + s1 + "#");


        // StringBuilder 의 연산
        StringBuilder s2 = new StringBuilder();
        s2.append("SEOUL");
        System.out.println(s2.length());

        s2.append("JEJU");
        System.out.println(s2.length());

        s2.append("BUSAN");
        System.out.println(s2.length());

        System.out.println(s2);


        // 모든 문자열 지우기
        s2.delete(0, s2.length());
        System.out.println(s2.length()); //0

        // StringBuffer 의 연산
        StringBuffer s3 = null;
        //NullPoinerException 발생
        System.out.println(s3.length());


    }
}
