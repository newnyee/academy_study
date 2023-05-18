package jdbc0327;

import java.sql.*;

public class Test08_selectOne {
    public static void main(String[] args) {
        // sungjuk 테이블에서 한 행만 가져오기
        int sno = 101;

        Connection conn = null; //db 연결
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "system", "1234");
            System.out.println("오라클DB 서버 연결 성공");

            String sql = new StringBuilder()
                    .append("SELECT sno, uname, kor, eng, mat, tot, aver, addr, wdate ")
                    .append("FROM sungjuk ")
                    .append("WHERE sno = ?")
                    .toString();

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, sno);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                // 1) 칼럼 순번으로 접근
                System.out.println(rs.getInt(1)); //sno
                System.out.println(rs.getString(2)); //uname
                System.out.println(rs.getInt(3)); //kor
                System.out.println(rs.getInt(4)); //eng
                System.out.println(rs.getInt(5)); //mat
                System.out.println(rs.getInt(6)); //tot
                System.out.println(rs.getInt(7)); //aver
                System.out.println(rs.getString(8)); //addr
                System.out.println(rs.getString(9)); //wdate

                // 2) 칼럼명으로 접근
                System.out.println(rs.getInt("sno"));
                System.out.println(rs.getString("uname"));
                System.out.println(rs.getInt("kor"));
                System.out.println(rs.getInt("eng"));
                System.out.println(rs.getInt("mat"));
                System.out.println(rs.getInt("tot"));
                System.out.println(rs.getInt("aver"));
                System.out.println(rs.getString("addr"));
                System.out.println(rs.getString("wdate"));

            } else {
                System.out.println("자료없음");
            }

            rs.close();
            pstmt.close();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) try {conn.close();} catch (SQLException e) {}
            System.out.println("오라클 DB 서버 연결 종료");
        }
    }
}
