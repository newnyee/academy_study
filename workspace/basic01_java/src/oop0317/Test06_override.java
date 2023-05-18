package oop0317;

public class Test06_override {
    public static void main(String[] args) {
        // Method Override 메소드 재정의
        // 상속관계에서 물려받은 메소드를 다시 수정(리폼)

        // Korea 클래스 생성 후 실습

        //1)오버라이드 하기 전
        Seoul se = new Seoul();
        se.view();
        se.disp();

        //2)오버라이드 한 후
        Busan bu = new Busan();
        bu.view(); //final 메소드는 상속은 가능하지만 오버라이딩은 할 수 없다.
        bu.disp();

    }
}
