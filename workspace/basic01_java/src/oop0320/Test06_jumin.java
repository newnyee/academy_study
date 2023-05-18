package oop0320;

public class Test06_jumin {
    public static void main(String[] args) {
        // 문제) 주민번호 유효성 검사
        // Jumin 클래스 생성하여 실습

        Jumin id = new Jumin("8912301234567");
        if (id.validate()) {
            System.out.println("올바른 주민번호입니다");
            id.disp();
        } else {
            System.out.println("올바른 주민번호 형식이 아닙니다");
        }
    }
}
