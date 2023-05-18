package oop0321;

interface Creature {
    // package-private 접근제한자는 사용불가
    public abstract void kind(); //추상메소드만 가능하다
    void breathe(); // public abstract 생략가능
}

class Tiger implements Creature {
    @Override
    public void kind() {
        System.out.println("포유류");
    }

    @Override
    public void breathe() {
        System.out.println("허파");
    }
}

class Salmon implements Creature{
    @Override
    public void kind() {
        System.out.println("어류");
    }

    @Override
    public void breathe() {
        System.out.println("아가미");
    }
}