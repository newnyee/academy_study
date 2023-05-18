package kr.co.di;

public class HelloPOJO {
    public static void main(String[] args) {

        IHello hello = null;

        hello = new MessageKO(); //POJO 방식의 객체 생성
        hello.sayHello("손흥민");

    }
}
