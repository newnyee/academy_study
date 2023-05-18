package deepening_test.test0317;

public class StudentsGrades {
    public static void main(String[] args) {
        // 문제) 성적프로그램 OX 표시하기
        // Scoring 클래스 생성 후 실행 (학원에서 설정해준 기본 포멧)
        /*
			            ** 시험결과 **
			======================================
			번호  이름   1  2  3  4  5  점수  등수
			--------------------------------------
			 1   홍길동  O  X  O  O  O   80    2
			 2   무궁화  O  O  O  O  O  100    1
			 3   라일락  X  X  X  X  O   20    5
			 4   진달래  X  O  X  O  O   60    3
			 5   봉선화  O  O  X  X  X   40    4
			--------------------------------------

			- 맞은문제 O, 틀린문제 X표시
			- 점수: O당 20점씩
			- 등수: 점수를 기준으로 높은사람이 1등
		*/
        // 5명의 성적 구하기 (학원에서 설정해준 기본 포멧)
        Scoring[] student = {
                new Scoring(1, "홍길동", 3, 4, 3, 3, 3),
                new Scoring(3, "무궁화", 3, 3, 3, 3, 3),
                new Scoring(4, "라일락", 1, 2, 4, 4, 3),
                new Scoring(2, "진달래", 2, 3, 1, 3, 3),
                new Scoring(5, "봉선화", 3, 3, 4, 1, 1)
        };

        System.out.println("            ** 시험결과 **");
        System.out.println("======================================");
        System.out.println("번호  이름   1  2  3  4  5  점수  등수");
        System.out.println("--------------------------------------");
        new Scoring().rank(student);
        System.out.println("--------------------------------------");
    }
}
