package oop0321;

interface IMessage {
    public void msgPrint(); //추상메소드
}

class Message implements IMessage {
    @Override
    public void msgPrint() {
        System.out.println("Message 클래스");
    }
}

public class Test05_anonymous {
    public static void main(String[] args) {
        // 익명 내부 객체 Anonymous class

        // 인터페이스는 직접 객체 생성성할 수 없다
        // IMessage msg = new IMessage(); //에러

        // 1) 구현 클래스 사용
        Message msg = new Message();
        msg.msgPrint();

        // 2) 다형성 활용
        IMessage imsg = new Message();
        imsg.msgPrint();

        // 3) 익명 객체 사용
        // 필요한 곳에서 일시적으로 생성
        // 이벤트가 발생할 때만 실행
        // 모바일 응용 앱, JavaScript, jQuery 등에서 많이 사용
        // 예) $("button").click(){}
        IMessage imsg1 = new IMessage() {
            @Override
            public void msgPrint() {
                System.out.println("익명 내부 객체");
            }
        };
        imsg1.msgPrint();
        System.out.println(imsg1);
    }
}
