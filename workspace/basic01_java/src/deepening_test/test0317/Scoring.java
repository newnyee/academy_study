package deepening_test.test0317;

public class Scoring {
    private int stuNo; //번호
    private String stuName; //이름
    private int[] answer = new int[5]; //답안지 제출
    private char[] ox = new char[5]; //OX표시
    public int score; //점수
    public int rankNum; //등수


    //생성자
    public Scoring() {}

    public Scoring(int stuNo, String stuName, int a0, int a1, int a2, int a3, int a4) {
        this.stuNo = stuNo;
        this.stuName = stuName;
        this.answer[0] = a0;
        this.answer[1] = a1;
        this.answer[2] = a2;
        this.answer[3] = a3;
        this.answer[4] = a4;
    }

    //메소드
    public void compute(Scoring[] a) { // 채점 메소드
        //문제 정답 번호
        int[] dap = {3, 3, 3, 3, 3};

        //채점
        for(int j=0; j<a.length; j++) {
            for (int i = 0; i < dap.length; i++) {
                if (dap[i] == a[j].answer[i]) {
                    a[j].ox[i] = 'O';
                    a[j].score += 20; //정답이면 20점 추가
                } else {
                    a[j].ox[i] = 'X';
                }
            }
        }
    }

    public void disp(Scoring a) { // 출력 메소드
        System.out.print(" " + a.stuNo + "   ");
        System.out.print(a.stuName + "  ");
        System.out.print(a.ox[0] + "  ");
        System.out.print(a.ox[1] + "  ");
        System.out.print(a.ox[2] + "  ");
        System.out.print(a.ox[3] + "  ");
        System.out.print(a.ox[4] + "  ");
        System.out.print(a.score + "   ");
        System.out.print(a.rankNum + "   ");
        System.out.println();
    }

    public void rank(Scoring[] a) {

        compute(a); // 채점 메소드 사용

        for (int i=0; i<a.length-1; i++) { // 등수대로 정렬하기 : score로 배열 오름차순 정렬
            for(int j=i+1; j<a.length; j++) {
                if (a[i].score > a[j].score) {
                    Scoring b = a[i];
                    a[i] = a[j];
                    a[j] = b;
                }
            }
        }

        for(int i=0; i<a.length; i++) { // 등수 적용 : 정렬된 인덱스번호+1 을 해당객체 rankNum에 넣음
            a[i].rankNum = i+1;
        }

        for (int i=0; i<a.length-1; i++) { // score로 정렬된 배열을 stuNo로 재정렬
            for(int j=i+1; j<a.length; j++) {
                if (a[i].stuNo > a[j].stuNo) {
                    Scoring b = a[i];
                    a[i] = a[j];
                    a[j] = b;
                }
            }
        }

        for(int i=0; i<a.length; i++) { // 출력 메소드 이용하여 전체 출력
            disp(a[i]);
        }
    }
}
