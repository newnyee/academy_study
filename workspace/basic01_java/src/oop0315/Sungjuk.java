package oop0315;

class Sungjuk {
    // 접근제한자 생략 -> default 접근제한을 갖음
    // class 명의 첫 글자는 대문자로 한다
    // class 내부의 멤버들 간에는 접근제한자와 상관없이 접근 가능하다

    //멤버 변수 field
    public String name; //public
    int kor, eng, mat; //default
    private int aver; //멤버변수는 대부분 private로 지정

    //메소드 method
    private void view() {
        System.out.println(aver);
    } //private
    void calc() {
        //default
        aver=(kor+eng+mat)/3;
        view();
    }
    public void disp() {
    //메소드는 대부분 public 으로 지정
        System.out.println(name);
        System.out.println(kor);
        System.out.println(eng);
        System.out.println(mat);
        System.out.println(aver);
    }

}
