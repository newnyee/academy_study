package oop0315;

class School {
    // 멤버변수 field
    private String name;
    private int kor, eng, mat;
    private int aver;

    // 생성자
    public School() {
        // 기본 생성자
        // default constructor
        // 개발자가 생성자를 따로 선언하지 않았을 경우 자동생성됨
        // -> 생성자 자동 생성 : 클래스의 접근제한자를 따라감
        // 리턴형이 없다 (void, 리턴타입 없음)
    }

    public School(String name, int kor, int eng, int mat) {
        this.name = name;
        this.kor = kor;
        this.eng = eng;
        this.mat = mat;

    }

    //메소드
    public void calc() {
        aver = (kor+eng+mat)/3;
        System.out.println(aver);
    }
    public void disp() {
        System.out.print(name);
        System.out.print(kor);
        System.out.print(eng);
        System.out.print(mat);
        System.out.print(aver);
    }
}
