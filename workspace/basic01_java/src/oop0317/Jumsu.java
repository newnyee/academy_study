package oop0317;

import java.util.Scanner;

public class Jumsu {
    //멤버 변수 field
    private int stuNo; //번호
    private String stuName; //이름
    private int[] answer = new int[5]; //답안지 제출
    private char[] ox = new char[5]; //OX표시
    public int score; //점수
    public int rank; //등수


    //생성자
    public Jumsu() {}

    public Jumsu(int stuNo, String stuName, int a0, int a1, int a2, int a3, int a4) {
        this.stuNo = stuNo;
        this.stuName = stuName;
        this.answer[0] = a0;
        this.answer[1] = a1;
        this.answer[2] = a2;
        this.answer[3] = a3;
        this.answer[4] = a4;
        this.rank = 1;
    }

    //메소드
    public void compute() {
        //정답
        int[] dap = {3, 3, 3, 3, 3};

        //채점
            for (int i = 0; i < dap.length; i++) {
                if (dap[i] == answer[i]) {
                    ox[i] = 'O';
                    score += 20; //정답이면 20점 추가
                } else {
                    ox[i] = 'X';
                }
            }
    }

    public void disp() {
        System.out.print(" " +stuNo + "   ");
        System.out.print(stuName + "  ");
        System.out.print(ox[0] + "  ");
        System.out.print(ox[1] + "  ");
        System.out.print(ox[2] + "  ");
        System.out.print(ox[3] + "  ");
        System.out.print(ox[4] + "  ");
        System.out.print(score + "   ");
        System.out.print(rank + "   ");
        System.out.println();
    }
}
