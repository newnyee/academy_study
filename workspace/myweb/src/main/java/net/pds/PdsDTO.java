package main.java.net.pds;

public class PdsDTO {
    private int pdsno; //PK
    private String wname; //작성자이름
    private String passwd; //비밀번호
    private String subject; //제목
    private String filename; //파일이름
    private long filesize; //파일사이즈
    private String regdate; //올린날짜
    private int readcnt; //조회수

    private int rnum; //글번호

    public PdsDTO () {}

    @Override
    public String toString() {
        return "PdsDTO{" +
                "pdsno=" + pdsno +
                ", wname='" + wname + '\'' +
                ", passwd='" + passwd + '\'' +
                ", subject='" + subject + '\'' +
                ", filename='" + filename + '\'' +
                ", filesize=" + filesize +
                ", regdate='" + regdate + '\'' +
                ", readcnt=" + readcnt +
                ", rnum=" + rnum +
                '}';
    }

    public int getRnum() {
        return rnum;
    }

    public void setRnum(int rnum) {
        this.rnum = rnum;
    }

    public int getPdsno() {
        return pdsno;
    }

    public void setPdsno(int pdsno) {
        this.pdsno = pdsno;
    }

    public String getWname() {
        return wname;
    }

    public void setWname(String wname) {
        this.wname = wname;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public long getFilesize() {
        return filesize;
    }

    public void setFilesize(long filesize) {
        this.filesize = filesize;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public int getReadcnt() {
        return readcnt;
    }

    public void setReadcnt(int readcnt) {
        this.readcnt = readcnt;
    }
}
