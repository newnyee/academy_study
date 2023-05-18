package oop0320;

class School extends Object {
    String name = "학교";
    public School() {
        System.out.println("School()...");
    }
}

class MiddleSchool extends School {
    public MiddleSchool() {
        // 상속관계에서 부모생성자 호출 명령어
        super(); //생략가능
        System.out.println("MiddleSchool()...");
    }

    public void disp() {
        System.out.println(name);
    }
}
class HighSchool extends School {
    String name = "고등학교";
    public HighSchool() {
        // super(); 생략되어있음
        System.out.println("HighSchool()...");
    }

    public void disp() {
        String name = "강남 고등학교"; //출력시 우선순위 가장 높음 (지역변수)
        System.out.println(name); //강남 고등학교 -> 지역변수 name
        System.out.println(this.name); //고등학교 -> HighSchool 클래스의 멤버변수 name
        System.out.println(super.name); //학교 -> 부모클래스의 멤버변수 name
    }
}