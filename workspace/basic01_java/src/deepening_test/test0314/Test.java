package deepening_test.test0314;

import java.util.Arrays;
import java.util.Scanner;

public class Test {
    /*
    아래와 같이 출력하는 코드를 작성하시오

------------------------------------------------------
1.학생수 | 2.점수입력 | 3.점수리스트 | 4.분석 | 5.종료
------------------------------------------------------
선택>1
학생수>3
------------------------------------------------------
1.학생수 | 2.점수입력 | 3.점수리스트 | 4.분석 | 5.종료
------------------------------------------------------
scores[0]: 85
scores[1]: 95
scores[2]: 93
------------------------------------------------------
1.학생수 | 2.점수입력 | 3.점수리스트 | 4.분석 | 5.종료
------------------------------------------------------
선택>3
scores[0]: 85
scores[1]: 95
scores[2]: 93
------------------------------------------------------
1.학생수 | 2.점수입력 | 3.점수리스트 | 4.분석 | 5.종료
------------------------------------------------------
선택>4
최고 점수: 95
평균 점수: 91.0
------------------------------------------------------
1.학생수 | 2.점수입력 | 3.점수리스트 | 4.분석 | 5.종료
------------------------------------------------------
선택>5
프로그램 종료

*/
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int stuNum = 0;
        boolean run = true;
        int[] scores = null;

        while (run) {
            System.out.println("------------------------------------------------------");
            System.out.println("1.학생수 | 2.점수입력 | 3.점수리스트 | 4.분석 | 5.종료");
            System.out.println("------------------------------------------------------");
            System.out.print("선택>");
            String num = scanner.nextLine();

            if(num.equals("1")) {
                System.out.print("학생수>");
                stuNum = Integer.parseInt(scanner.nextLine());

            } else if (num.equals("2")) {
                scores = new int[stuNum];
                for(int i=0; i<stuNum; i++) {
                    System.out.print("scores[" + i + "]: ");
                    scores[i] = Integer.parseInt(scanner.nextLine());
                }

            } else if (num.equals("3")) {
                for(int i=0; i<stuNum; i++) {
                    System.out.println("scores[" + i + "]: " + scores[i]);
                }

            } else if (num.equals("4")) {
                Arrays.sort(scores);
                int sum = 0;
                System.out.println("최고 점수: " + scores[stuNum-1]);
                for(int i=0; i<stuNum; i++) {
                    sum += scores[i];
                }
                double aver = (double)sum/stuNum;
                System.out.println("평균 점수: " + aver);

            } else if (num.equals("5")) {
                System.out.println("프로그램 종료");
                run = false;
            }
        }
    }
}
