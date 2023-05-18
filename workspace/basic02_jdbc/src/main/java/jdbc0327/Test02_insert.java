package jdbc0327;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Test02_insert {
    public static void main(String[] args) {
        //sungjuk테이블 행 추가 연습
        Connection conn = null;
        try {
            String url = "jdbc:oracle:thin:@localhost:1521/xe";
            String user = "system";
            String password = "1234";
            String driver = "oracle.jdbc.driver.OracleDriver";
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("오라클DB 서버 연결 성공");


            // 4) SQL 작성
            // [주의사항] SQL 종결문자 ; 를 쓰면 오류남
            StringBuilder sql = new StringBuilder();
            sql.append(" INSERT INTO sungjuk(sno, uname, kor, eng, mat, addr, wdate)")
               .append(" VALUES (sungjuk_seq.nextval, '손흥민', 99, 98, 97, 'Seoul', sysdate)");
            /*
            String sql = new StringBuilder()
                    .append(" INSERT INTO sungjuk(sno, uname, kor, eng, mat, addr, wdate)")
                    .append(" VALUES (sungjuk_seq.nextval, '손흥민', 99, 98, 97, 'Seoul', sysdate)")
                    .toString();
             */


            // 5) SQL 형식으로 변환
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
            // PreparedStatement pstmt = conn.prepareStatement(sql);


            // 6) SQL 문 실행
            int row = pstmt.executeUpdate(); //INSERT, UPDATE, DELETE문 실행

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
