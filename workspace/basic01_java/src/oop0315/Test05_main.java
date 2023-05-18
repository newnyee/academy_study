package oop0315;

public class Test05_main {
    public static void test() {
        System.out.println("JAVA");
        //test(); 재귀 메소드

        //main();
        // 메인메소드는 사용자가 임의로 호출할 수 없다
        //Java Virtual Machine(JVM)
        //->자바 가상 머신이 클래스를 실행할 때 main() 함수를 먼저 호출하고 그 이후가 실행된다

    }

    public static void main(String[] args) {
        //main()메소드가 호출되는 시점과 값을 전달하는 예제
        //test();

        /*
	        default package에 있는 MainTest.java참조
	        명령 프롬프트에서 실습합니다
	         >cd\                    최상위 루트 이동
	         >i:                     드라이브 변경
	         >cd java202301          폴더 변경
	         >cd workspace
	         >cd basic01_java
	         >cd src
	         >dir
	         >javac MainTest.java             자바소스 컴파일
	         >java MainTest                   자바클래스 실행
	         >java MainTest Seoul Jeju Busan

	         ※.class파일 실행시 전달값은
	            main()함수의 매개변수(String[] args)가 받는다

         */
    }
}
