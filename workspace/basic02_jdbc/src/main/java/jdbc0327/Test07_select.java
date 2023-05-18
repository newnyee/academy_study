package jdbc0327;

import java.sql.*;

public class Test07_select {
    public static void main(String[] args) {
        // sungjuk 테이블의 행의 갯수를 출력하시오

        Connection conn = null; //db 연결
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "system", "1234");
            System.out.println("오라클DB 서버 연결 성공");

            String sql = new StringBuilder()
                    .append("SELECT COUNT(*) AS cnt")
                    .append(" FROM sungjuk")
                    .toString();

            //?(물음표)와 set기본타입() 메소드 사용으로 가독성이 좋아짐
            PreparedStatement pstmt = conn.prepareStatement(sql);

            //select문을 실행한 결과(테이블)을 저장할 수 있게 해주는 자료형
            ResultSet rs = pstmt.executeQuery();

            //최초 커서는 값이 없는 첫줄에 커서가 위치함(beforeFirst 행)
            //next()메소드를 사용하여 다음 줄(First 행)에 커서를 옮기고 그 곳에 값이 있는지 확인
            //읽을 값이 없을 때 까지 반복함
            //값이 없는 마지막 줄(afterLast 행)에 도달시 반복문 해제
            if (rs.next()) {
                System.out.println("자료 있음");
                // 1) 칼럼 순번으로 접근
                // select 칼럼1, 칼럼2, 칼럼3, ...
                // 자료형을 일치하면서 가져옴
                System.out.println("전체 행 갯수: " + rs.getInt(1));

                // 2) 칼럼명으로 접근
                // select cnt, ...
                System.out.println("전체 행 갯수: " + rs.getInt("cnt"));
            } else {
                System.out.println("자료 없음");
            }

            rs.close();
            pstmt.close();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // try문 바깥쪽에 null로 처리되어있기 때문에 not null일때의 조건으로 if문 작성
            if (conn != null) try {conn.close();} catch (SQLException e) {}
            System.out.println("오라클DB 서버 연결 종료");
        }
    }
}
