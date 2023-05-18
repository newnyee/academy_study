package oop0317;

class Sunhjuk {
    private String name;
    private int kor, eng, mat;
    private int aver;

    // 기본 생성자 default constructor
    public Sunhjuk() {
        // 생성자도 자신의 다른 생성자를 호출할 수 있다
        // sungjuk("손흥민"); 에러남
        this("손흥민");
    }

    public Sunhjuk(String name) {
        this.name = name; //this.멤버변수 = 매개변수
    }

    public Sunhjuk(int kor, int eng, int mat) {
        this("박지성");
        this.kor = kor;
        this.eng = eng;
        this.mat = mat;
        // this("박지성"); 에러 → this() 함수는 생성자 내부의 첫줄에서 호출해야함
    }

    public Sunhjuk(int aver) {
        disp(); //생성자에서 일반 메소드 호출 가능하다
    }

    public static void disp() {
        // this(85); 에러 → 생성자 안에서만 사용가능
    }


}
public class Test03_this {
    public static void main(String[] args) {
        // this()
        // 자신의 생성자를 호출할 때 사용


    }
}
