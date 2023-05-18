package oop0316;

import java.util.StringTokenizer;

public class Test03_quiz {
    public static void main(String[] args) {
        // String 관련 연습 문제


        //문1) 이메일 주소에 @문자 있으면
        //    @글자 기준으로 문자열을 분리해서 출력하고
        //    @문자 없다면 "이메일주소 형태가 아닙니다" 메세지를 출력하시오
        /*
              출력결과
              webmaster
              itwill.co.kr
        */

        String email = new String("webmaster@itwill.co.kr");
        if(email.contains("@")) {
            StringTokenizer st = new StringTokenizer(email, "@");
            while (st.hasMoreElements()) {
                System.out.println(st.nextToken());
            }
        } else {
            System.out.println("이메일주소 형태가 아닙니다");
        }


        /*
        다른 풀이1
        if(email.indexOf("@") == -1) {
            System.out.println("이메일주소 형태가 아닙니다");
            }
        } else {
            String[] arr = email.split("@");
            for(int i=0; i<arr.length; i++) {
                System.out.println(arr[i]);
        }

        다른 풀이2
        if(email.indexOf("@") == -1) {
            System.out.println("이메일주소 형태가 아닙니다");
            }
        } else {
            int pos = email.indexOf("@"); //9
            String id = email.substring(0, pos); // 0인덱스 ~ 9-1인덱스 까지
            String server = email.substring(pos+1); // 10인덱스 ~ 마지막인덱스 까지
            System.out.println(id);
            System.out.println(server);
        }
         */



        //문2) 이미지 파일만 첨부 (.png, .jpg, .gif)
        // 출력결과
        // 파일명 : sky2023.03.16
        // 확장자명 : jpg

        String path = new String("d:/frontend/images/sky2023.03.16.jpg");

        path = path.toLowerCase(); // 대문자로 적을 경우를 대비해 소문자로 변환시킴
        if(path.contains(".jpg") || path.contains(".png") || path.contains(".gif")) {
            String[] paths = path.split("/"); // 경로 분리
            String file = paths[paths.length-1]; // 파일이름
            String fileName = file.substring(0,file.lastIndexOf(".")); // 확장자명을 뺀 파일이름

            String extention = file.substring(file.lastIndexOf(".")+1); // 확장자명
            System.out.println("파일명 : " + fileName);
            System.out.println("확장자명 : " + extention);
            System.out.println("이미지 파일이 전송되었습니다");

        } else {
            System.out.println("이미지 파일만 첨부 가능합니다");
        }


        //다른풀이

        int lastSlash = path.lastIndexOf("/"); // path에서 마지막 "/" 기호의 인덱스 -> 18
        String file = path.substring(lastSlash+1); // 전체파일명

        int lastDot = file.lastIndexOf("."); // file에서 마지막 "." 기호의 인덱스 -> 13

        String fileName = file.substring(0,lastDot); // 파일명
        String ext = file.substring(lastDot+1); // 확장자명

        ext = ext.toLowerCase(); // 대문자로 적을 경우를 대비해 소문자로 변환시킴
        if(ext.equals("png") || ext.equals("jpg") || ext.equals("gif")) {
            System.out.println("파일명 : " + fileName);
            System.out.println("확장자명 : " + ext);
            System.out.println("이미지 파일이 전송되었습니다");
        } else {
            System.out.println("이미지 파일만 첨부 가능합니다");
        }







    }
}
