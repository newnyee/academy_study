package net.utility;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBOpen {
	
	public Connection getConnection() {
		Connection conn=null;
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "system", "1234");
		System.out.println("DB 연결 성공");
			
		} catch (Exception e) {
			System.out.println("DB 연결 실패: " + e);
		}
		return conn;
	}

}
