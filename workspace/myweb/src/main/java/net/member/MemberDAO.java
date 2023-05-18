package main.java.net.member;

import main.java.net.utility.DBClose;
import main.java.net.utility.DBOpen;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

//Data Access Object -> 데이터베이스 비지니스 로직 구현
public class MemberDAO {
    private DBOpen dbOpen = null;
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private StringBuilder sql = null;
    public MemberDAO() {
        dbOpen = new DBOpen();
    }

    // 로그인 메소드
    public String loginProc(MemberDTO dto) {
        String mlevel = null;
        try {
            conn = dbOpen.getConnection();
            String sql = new StringBuilder()
                    .append("SELECT mlevel ")
                    .append("FROM member ")
                    .append("WHERE id = ? AND passwd = ? AND NOT mlevel IN ('E1', 'F1') ") // 비회원 또는 탈퇴한 회원 제외
                    .toString();

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getId());
            pstmt.setString(2, dto.getPasswd());
            rs = pstmt.executeQuery();

            if(rs.next()) {
                mlevel = rs.getString("mlevel");
            }

        } catch (Exception e) {
            System.out.println("로그인 실패 : " + e);
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return mlevel;
    }

    // 아이디 중복확인 메소드
    public int duplecateID(String id) {
        int cnt = 0;
        try {
            conn = dbOpen.getConnection();
            sql = new StringBuilder()
                    .append("SELECT COUNT(*) AS cnt ")
                    .append("FROM member ")
                    .append("WHERE id = ? ");

            id = id.trim();
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                cnt = rs.getInt("cnt");
            }
        } catch (Exception e) {
            System.out.println("아이디 조회 실패 : " + e);
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return cnt;
    }

    // 이메일 중복확인 메소드
    public int duplicateEmail(String email) {
        int cnt = 0;
        try {
            conn = dbOpen.getConnection();
            sql = new StringBuilder()
                    .append("SELECT COUNT(*) AS cnt ")
                    .append("FROM member ")
                    .append("WHERE email = ? ");

            email = email.trim();
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                cnt = rs.getInt("cnt");
            }
        } catch (Exception e) {
            System.out.println("이메일 조회 실패 : " + e);
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return cnt;
    }

    // 회원가입 메소드
    public int create(MemberDTO dto) {
        int cnt = 0;
        try {
            conn = dbOpen.getConnection();
            sql = new StringBuilder()
                    .append("INSERT INTO member (id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate) ")
                    .append("VALUES (?, ?, ?, ?, ?, ?, ?, ?, ? ,'D1', SYSDATE) ");

            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, dto.getId());
            pstmt.setString(2, dto.getPasswd());
            pstmt.setString(3, dto.getMname());
            pstmt.setString(4, dto.getTel());
            pstmt.setString(5, dto.getEmail());
            pstmt.setString(6, dto.getZipcode());
            pstmt.setString(7, dto.getAddress1());
            pstmt.setString(8, dto.getAddress2());
            pstmt.setString(9, dto.getJob());

            cnt = pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("회원가입 실패 : " + e);
        } finally {
            DBClose.close(conn, pstmt);
        }
        return cnt;
    }

    // 비밀번호 재발급 메소드
    public String findPw (String mname, String email) {
        String newPw = "";
        String id = "";

        // 이름과 이메일로 아이디찾기
        try {
            conn = dbOpen.getConnection();
            sql = new StringBuilder()
                    .append("SELECT id ")
                    .append("FROM member ")
                    .append("WHERE mname=? AND email=? ");

            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, mname);
            pstmt.setString(2, email);

            rs = pstmt.executeQuery();
            if (rs.next()) {
                id = rs.getString("id");
            }

            // 숫자(0-9), 문자(a-z, A-Z) 이용하여 랜덤으로 10자리 문자열 만들기
            if(id.length()>0) { //아이디가 존재한다면 실행됨
                boolean run = true;
                while (run) {
                    int num = (int)((Math.random() * 124));
                    if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
                        newPw += String.valueOf((char) num);
                    }
                    if (newPw.length() == 10) {
                        run = false;
                    }
                }

                sql = new StringBuilder()
                        .append("UPDATE member SET passwd=? WHERE id=? AND email=?");
                pstmt = conn.prepareStatement(sql.toString());
                pstmt.setString(1, newPw);
                pstmt.setString(2, id);
                pstmt.setString(3, email);
                pstmt.executeUpdate();
            }

        } catch (Exception e) {
            System.out.println("아이디 찾기 실패" + e);
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return newPw; //아이디가 존재하지 않으면 공백문자열로 리턴됨
    }

    // 회원정보 조회 메소드
    public MemberDTO read(String id) {
        MemberDTO dto = null;
        try {
            conn = dbOpen.getConnection();
            sql = new StringBuilder()
                    .append("SELECT passwd, mname, tel, email, zipcode, address1, address2, job, mlevel ")
                    .append("FROM member WHERE id=? ");

            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, id);

            rs = pstmt.executeQuery();
            if(rs.next()) {
                dto = new MemberDTO();
                dto.setPasswd(rs.getString("passwd"));
                dto.setMname(rs.getString("mname"));
                dto.setTel(rs.getString("tel"));
                dto.setEmail(rs.getString("email"));
                dto.setZipcode(rs.getString("zipcode"));
                dto.setAddress1(rs.getString("address1"));
                dto.setAddress2(rs.getString("address2"));
                dto.setJob(rs.getString("job"));
                dto.setMlevel(rs.getString("mlevel"));
            }
        } catch (Exception e) {
            System.out.println("회원정보 조회 실패: " + e);
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return dto;
    }

    // 회원정보 수정 메소드
    public int update(MemberDTO dto) {
        int cnt = 0;
        try {
            conn = dbOpen.getConnection();
            sql = new StringBuilder()
                    .append("UPDATE member SET passwd=?, mname=?, email=?, tel=?, zipcode=?, address1=?, address2=?, job=? ")
                    .append("WHERE id=?");

            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, dto.getPasswd());
            pstmt.setString(2, dto.getMname());
            pstmt.setString(3, dto.getEmail());
            pstmt.setString(4, dto.getTel());
            pstmt.setString(5, dto.getZipcode());
            pstmt.setString(6, dto.getAddress1());
            pstmt.setString(7, dto.getAddress2());
            pstmt.setString(8, dto.getJob());
            pstmt.setString(9, dto.getId());

            cnt = pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("회원정보 수정 실패: " + e);
        } finally {
            DBClose.close(conn, pstmt);
        }
        return cnt;
    }

    // 회원 탈퇴 메소드
    public int delete(String id, String passwd) { //회원정보 삭제가 아닌 회원등급 변경
        int cnt = 0;
        try {
            conn = dbOpen.getConnection();
            sql = new StringBuilder()
                    .append("UPDATE member SET mlevel='F1' WHERE id=? AND passwd=?");

            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, id);
            pstmt.setString(2, passwd);
            cnt = pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("회원 탈퇴 실패: " + e);
        } finally {
            DBClose.close(conn, pstmt);
        }
        return cnt;
    }
}
