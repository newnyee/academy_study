package deepening_test.test0320;

import java.time.LocalDate;
import java.util.Scanner;

public class Validation {
    private String juminNo; //주민번호

    public Validation() {}

    public void validate() {
        boolean run = true;

        while (run) {
            String num = "234567892345";

            Scanner scanner = new Scanner(System.in); //주민번호 입력받기
            System.out.println("주민번호를 입력해주세요('-' 기호 제외)");
            System.out.print(">");
            juminNo = scanner.nextLine(); //입력받은 주민번호를 멤버변수에 저장
            System.out.println();


            // 총 13자리의 주민번호를 마지막 자리를 제외한 각 자리에 정해진 숫자를 곱해서
            // 그 값을 11로 나눈 나머지 값을 11에서 뺀 값이 주민번호의 마지막 번호인
            // 오류검증 번호와 같으면 해당 주민번호는 올바른 주민번호 입니다.
            int sum = 0;
            for (int i = 0; i < num.length(); i++) {
                sum += Character.getNumericValue(num.charAt(i)) * Character.getNumericValue(juminNo.charAt(i));
            }
            int lastNum = 11 - sum % 11;


            // 마지막 번호 비교
            if (lastNum == Character.getNumericValue(juminNo.charAt(juminNo.length() - 1))) {
                System.out.println("올바른 주민번호입니다");
                disp();
                run = false; //while문 종료
            } else {
                System.out.println("올바른 주민번호 형식이 아닙니다");
                juminNo = ""; //다시 주민번호 입력받기 (while문)
                System.out.println();
            }
        }
    }

    public void disp() {
        // 문) 생년월일, 성별, 나이, 띠 출력
        /*
            생년월일 : 1989년 12월 30일
            성별     : 남자
            나이     : 34
            띠       : 태어난 년도%12 -> (0원숭이 1닭 2개... 11양)
         */
        LocalDate now = LocalDate.now();
        String[] animals = {"원숭이", "닭", "개", "돼지", "쥐", "소", "호랑이", "토끼", "용", "뱀", "말", "양"}; //띠 계산에 사용
        int year = 0;
        String sex = "";
        int age = 0;


        if(juminNo.charAt(6) == '1' || juminNo.charAt(6) == '2') { //1900년대생인지 확인
            year = Integer.parseInt(19 + juminNo.substring(0, 2)); //연도 포멧 4자리로 변경(19xx)
            if (juminNo.charAt(6) == '1') { //성별확인
                sex = "남자";
            } else {
                sex = "여자";
            }
        } else if (juminNo.charAt(6) == '3' || juminNo.charAt(6) == '4') { //2000년대생인지 확인
            year = Integer.parseInt(20 + juminNo.substring(0,2)); //연도 포멧 4자리로 변경(20xx)
            if (juminNo.charAt(6) == '3') { //성별확인
                sex = "남자";
            } else {
                sex = "여자";
            }
        }
        age = now.getYear()-year; //나이 계산

        System.out.println("생년월일 : " + year + "년 " + juminNo.substring(2,4) + "월 " + juminNo.substring(4,6) + "일");
        System.out.println("성별     : " + sex);
        System.out.println("나이     : " + age);
        System.out.println("띠       : " + animals[year%12]);
    }
}

