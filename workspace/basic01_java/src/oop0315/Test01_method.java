package oop0315;

public class Test01_method {
    public static int test1 (int a, int b) {
        int c = a + b;
        return c; // 리턴값은 1개만 리턴할 수 있다
        // return; 리턴값이 없다(void)
        // return c; 리턴값이 있다
        // 리턴값은 1개만 리턴할 수 있다
        // 리턴값이 있는 경우 리턴값의 자료형을 void자리에 쓴다
    }

    public static String test2 (int a) {
        if(a%2 == 0) {
            return  "짝수";
        } else {
            return  "홀수";
        }
    }

    public static boolean test3 (int a) {
        if (a % 4 == 0 && a % 100 != 0 || a % 400 == 0) {
            return true;
        } else {
            return false;
        }
    }

    public static long test4 (int a) {
        long mult = 1;
        for(int i=a; i>=1; i--) {
            mult *= i;
        }
        return mult;
    }

    public static long fact (int n) {
        if(n==0) {
            return 1;
        } else {
            return n*fact(n-1);
        }
    }


    public static void main(String[] args) {
        // 2. 리턴값이 있는 메소드
        System.out.println(Math.abs(-3)); // 리턴값 3
        System.out.println(Math.max(5, 7)); // 리턴값 7

        int result = test1(2, 4);
        System.out.println(result);

        //값 : 상수값, 변수값, 리턴값
        System.out.println(test1(5,6));

        //짝수, 홀수 출력하기
        String str = test2(7);
        System.out.println(str);

        //윤년확인하기
        if(test3(2023)) {
            System.out.println("윤년");
        } else {
            System.out.println("평년");
        }

        //팩토리얼 구하기
        long f = test4(5);
        System.out.println(f);

        //3. 재귀적 함수 호출
        //팩토리얼값 구하기
        System.out.println(fact(7));
    }
}
