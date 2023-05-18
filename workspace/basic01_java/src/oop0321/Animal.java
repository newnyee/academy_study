package oop0321;

abstract class Animal { //추상클래스
    String name;
    void view() {} //일반메소드
    abstract void disp(); //추상메소드(미완성)
}

// 추상클래스는 부모역할만 주로 한다
// 추상클래스를 상속받은 자식클래스는 반드시 추상메소드를 완성해야 한다(override)
class Elephant extends Animal {
    public Elephant() {}

    @Override
    void disp() {
        System.out.println("점보");
    }
}
class Tuna extends Animal {
    public Tuna() {}

    @Override
    void disp() {
        System.out.println("니모");
    }
}