package oop0314;

public class Test02_quiz {
    public static void main(String[] args) {
        //연습문제
        //문1)알파벳을 아래와 같이 한줄에 5개씩 출력하시오
        /*
            ABCDE
            FGHIJ
            KLMNO
            PQRST
            UVWXY
            Z
        */
        for(int i=1; i<=26; i++) {
            System.out.print((char)(64+i));
            if(i%5 ==0) {
                System.out.println();
            }
        }
        System.out.println();
        System.out.println("------------------------------------");


        //문2)아래와 같이 출력하시오
        /*
            ####
             ###
              ##
               #
        */
        for(int i=0; i<4; i++) {
            for(int j=0; j<4; j++) {
                if(i>j) {
                    System.out.print(" ");
                } else {
                    System.out.print("#");
                }
            }
            System.out.println();
        }
        System.out.println("------------------------------------");


        //문3)다음식의 결과값을 구하시오
        /*
               1   2   3   4   5      99
               ─ - ─ + ─ - ─ + ─ ...  ──   = 0.688172
               2   3   4   5   6      100
        */
        double result = 0;
        for(int i=1; i<100; i++) {
            if(i%2 != 0) {
                result += ((double)i/(i+1));
            } else {
                result -= ((double)i/(i+1));
            }
        }
        System.out.println(result);
        System.out.println("------------------------------------");


        //문4)아래와 같이 계산해서 출력하시오
        /*
             1+....+10=55
            11+....+20=155
            21+....+30=255

            81+....+90=
            91+....+100=955
        */
        int sum = 0;
        for(int i=1; i<=100; i++) {
            System.out.print(i);
            if(i%10 == 0) {
                sum +=i;
                System.out.println("=" + sum);
                sum=0;
            } else {
                System.out.print("+");
                sum += i;
            }
        }
        /*
        //다른 풀이
            int sum = 0;
            for(int a=10; a<=100; a+=10) {
                for(int b=a-9; b<=a; b++) {
                    sum+=b;
                }
                System.out.printf(%d + ... + %d = %d\n", (a-9), a, sum);
                sum=0;
            }
        */
        System.out.println("------------------------------------");


        //문5)어느 달팽이는 낮에는 3cm 올라가고, 밤에는 2.5cm 내려온다고 할때
        //   달팽이가 13cm의 나무 꼭대기에 올라가려면 며칠이 걸리는지 구하시오 (21일)
        int day = 0; //결과값
        double snail = 0.0; //달팽이
        while(true) {
            day++;
            snail += 3.0;
            if(snail>=13.0) {
                break;
            } else {
                snail -= 2.5;
            }
        }
        System.out.println(day + "일");
    }
}
