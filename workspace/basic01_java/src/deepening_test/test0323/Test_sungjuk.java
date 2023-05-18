package deepening_test.test0323;

import java.util.List;

public class Test_sungjuk {
    public static void main(String[] args) {
        // 문제) 성적프로그램
        // 성적 입력 자료(sungjuk.txt)를 가져와서, 성적 결과 파일 완성하기(result.txt)

        String fileIn = "d:/java202301/sungjuk.txt";
        String fileOut = "d:/java202301/result1.txt";

        /*
               성 / 적 / 결 /과
        -----------------------------------------------------------------------
            이름     국어   영어  수학   평균  등수   결과
        -----------------------------------------------------------------------
           라일락    100     100   100    100    1    합격   ********** 장학생
           진달래     50      55    60     55    4    불합격 *****
           개나리     95      95    35     75    3    재시험 *******
           무궁화     80      85    90     85    2    합격   *******

         */
            Sungjuk sungjuk = new Sungjuk();
            List<Sungjuk> list1 = sungjuk.getGrades(fileIn);
            sungjuk.makeRank(list1);
            sungjuk.display(list1, fileOut);
    }
}
