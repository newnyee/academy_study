package oop0321;

public class Test03_interface {
    public static void main(String[] args) {
        // 인터페이스 interface
        /*
             추상메소드만 구성되어 있다
             추상클래스보다 더 추상화 되어있다
             상속 : extends 확장, implement 구현
         */

        // 인터페이스 Creature 생성 후 실습
        // 인터페이스에서의 다형성
        Creature creature = new Tiger();
        creature.kind();
        creature.breathe();

        creature = new Salmon();
        creature.kind();
        creature.breathe();
    }
}
