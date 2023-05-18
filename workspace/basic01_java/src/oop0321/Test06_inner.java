package oop0321;

public class Test06_inner {
    public static void main(String[] args) {
        // 내부클래스 inner class
        // 클래스 내부에 선언된 클래스

        // WebProgram클래스 생성후 실습

        WebProgram web = new WebProgram();
        web.print();

        // 내부 클래스는 직접 접근할 수 없음
        // Language language = new Language(); //에러
        // Smart smart = new Smart(); //에러

        // 내부클래스는 외부에서 단계적으로 접근할 수 있다
        WebProgram.Language lang = new WebProgram().new Language();
        lang.display();
        WebProgram.Smart sm = new WebProgram().new Smart();
        sm.display();

        /*
            안드로이드 (구글사에서 만든 모바일 전용 OS)
            class R {
                class id {
                    String btn = "버튼";
                }
            }

            접근방식 R.id.btn

         */
    }
}
