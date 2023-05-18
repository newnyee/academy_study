package deepening_test.test0315;

public class StandardDeviation {
        // 표준편차를 구하는 원리에따라 코딩하기
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
}
