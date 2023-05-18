package oop0322;

class MyThread2 extends Thread {
    // 클래스가 클래스를 상속받는 경우, 단일상속만 가능하다

    private int num;
    private String name;

    public MyThread2() {}
    public MyThread2(int num, String name) {
        this.num = num;
        this.name = name;
    }

    // start() 메소드는 run() 메소드를 호출하는 기능
    @Override
    public void run() {
        for (int a = 0; a < num; a++) {
            System.out.println(name + " : " + a);
        }
    }
}
public class Test06_thread {
    public static void main(String[] args) {
        // 2) 쓰레드를 사용한 경우
        // JVM이 쓰레드 관리자에 등록하고, start() 메소드가 run() 을 호출한다
        // 예) 채팅, 실시간 예매등에 많이 사용

        MyThread2 t1 = new MyThread2(1000, "★");
        MyThread2 t2 = new MyThread2(1000, "★★");
        MyThread2 t3 = new MyThread2(1000, "★★★");

        t1.start();
        t2.start();
        t3.start();

    }
}
