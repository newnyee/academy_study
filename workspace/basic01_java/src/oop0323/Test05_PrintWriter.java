package oop0323;

import java.io.FileWriter;
import java.io.PrintWriter;

public class Test05_PrintWriter {
    public static void main(String[] args) {
        // 메모장 파일에 출력하기

        // 출력파일(sungjuk.txt)이 없으면 -> 파일생성됨 (create)
        // 출력파일(sungjuk.txt)이 있으면 -> 덮어쓰기(overwrite) 또는 추가(append)

        String fileName = "d:/java202301/sungjuk.txt";
        FileWriter fw = null;
        PrintWriter out = null;
        try {
            // append true -> 추가, false -> 덮어쓰기
            fw = new FileWriter(fileName, true);
            //autoFlush true -> 버퍼를 청소하면서 사용
            out = new PrintWriter(fw, true);

            // oop0313.Test07_format.java참조
            // System.out.println(); 콘솔창에 출력
            // out.println(); 해당 파일에 출력
            out.println("무궁화,95,90,100");
            out.println("홍길동,100,100,100");
            out.println("라일락,90,95,35");
            out.println("개나리,85,70,75");
            out.println("진달래,35,40,60");

            System.out.println("sungjuk.txt 데이터 파일 완성");

        } catch (Exception e) {
            System.out.println("파일 쓰기 실패");
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {out.close();}
            } catch (Exception e) {}
            try {
                if (fw != null) {out.close();}
            } catch (Exception e) {}
        }

    }
}
