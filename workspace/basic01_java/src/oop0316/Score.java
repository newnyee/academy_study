package oop0316;

public class Score {
    // 멤버변수
    private String name = "손흥민";
    private int kor, eng, mat;
    private int aver;


    // 생성자
    // 생성자를 오버로딩 하면 기본생성자 함수는 자동으로 생성되지 않음
    // 생성자를 개발자가 직접 작성하면 기본생성자는 생성되지 않음
    // 추천사항 -> 기본생성자는 수동으로 생성하는것이 좋음
    public Score() {}

    public Score(String name, int kor, int eng, int mat) {
        // name -> 지역변수가 우선되기 때문에 this를 통해 멤버변수임을 선언함
        this.name = name;
        this.kor = kor;
        this.eng = eng;
        this.mat = mat;
        this.aver = (kor+eng+mat)/3;
    }


    // 메소드
    public void disp() {
        String name = "박지성";
        System.out.println(name); // 박지성
        System.out.println(this.name);
        System.out.println(this.kor);
        System.out.println(this.eng);
        System.out.println(this.mat);
        System.out.println(this.aver);

    }
}
