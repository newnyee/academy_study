package oop0317;

public class Korea {
    String name = "대한민국";

    final void view() {
        System.out.println("Korea.view()...");
    }

    void disp() {
        System.out.println("Korea disp()..." + name);
    }
}

class Seoul extends Korea {}

class Busan extends Korea {
    String name = "부산광역시";

    @Override // annotation
    void disp() {
        System.out.println("Busan.disp()..." + name);
    }

    /*
    @Override
    void view() {} // 에러, final 메소드는 더이상 오버라이딩할 수 없다
     */


}
