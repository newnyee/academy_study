package oop0320;

public class Test01_getset {
    public static void main(String[] args) {
        // getter와 setter메소드
        /*
            메소드명 작성 규칙
            is 메소드명() - 대부분 boolean형으로 반환
            to 메소드명() - to 뒤의 값을 반환
            get 메소드명() - 대부분 리턴값이 존재
            set 메소드명() - 원하는 값으로 셋팅할 때
         */

        // getter메소드 작성 규칙
        // get + 멤버변수명 (캐멀스타일) => 메소드명()

        // setter메소드 작성 규칙
        // set + 멤버변수명 (캐멀스타일) => 메소드명()

        //BbsDTO 클래스 생성 후 실습
        BbsDTO dto = new BbsDTO();

        dto.setBbsno(1);
        dto.setWriter("오필승");
        dto.setSubject("무궁화 꽃이 피었습니다");

        System.out.println(dto.getBbsno());
        System.out.println(dto.getWriter());
        System.out.println(dto.getSubject());



    }
}
