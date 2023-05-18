package oop0323;

import java.io.File;

public class Test01_File {
    public static void main(String[] args) {
        // File 클래스
        // 파일과 관련된 정보를 알 수 있다
        // 파일명, 파일크기, 확장명, 파일타입 등

        try {
            // 예외 발생이 예상되는 코드 작성

            // 경로 + 파일명
            // 경로 구문자 '\\'(윈도우) 또는 '/'(윈도우, 맥OS, 리눅스) 사용 -> '/' 권장
            String pathName = "D:/java202301/java2023/java/eJava.pdf";

            // File 클래스에 파일 담기
            File f = new File(pathName);

            if (f.exists()) {
                System.out.println("파일이 존재합니다");
                long fileSize = f.length(); //파일크기 리턴 메소드
                System.out.println("파일크기 : " + fileSize); // byte
                System.out.println("파일크기 : " + fileSize/1024 + "KB"); // KB
                System.out.println("파일크기 : " + fileSize/1024/1024 + "MB"); // MB

                String fileName = f.getName();
                System.out.println("파일명 : " + fileName);

                /*
                if (f.delete()) { //파일 삭제 메소드 : 휴지통으로 보내지지 않고 바로 삭제됨
                    System.out.println("파일 삭제 성공");
                } else {
                    System.out.println("파일 삭제 실패");
                }
                */

                // 문) 파일명과 확장명을 분리해서 출력하시오
                // 파일명 : 20230309_java
                // 확장명 : pdf

                fileName = fileName.toLowerCase();
                int dotNum = fileName.indexOf(".");

                String file = fileName.substring(0,dotNum);
                String extension = fileName.substring(dotNum+1);

                System.out.println("파일명 : " + file);
                System.out.println("확장명 : " + extension);

                // 파일삭제
            } else {
                System.out.println("파일이 존재하지 않습니다");
//                f.mkdir(); //마지막 파일 또는 경로만 존재하지 않을경우 그 이름으로 새로운 디렉토리를 생성해줌
//                f.mkdirs(); //경로에 없는 디렉토리를 모두 생성해줌
            }


        } catch (Exception e) {
            // 예외가 발생되면 처리할 코드를 작성
            e.printStackTrace();
        }
        System.out.println("END");
    }
}
