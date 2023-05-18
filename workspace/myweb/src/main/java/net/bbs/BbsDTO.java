package main.java.net.bbs;

public class BbsDTO {

    // 멤버 변수 field
    private int bbsno;
    private String wname;
    private String subject;
    private String content;
    private String passwd;
    private int readcnt;
    private String regdt;
    private int grpno;
    private int indent;
    private int ansnum;
    private String ip;

    private int rnum; // 글 번호

    private int replyAll; // 댓글 갯수

    public int getReplyAll() {
        return replyAll;
    }

    public void setReplyAll(int replyAll) {
        this.replyAll = replyAll;
    }

    public int getRnum() {
        return rnum;
    }

    public void setRnum(int rnum) {
        this.rnum = rnum;
    }

    @Override
    public String toString() {
        return "BbsDTO{" +
                "bbsno=" + bbsno +
                ", wname='" + wname + '\'' +
                ", subject='" + subject + '\'' +
                ", content='" + content + '\'' +
                ", passwd='" + passwd + '\'' +
                ", readcnt=" + readcnt +
                ", regdt='" + regdt + '\'' +
                ", grpno=" + grpno +
                ", indent=" + indent +
                ", ansnum=" + ansnum +
                ", ip='" + ip + '\'' +
                '}';
    }

    // 생성자
    public BbsDTO() {}

    // getter, setter 메소드
    public int getBbsno() {
        return bbsno;
    }

    public void setBbsno(int bbsno) {
        this.bbsno = bbsno;
    }

    public String getWname() {
        return wname;
    }

    public void setWname(String wname) {
        this.wname = wname;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public int getReadcnt() {
        return readcnt;
    }

    public void setReadcnt(int readcnt) {
        this.readcnt = readcnt;
    }

    public String getRegdt() {
        return regdt;
    }

    public void setRegdt(String regdt) {
        this.regdt = regdt;
    }

    public int getGrpno() {
        return grpno;
    }

    public void setGrpno(int grpno) {
        this.grpno = grpno;
    }

    public int getIndent() {
        return indent;
    }

    public void setIndent(int indent) {
        this.indent = indent;
    }

    public int getAnsnum() {
        return ansnum;
    }

    public void setAnsnum(int ansnum) {
        this.ansnum = ansnum;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }
}
