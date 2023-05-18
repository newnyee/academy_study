package jdbc0327;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Test01_DBOpen {
	public static void main(String[] args) {
		Connection conn = null;
		// Oracle DB XE 18c 연결
		try {
			// 1) 오라클 DB 서버 연결 관련 정보
			String url = "jdbc:oracle:thin:@localhost:1521/xe";
			String user = "system";
			String password = "1234";
			String driver = "oracle.jdbc.driver.OracleDriver"; //ojdbc8.jar

			// 2) 드라이버 로딩
			// static 메소드로 드라이버 메모리 로딩
			Class.forName(driver);

			// 3) 오라클 DB 서버 연결
			conn = DriverManager.getConnection(url, user, password);

			System.out.println("오라클 DB 서버 연결 성공");

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
