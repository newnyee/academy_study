package oop0320;

public class BbsDTO { //Data Transfer Object -> 데이터 전송 객체
    // 멤버 변수 field
    private int bbsno; //글번호
    private String writer; //글작성자
    private String subject; //글제목


    // 생성자 constructor
    public BbsDTO() {}


    // 멤버 메소드 method

    public int getBbsno() {
        return bbsno;
    }
    public void setBbsno(int bbsno) {
        this.bbsno = bbsno;
    }

    public String getWriter() {
        return writer;
    }
    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getSubject() {
        return subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }
}
