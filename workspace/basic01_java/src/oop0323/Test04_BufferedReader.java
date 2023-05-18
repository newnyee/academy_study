package oop0323;

import java.io.BufferedReader;
import java.io.FileReader;

public class Test04_BufferedReader {
    public static void main(String[] args) {
        String fileName = "D:/java202301/workspace/basic01_java/src/oop0322/Order.java"; //절대경로 주지않으면 현재경로에서 찾음
        FileReader fr = null; //try-catch문 사용으로 인해 외부에 선언해야함
        BufferedReader br = null; //try-catch문 사용으로 인해 외부에 선언해야함

        try {
            fr = new FileReader(fileName); //파일 가져오기
            br = new BufferedReader(fr); //보조 스트림에 넣기

            int num = 0; //행번호
            while(true) {
                String line = br.readLine(); //엔터(\n)를 기준으로 한줄씩 가져오기
                if (line == null) { //br.readLine() 읽을 byte가 없으면 null 리턴(EOF)
                    break; //반복문 해제
                }
                System.out.printf("%d %s\n",++num, line);

                //20행마다 밑줄 긋기
                if(num%20 ==0) {
                    System.out.println("------------------------");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 자원반납
            try {
                if (br != null) {br.close();} //바깥 스트림부터 닫기
            } catch (Exception e) {}
            try {
                if (fr != null) {fr.close();}
            } catch (Exception e) {}
        }
    }
}
