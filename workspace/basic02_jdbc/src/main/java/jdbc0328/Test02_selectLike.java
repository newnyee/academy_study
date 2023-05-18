package jdbc0328;

import java.sql.*;

public class Test02_selectLike {
    public static void main(String[] args) {
        // like 연산자 연습
        // 이름에 '나' 문자가 있는 행을 조회하시오
        String col = "uname";
        String word = "나"; //ex) 검색어

        word = word.trim(); //공백 제거

        // 검색어 존재 유무 확인
        if (word.length() > 0) {
            //where uname like '%나%'
            word = "%" + word + "%";
        } else {
            System.out.println("검색어가 없습니다");
            return;
        }

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
                    .append("SELECT sno, uname, kor, eng, mat, tot, aver, addr, wdate ")
                    .append("FROM sungjuk ")
                    .append("WHERE " + col + " LIKE ? ")
                    .append(" ORDER BY sno DESC")
                    .toString();


            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, word);

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
