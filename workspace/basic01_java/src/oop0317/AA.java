package oop0317;
class AA {
    private void zero() {}
    public void one() {
        System.out.println("AA.one()...");
    }
    public void two() {
        System.out.println("AA.two()...");
    }
}

// 자식클래스 BB, 부모클래스 AA
class BB extends AA {
    public void three() {
        System.out.println("BB.three()...");
    }
}

class CC extends BB {
    public void four() {
        System.out.println("CC.four()...");
    }
}

/*
class DD {}
class EE extends AA, DD {} //클래스간의 상속은 단일상속만 가능
*/