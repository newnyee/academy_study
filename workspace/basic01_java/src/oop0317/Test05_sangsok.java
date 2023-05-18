package oop0317;

public class Test05_sangsok {
    public static void main(String[] args) {
        // 상속 Inheritance
        /*
            - 코드의 재사용성
            - 상속을 하면 부모와 자식, 조상과 후손, super 와 sub 의 관계가 성립됨
            - super 키워드 사용
            - extends 확장(상속), implements 구현(인터페이스)
            - 형식) 자식 extends 부모 {}
         */

        // AA클래스 생성하고 실습
        AA aa = new AA();
        aa.one();
        aa.two();
        // aa.zero(); 에러, private 속성은 클래스 내부에서만 접근 가능하다
        System.out.println("------------------");

        BB bb = new BB();
        bb.three(); // BB 클래스의 메소드
        bb.one();   // AA 클래스의 메소드
        bb.two();   // AA 클래스의 메소드
        System.out.println("------------------");

        CC cc = new CC();
        cc.four();  // CC 클래스의 메소드
        cc.three(); // BB 클래스의 메소드
        cc.two();   // AA 클래스의 메소드
        cc.one();   // AA 클래스의 메소드
    }
}
