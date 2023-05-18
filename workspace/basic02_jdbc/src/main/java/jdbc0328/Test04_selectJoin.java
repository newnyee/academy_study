package jdbc0328;

import java.sql.*;

public class Test04_selectJoin {
    public static void main(String[] args) {
        // 문제) 학번 g1001이 수강신청한 과목을 과목코드별로 조회하시오
        String hakno = "g1001";

        Connection conn = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521/xe",
                    "system",
                    "1234"
            );
            System.out.println("오라클DB 서버 연결 성공");

            String sql = new StringBuilder()
                    .append("SELECT a.hakno, a.gcode, gname ")
                    .append("FROM tb_sugang a JOIN tb_gwamok b ")
                    .append("ON a.gcode = b.gcode ")
                    .append("WHERE a.hakno = ? ")
                    .append("ORDER BY gcode")
                    .toString();

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, hakno);

            ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
                    System.out.print(rs.getString("hakno") + " ");
                    System.out.print(rs.getString("gcode") + " ");
                    System.out.println(rs.getString("gname") + " ");
                }

            rs.close();
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
