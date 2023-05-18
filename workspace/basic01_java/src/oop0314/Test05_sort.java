package oop0314;

import java.util.Arrays;

public class Test05_sort {
    public static void main(String[] args) {
        //정렬 Sort
        /*
            - 정렬 유형: 오름차순과 내림차순
            - 정렬 방식
              삽입정렬 insertion sort
              선택정렬 selection sort
              버블정렬 bubble sort


            - selection sort 알고리즘
            9 8 7 6 5 -> 오름차순 정렬
            0인덱스 값과 0보다 큰 인덱스의 값 비교
            0 - 1 인덱스 비교 -> 8 9 7 6 5
            0 - 2 인덱스 비교 -> 7 9 8 6 5
            0 - 3 인덱스 비교 -> 6 9 8 7 5
            0 - 4 인덱스 비교 -> 5 9 8 7 6

            1인덱스 값과 1보다 큰 인덱스의 값 비교
            1 - 2 인덱스 비교 -> 5 8 9 7 6
            1 - 3 인덱스 비교 -> 5 7 9 8 6
            1 - 4 인덱스 비교 -> 5 6 9 8 7

            2인덱스 값과 2보다 큰 인덱스의 값 비교
            2 - 3 인덱스 비교 -> 5 6 8 9 7
            2 - 4 인덱스 비교 -> 5 6 7 9 8

            3인덱스 값과 3보다 큰 인덱스의 값 비교
            3 - 4 인덱스 비교 -> 5 6 7 8 9
           */
        int[] num = {9, 8, 7, 6, 5};
        for(int i=0; i<num.length-1; i++) {
            for(int j=i+1; j<num.length; j++) {
                if(num[i]>num[j]) {
                    int temp = num[i];
                    num[i] = num[j];
                    num[j] = temp;
                }
            }
        }
        for(int i=0; i<num.length; i++) {
            System.out.print(num[i] + " ");
        }
        System.out.println();

           /*
            - bubble sort 알고리즘
            9 8 7 6 5 -> 오름차순 정렬
            0 - 1 인덱스 비교 -> 1 - 2 인덱스 비교 -> 2 - 3 인덱스 비교 -> 3 - 4 인덱스 비교
            sort 안됐을시 위의 과정 반복

            cycle-1
            0 - 1 인덱스 비교 -> 8 9 7 6 5
            2 - 3 인덱스 비교 -> 8 7 6 9 5
            1 - 2 인덱스 비교 -> 8 7 9 6 5
            3 - 4 인덱스 비교 -> 8 7 6 5 9

            cycle-2
            0 - 1 인덱스 비교 -> 7 8 6 5 9
            1 - 2 인덱스 비교 -> 7 6 8 5 9
            2 - 3 인덱스 비교 -> 7 6 5 8 9

            cycle-3
            0 - 1 인덱스 비교 -> 6 7 5 8 9
            1 - 2 인덱스 비교 -> 6 5 7 8 9

            cycle-4
            0 - 1 인덱스 비교 -> 5 6 7 8 9
         */
        for(int i=0; i<num.length; i++) {
            for(int j=1; j<num.length-i; j++) {
                if(num[j-1]>num[j]) {
                    int temp = num[j-1];
                    num[j-1] = num[j];
                    num[j] = temp;
                }
            }
        }
        for(int i=0; i<num.length; i++) {
            System.out.print(num[i] + " ");
        }
        System.out.println();


        int[] su = {9, 8, 7, 6, 5};
        Arrays.sort(su);
        for(int i=0; i<su.length; i++) {
            System.out.print(su[i] + " ");
        }
    }
}
