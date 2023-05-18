package oop0316;
class School {
    // 멤버변수 field, column, property, attribute
    private String name;
    private int kor, eng, mat;
    private int aver;

    // 생성자
    public School() {
         System.out.println("School() 호출함");
    }

    //생성자 오버로딩 (함수명 중복 정의)
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
        System.out.print(name + ", ");
        System.out.print(kor + ", ");
        System.out.print(eng + ", ");
        System.out.print(mat + ", ");
        System.out.print(aver);
    }
}
