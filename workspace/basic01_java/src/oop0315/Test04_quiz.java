package oop0315;

public class Test04_quiz {
    public static double sd (int[] a) {
        int vSum = 0; // 값들의 합
        for(int i=0; i<a.length; i++) {
            vSum += a[i];
        }

        double aver = (double) vSum /a.length; // 값들의 평균

        double[] deviations = new double[a.length]; // 편차 : 값에서 값들의 평균을 뺀 절대값
        for(int i=0; i<a.length; i++) {
            deviations[i] = Math.abs(a[i]-aver);
        }

        double dSum = 0; // 편차들의 합
        for(int i=0; i<a.length; i++) {
            dSum += deviations[i];
        }

        return dSum/a.length; // 표준편차 : 편차들의 평균
    }

    public static void main(String[] args) {
        //문제) 표준편차(Standard deviation)구하기
        int[] values = {85, 90, 93, 86, 82};
        double result = sd(values);
        System.out.printf("표준편차 : %.2f", result);

        /*
            1) aver의 평균 (87.2)를 구하고, aver의 각 요소에서 87.2를 뺀다.
            85 -> -2.2
            90 -> +2.8
            93 -> +5.8
            86 -> -1.2
            82 -> -5.2

            2) 각 요소에서 평균을 뺀 값의 절대값을 구한다. -> 편차
            {2.2, 2.8, 5.8, 1.2, 5.2}

            3)편차들의 평균값 -> 표준편차
            (2.2 + 2.8 + 5.8 + 1.2 + 5.2)/5 -> 3.44

         */


    }
}
