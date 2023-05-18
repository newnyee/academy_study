package jdbc0327;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Test05_insert {
    public static void main(String[] args) {
        //변수를 이용해서 sungjuk 테이블 행 추가 연습
        Connection conn = null;
        try {
            String url = "jdbc:oracle:thin:@localhost:1521/xe";
            String user = "system";
            String password = "1234";
            String driver = "oracle.jdbc.driver.OracleDriver";
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("오라클DB 서버 연결 성공");

            String name = "박지성";
            int kor=99, eng=98, mat=100;
            String addr = "Seoul";

            String sql = new StringBuilder()
                    .append(" INSERT INTO sungjuk(sno, uname, kor, eng, mat, addr, wdate)")
                    .append(" VALUES (sungjuk_seq.nextval, ?, ?, ?, ?, ?, sysdate)") //?->특정값으로 대입할 수 있는 표식
                    .toString();

            PreparedStatement pstmt = conn.prepareStatement(sql);
            // ?(물음표)의 갯수, 순서, 자료형이 일치해야한다

            pstmt.setString(1, name);
            pstmt.setInt(2, kor);
            pstmt.setInt(3, eng);
            pstmt.setInt(4, mat);
            pstmt.setString(5, addr);

            int row = pstmt.executeUpdate();
            if (row == 0) {
                System.out.println("행 삽입 실패");
            } else {
                System.out.println("삽입된 행 수: " + row);
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
                } catch (SQLException e) {
                }
            }
        }
    }
}
