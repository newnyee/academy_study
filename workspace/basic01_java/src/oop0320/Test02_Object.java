package oop0320;
import java.lang.*; //기본 패키지이기때문에 생략가능

class Jeju extends Object {
    @Override
    public String toString() {
        return "제주도";
    }
}
class Suwon extends Object {
    private String id = "itwill";
    private String pw = "1234";

    @Override
    public String toString() {
        return "Suwon [id = " + id + "], [pw = " + pw + "]";
    }
}
class Incheon extends Object {
    private String name = "인천 광역시";
    private String phone = "789-8745";

    @Override
    public String toString() {
        return "Incheon{" +
                "name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }

}

class Seoul {}

public class Test02_Object extends Object { //extends Object 생략가능
    public static void main(String[] args) {
        // Object 클래스
        /*
            자바의 최고 조상 클래스 : Object 클래스
            자바의 기본 패키지 (java.lang)에 선언되어 있음
            자바의 모든 클래스는 무조건 Object 클래스를 상속 받는다
            자바의 모든 클래스는 Object 클래스의 후손들이다
         */

        Jeju je = new Jeju();
        System.out.println(je.toString());
        Suwon su = new Suwon();
        System.out.println(su.toString());
        Incheon in = new Incheon();
        System.out.println(in.toString());

        // 메소드 이름 toString() 생략 가능
        System.out.println(je);
        System.out.println(su);
        System.out.println(in);

        Seoul se = new Seoul();
        System.out.println(se);
        // oop0320.Seoul@15aeb7ab
        // toString() -> 오버라이딩 하지 않았을 경우, 객체의 문자정보 리턴
        // 패키지명.클래스명@해시코드

        se=null;
        System.out.println(se);
    }
}
