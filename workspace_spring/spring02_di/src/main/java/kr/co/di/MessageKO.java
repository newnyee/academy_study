package kr.co.di;

public class MessageKO implements IHello {

    // 클래스의 클래스 확장 : extends - 한개의 클래스만 확장 가능
    // 클래스의 인터페이스 확장 : implements - 여러개의 인터페이스 확장 가능
    // 인터페이스의 인터페이스 확장 : extends - 여러개의 인터페이스 확장 가능
    public MessageKO() {
        System.out.println("MessageKO 호출");
    }

    @Override
    public void sayHello(String name) {
        System.out.println("안녕하세요 " + name + "님!");
    }
}
