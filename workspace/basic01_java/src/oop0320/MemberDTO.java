package oop0320;

public class MemberDTO { //Data Transfer Object
    // 멤버변수 field
    private int mno; //일련번호
    private String id; //아이디
    private String password; //비밀번호
    private String email; //이메일


    // 생성자
    public MemberDTO() {}

    public MemberDTO(int mno, String id, String password, String email) {
        this.mno = mno;
        this.id = id;
        this.password = password;
        this.email = email;
    }


    // 메소드

    public int getMno() {
        return mno;
    }

    public void setMno(int mno) {
        this.mno = mno;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
