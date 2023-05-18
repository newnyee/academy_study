package jdbc0328;

import java.sql.*;

public class Test01_selectAvg {
    public static void main(String[] args) {
        // 문제) 주소가 서울인 행들의 국영수 평균값을 구하시오
        // (단, 소수점은 반올림해서 둘째 자리값까지 표현)
        String addr = "Seou";

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
                    .append("SELECT ROUND(AVG(kor),2) AS kor_avg, ")
                    .append("ROUND(AVG(eng),2) AS eng_avg, ")
                    .append("ROUND(AVG(mat),2) AS mat_avg ")
                    .append("FROM sungjuk WHERE addr = ?")
                    .toString();

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, addr);

            ResultSet rs = pstmt.executeQuery();

            while(true) {
                if (rs.next()) {
                    System.out.print(rs.getDouble("kor_avg") + ", ");
                    System.out.print(rs.getDouble("eng_avg") + ", ");
                    System.out.println(rs.getDouble("mat_avg"));
                } else {
                    System.out.println("자료없음");
                    rs.close();
                    pstmt.close();
                    return;
                }
            }

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
