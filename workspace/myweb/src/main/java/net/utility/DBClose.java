package main.java.net.utility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBClose {
	//데이터 베이스 연결 자원 반납
	public static void close(Connection conn) {
		try {
			if(conn!=null) {conn.close();}
		} catch (Exception e) {}
	}
	
	public static void close(Connection conn, PreparedStatement pstmt) {
		
		try {
			pstmt.close();
			if(conn!=null) {conn.close();}
		} catch (Exception e) {}
	}
	
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			rs.close();
			pstmt.close();
			if(conn!=null) conn.close();
		} catch (Exception e) {}			
	}
}
