package oop0313;

public class Test06_quiz {
    public static void main(String[] args) {
        //연습문제
        //참조 : 지폐갯수 구하는 문제
        /*
            1년 : 365.2422일
            출력결과 : 365일

            1분 : 60초
            1시간 : 60분 * 60초 = 3600초
            1일 : 24시간 * 3600초 = 86400초
            1년 : 365.2422 * 86400 = 31556926초
        */

        double year = 365.2422;
        int d = (int)year; // 일
        int h = (int)((year%365)*24); // 시간
        int m = (int)(((year%365)*24)%h*60); // 분
        int s = (int)(((((year%365)*24)%h*60)%m)*60); //초

        System.out.println(d + "일");
        System.out.println(h + "시간");
        System.out.println(m + "분");
        System.out.println(s + "초");


        int total = (int)(year*86400); //31556926

        int day = total/86400;
        System.out.println(day + "일");

        total = total%86400;
        int hour = total/3600;
        System.out.println(hour + "시간");

        total = total%3600;
        int minute = total/60;
        System.out.println(minute + "분");

        int second = total%60;
        System.out.println(second + "초");










        int money = 54320;
        int man = money/10000;
        int chun = (money%10000)/1000;
        int beak = (money%1000)/100;
        int sib = (money%100)/10;

        System.out.println("만원 : " + man + "장");
        System.out.println("천원 : " + chun + "장");
        System.out.println("백원 : " + beak + "개");
        System.out.println("십원 : " + sib + "개");
    }
}
