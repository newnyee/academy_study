package jdbc0327;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Test04_delete {
    public static void main(String[] args) {
        //sungjuk 테이블 행 수정 연습
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
                    .append("DELETE FROM sungjuk WHERE sno=92")
                    .toString();

            PreparedStatement pstmt = conn.prepareStatement(sql);

            int row = pstmt.executeUpdate();

            if (row == 0) {
                System.out.println("행 삭제 실패");
            } else {
                System.out.println("삭제된 행 수: " + row);
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
