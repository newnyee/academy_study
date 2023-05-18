package jdbc0328;

import java.sql.*;

public class Test03_selectPaging {
    public static void main(String[] args) {
        // 페이징
        // 문제) sungjuk 테이블에서 이름순으로 정렬 후 행번호 4~6만 조회하시오
        int start = 4;
        int end = 6;

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
                    .append("select sno, uname, kor, eng, mat, tot, aver, addr, wdate ")
                    .append("from (select A.*, rownum as rnum from (SELECT * FROM sungjuk ORDER BY uname) A) ")
                    .append("where rnum between ? and ?")
                    .toString();


            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, start);
            pstmt.setInt(2, end);

            ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
                    System.out.print(rs.getInt("sno") + " ");
                    System.out.print(rs.getString("uname") + " ");
                    System.out.print(rs.getInt("kor") + " ");
                    System.out.print(rs.getInt("eng") + " ");
                    System.out.print(rs.getInt("mat") + " ");
                    System.out.print(rs.getInt("tot") + " ");
                    System.out.print(rs.getInt("aver") + " ");
                    System.out.print(rs.getString("addr") + " ");
                    System.out.println(rs.getString("wdate"));
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
