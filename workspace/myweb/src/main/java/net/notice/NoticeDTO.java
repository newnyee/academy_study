package main.java.net.notice;

public class NoticeDTO {

    // 멤버 변수
    private int ntc_no;
    private String ntc_subject;
    private String ntc_content;
    private int ntc_readcnt;
    private String ntc_regdt;
    private int ntc_fix;
    private int rnum;


    // toString() 메소드 오버라이딩
    @Override
    public String toString() {
        return "NoticeDTO{" +
                "ntc_no=" + ntc_no +
                ", ntc_subject='" + ntc_subject + '\'' +
                ", ntc_content='" + ntc_content + '\'' +
                ", ntc_readcnt=" + ntc_readcnt +
                ", ntc_regdt='" + ntc_regdt + '\'' +
                '}';
    }

    // 기본 생성자 선언
    public NoticeDTO() {}

    // getter(), setter() 메소드 선언

    public int getNtc_fix() {
        return ntc_fix;
    }

    public void setNtc_fix(int ntc_fix) {
        this.ntc_fix = ntc_fix;
    }

    public int getRnum() {
        return rnum;
    }

    public void setRnum(int rnum) {
        this.rnum = rnum;
    }

    public int getNtc_no() {
        return ntc_no;
    }

    public void setNtc_no(int ntc_no) {
        this.ntc_no = ntc_no;
    }

    public String getNtc_subject() {
        return ntc_subject;
    }

    public void setNtc_subject(String ntc_subject) {
        this.ntc_subject = ntc_subject;
    }

    public String getNtc_content() {
        return ntc_content;
    }

    public void setNtc_content(String ntc_content) {
        this.ntc_content = ntc_content;
    }

    public int getNtc_readcnt() {
        return ntc_readcnt;
    }

    public void setNtc_readcnt(int ntc_readcnt) {
        this.ntc_readcnt = ntc_readcnt;
    }

    public String getNtc_regdt() {
        return ntc_regdt;
    }

    public void setNtc_regdt(String ntc_regdt) {
        this.ntc_regdt = ntc_regdt;
    }
}
