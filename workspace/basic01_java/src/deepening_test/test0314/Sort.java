package deepening_test.test0314;

public class Sort {
    public static void main(String[] args) {
        // 선택정렬(selection sort) 알고리즘에따라 코딩하기
        int[] num1 = {9, 8, 7, 6, 5}; //오름차순 정렬하기
        for(int i=0; i<num1.length-1; i++) {
            for(int j=i+1; j<num1.length; j++) {
                if(num1[i]>num1[j]) {
                    int temp = num1[i];
                    num1[i] = num1[j];
                    num1[j] = temp;
                }
            }
        }


        // 버블정렬(bubble sort) 알고리즘에따라 코딩하기
        int[] num2 = {9, 8, 7, 6, 5}; //오름차순 정렬하기
        for(int i=0; i<num2.length; i++) {
            for(int j=1; j<num2.length-i; j++) {
                if(num2[j-1]>num2[j]) {
                    int temp = num2[j-1];
                    num2[j-1] = num2[j];
                    num2[j] = temp;
                }
            }
        }


    }
}
