package oop0323;

import java.io.FileInputStream;

public class Test02_FileinputStream {
    public static void main(String[] args) {
        // 파일 입출력(.txt)
        // File : .txt .pdf .xls .csv .ppt .jpg 등

        // byte형 : 1byte 할당
        // char형 : 2byte 할당

        // 1) byte기반 -> 한글 깨짐
        String fileName = "D:/java202301/workspace/basic01_java/src/oop0323/data.txt"; //절대경로 주지않으면 현재경로에서 찾음
        FileInputStream fis = null;

        try {
            fis = new FileInputStream(fileName); //파일 가져오기
            while(true) {
                int data = fis.read(); //1byte 단위로 읽어옴(한글깨짐)
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
                if (fis != null) {fis.close();}
            } catch (Exception e) {}
        }
    }
}
