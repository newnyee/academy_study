package oop0321;

abstract class Travel { //추상클래스
    void view() {} //일반메소드
    abstract String travelWhere(); //추상메소드
}

class TypeA extends Travel {
    @Override
    String travelWhere() {
        return "제주도 올레길";
    }
}
class TypeB extends Travel {
    @Override
    String travelWhere() {
        return "여의도 벚꽃 축제";
    }
}
class TypeC extends Travel {
    @Override
    String travelWhere() {
        return "지리산 둘레길";
    }
}

public class Test02_abstract {
    public static void main(String[] args) {
        // 추상클래스와 다형성

        Travel tour = new TypeA();
        System.out.println(tour.travelWhere());
        tour = new TypeB();
        System.out.println(tour.travelWhere());
        tour = new TypeC();
        System.out.println(tour.travelWhere());
    }
}
