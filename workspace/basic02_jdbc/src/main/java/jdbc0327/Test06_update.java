package jdbc0327;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Test06_update {
    public static void main(String[] args) {
        //문제) sno =  행의 데이터를 아래의 내용으로 수정하시오

        int sno = 101;
        String uname = "JSPark";
        int kor = 90, eng = 85, mat = 100;
        int tot = (kor + eng + mat);
        int aver = tot / 3;
        String addr = "Suwon";

        Connection conn = null;
        try {
            String url = "jdbc:oracle:thin:@localhost:1521/xe";
            String user = "system";
            String password = "1234";
            String driver = "oracle.jdbc.driver.OracleDriver";
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("오라클DB 서버 연결 성공");

            String sql = new StringBuilder()
                    .append(" UPDATE sungjuk")
                    .append(" SET uname=?, kor=?, eng=?, mat=?, tot=?, aver=?, addr=?")
                    .append(" WHERE sno=?")
                    .toString();

            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, uname);
            pstmt.setInt(2, kor);
            pstmt.setInt(3, eng);
            pstmt.setInt(4, mat);
            pstmt.setInt(5, tot);
            pstmt.setInt(6, aver);
            pstmt.setString(7, addr);
            pstmt.setInt(8, sno);

            int row = pstmt.executeUpdate();

            if (row == 0) {
                System.out.println("행 수정 실패");
            } else {
                System.out.println("수정된 행 수: " + row);
            }

            pstmt.close();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                    System.out.println("오라클DB 서버 연결 종료");
                } catch (SQLException e) {}
            }
        }
    }
}

