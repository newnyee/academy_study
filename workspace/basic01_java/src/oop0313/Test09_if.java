package oop0313;

public class Test09_if {
    public static void main(String[] args) {
        // 조건문 관련 연습

        //if 조건문
        // 문1) 임의의 문자가 대문자, 소문자, 기타인지 구분해서 출력하시오
        char ch = 'R';
        if(ch>='A' && ch<='Z') {
            System.out.printf("%c : 대문자\n", ch);
        } else if (ch>='a' && ch<='z') {
            System.out.printf("%c : 소문자\n", ch);
        } else {
            System.out.printf("%c : 기타\n", ch);
        }

        // 문2) 대문자는 소문자로, 소문자는 대문자로 서로 바꿔서 출력하시오
        // 나머지 기호는 그대로 출력
        char ch1 = ch;
        if(ch>='A' && ch<='Z') {
            ch1 = (char)((int)ch+32);
            System.out.printf("%c -> %c\n", ch, ch1);
        } else if (ch>='a' && ch<='z') {
            ch1 = (char)((int)ch-32);
            System.out.printf("%c -> %c\n", ch, ch1);
        } else {
            System.out.println(ch);
        }

        // switch~case 문
        // 문3) 평균점수에 따라서 A, B, C, D, F 학점을 출력하시오
        int kor = 100, eng=100, mat=100;
        int aver = (kor+eng+mat)/3;
        String score = "";
        switch (aver/10) {
            case 10:
            case 9:
                score = "A";
                break;
            case 8:
                score = "B";
                break;
            case 7:
                score = "C";
                break;
            case 6:
                score = "D";
                break;
            default:
                score = "F";
        }
        System.out.println(score + "학점");
    }

}
