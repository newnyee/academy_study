package oop0320;

public class Test05_super {
    public static void main(String[] args) {
        // super, super()와 this, this() 활용한 클래스 설계
        // Parent 클래스 생성 후 실습

        Child child = new Child(10, 20, 30);
        System.out.println(child.three);
        System.out.println(child.two);
        System.out.println(child.one);
    }
}
