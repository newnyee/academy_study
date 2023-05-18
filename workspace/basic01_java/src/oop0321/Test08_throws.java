package oop0321;

class Test {
    // 1) 각각의 try ~ catch를 직접 이용한 예외처리
    /*
    public void view() {
        try {
            int a = 3/0;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void disp() {
        try {
            int a = Integer.parseInt("KOREA");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
     */

    // 2) throws를 이용한 예외처리
    public void view() throws Exception {
        int a = 3/0;
    }

    public void disp() throws Exception {
        int a = Integer.parseInt("KOREA");
    }

    // OS가 개입해서 문제가 발생하지 않도록 조정하는 기법
    public synchronized void login() {}

}

public class Test08_throws {
    public static void main(String[] args) {
        // throws문
        // 메소드 호출시 예외처리를 한꺼번에 모아서 처리
        try {
            Test test = new Test();
            test.view(); //ArithmeticException
            test.disp(); //NumberFormatException
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
