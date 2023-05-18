package oop0314;

public class Test04_quiz {
    public static void main(String[] args) {
        char[] ch = { 'I', 't', 'W','i', 'l', 'l'};
        int size = ch.length; //6

        //문1) 대, 소문자의 갯수를 각각 구하시오
        int low = 0, up = 0;
        for(int i=0; i<size; i++) {
            if(ch[i]>='a' && ch[i]<='z') low++;
            else if (ch[i]>='A' && ch[i]<='Z') up++;
        }
        System.out.println("대문자: " + up + ", 소문자: " + low);
        System.out.println("----------------------");


        //문2) 대소문자를 서로 바꿔서 출력하시오
        for(int i=0; i<size; i++) {
            if(ch[i]>='a' && ch[i]<='z') {
                System.out.print((char)(ch[i] - 32));
            } else if (ch[i]>='A' && ch[i]<='Z') {
                System.out.print((char)(ch[i] + 32));
            }
        }
        System.out.println();
        System.out.println("----------------------");


        //문3) 모음의 갯수를 구하시오 AEIOU,aeiou
        char[] vowels = {'A','E','I','O','U','a','e','i','o','u'};
        int count = 0;
        for(int i=0; i<size; i++) {
            for(int j=0; j<vowels.length; j++) {
                if(ch[i] == vowels[j]) count++;
            }
        }
        System.out.println("모음의 갯수: " + count);
        System.out.println("----------------------");

        /*
            다른풀이
            모든 문자를 소문자 또는 대문자로 바꾼 후 갯수 구하기
        for(int i=0; i<size; i++) {
            char c=ch[i];
            if(c>='A' && c<='Z') {
                c = (char)(ch[i] + 32);
            }
            switch (c) {
                case 'a':
                case 'e':
                case 'i':
                case 'o':
                case 'u': count++;
            }
        }
        System.out.printf("\n모음의 갯수: %d\n", count);
        */


        //문4) 각행의 모음의 갯수를 구하시오
        count = 0;
        char[][] str = {
                {'Y','e','a','r'},
                {'M','o','n','t','h'},
                {'D','a','t','e'}
        };
        for(int i=0; i<str.length; i++) {
            for(int j=0; j<str[i].length; j++) {
                for(int a=0; a<vowels.length; a++) {
                    if(str[i][j] == vowels[a])  count++;
                }
            }
            System.out.printf("str[%d]행 : %d\n", i, count);
            count=0;
        }
        System.out.println("----------------------");


        //문5) 대각선 방향의 각 요소의 합을 구하시오
        int sum = 0;
        int[][] num = {
                {4,3,2},
                {5,9,1},
                {6,8,7}
        };
        for(int i=0; i<num.length; i++) {
            sum += num[i][i];
        }
        System.out.printf("대각선 (↘) 방향의 합 : %d\n", sum);

        sum = 0;
        for(int i=0; i<num.length; i++) {
            sum += num[i][num.length-1-i];
        }
        System.out.printf("대각선 (↙) 방향의 합 : %d\n", sum);
    }
}
