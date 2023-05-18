package jdbc0327;

import java.sql.*;

public class Test09_selectAll {
    public static void main(String[] args) {
        // sungjuk 테이블 전체 행 조회
        int sno = 101;

        Connection conn = null; //db 연결
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "system", "1234");
            System.out.println("오라클DB 서버 연결 성공");

            String sql = new StringBuilder()
                    .append("SELECT sno, uname, kor, eng, mat, tot, aver, addr, wdate ")
                    .append("FROM sungjuk ")
                    .append("ORDER BY sno desc")
                    .toString();

            PreparedStatement pstmt = conn.prepareStatement(sql);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                System.out.print(rs.getInt("sno") + ", ");
                System.out.print(rs.getString("uname") + ", ");
                System.out.print(rs.getInt("kor") + ", ");
                System.out.print(rs.getInt("eng") + ", ");
                System.out.print(rs.getInt("mat") + ", ");
                System.out.print(rs.getInt("tot") + ", ");
                System.out.print(rs.getInt("aver") + ", ");
                System.out.print(rs.getString("addr") + ", ");
                System.out.println(rs.getString("wdate"));
            }

            rs.close();
            pstmt.close();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) try {conn.close();} catch (SQLException e) {}
            System.out.println("오라클DB 서버 연결 종료");
        }
    }
}
