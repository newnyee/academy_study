package oop0323;

import java.io.FileReader;

public class Test03_FileReader {
    public static void main(String[] args) {
        // 2) char 기반 -> 한글 깨지지않고 출력됨
        String fileName = "D:/java202301/workspace/basic01_java/src/oop0323/data.txt"; //절대경로 주지않으면 현재경로에서 찾음
        FileReader fr = null;

        try {
            fr = new FileReader(fileName); //파일 가져오기
            while(true) {
                int data = fr.read(); //2byte 단위로 읽어옴
                if (data == -1) { //fis.read 읽을 byte가 없으면 -1 리턴
                    break; //반복문 해제
                }
                System.out.printf("%c", data);
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            // 자원반납
            try {
                if (fr  != null) {fr.close();}
            } catch (Exception e) {}
        }
    }
}
