package oop0320;

class Parent {
    int one, two;
    public Parent() {}
    public Parent(int one, int two) {
        this.one = one;
        this.two = two;
    }
}

class Child extends Parent {
    int three;
    public Child() {}

    public Child(int a, int b, int c) {
        // 부모클래스 멤버변수가 직접 접근이 가능한 경우
        // super.one = a;
        // super.two = b;

        // 부모클래스 멤버변수가 private 접근제한을 갖는 경우
        super(a, b); //생성자를 통해 접근
        this.three = c;
    }
}
