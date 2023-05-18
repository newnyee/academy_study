package jdbc0327;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Test03_update {
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
                    .append("UPDATE sungjuk ")
                    .append("SET tot=kor+eng+mat, aver=(kor+eng+mat)/3 ")
                    .append("WHERE sno=92")
                    .toString();

            PreparedStatement pstmt = conn.prepareStatement(sql);

            int row = pstmt.executeUpdate(); //실행했을 때 행의 갯수 반환

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
                } catch (SQLException e) {
                }
            }
        }
    }
}
