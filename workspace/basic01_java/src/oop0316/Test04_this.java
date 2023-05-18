package oop0316;

public class Test04_this {
    public static void main(String[] args) {
        // this
        // 클래스가 자신을 가리키는 대명사
        // 일반 지역변수와 멤버변수를 구분하기 위함

        // Score one = new Score("오필승", 50, 60, 70);


        Score one = new Score();
        one.disp();

        Score two = new Score("김연아", 50, 60, 70);
        two.disp();

        Score three = new Score("무궁화", 10, 20, 30);
        three.disp();

        // 객체가 참조하고있는 주소
        System.out.println(one.hashCode());
        System.out.println(two.hashCode());
        System.out.println(three.hashCode());

        Score kim = new Score("봉선화", 10, 20, 30);
        Score lee = new Score("라일락", 40, 50, 60);
        Score park = new Score("진달래", 70, 80, 90);

//        변수 : 지역변수, 전역변수, 매개변수, 참조변수

        // 객체 배열
        Score[] score = {
                new Score("오필승", 11, 22, 33),
                new Score("코리아", 44, 55, 66),
                new Score("대한민국", 77, 88, 99)
        };
        /*
            +---------+---------+--------+
            |  #100   |  #200   |  #300  |
            +---------+---------+--------+
             score[0]   score[1]  score[2]
        */

        score[0].disp();
        score[1].disp();
        score[2].disp();

        int size = score.length;

        for(int i=0; i<size; i++) {
            score[i].disp();
        }

    }
}
