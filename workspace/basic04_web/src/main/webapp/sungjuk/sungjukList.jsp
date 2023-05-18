<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
	<title>sungjukList.jsp</title>
</head>
<body>

	<div class="container mt-3">
	    <h3>성적 목록</h3>
		<a href="sungjukForm.jsp"><button class="btn btn-secondary">성적입력</button></a>
		<br><br>
		<table class="table table-hover">
			<thead class="table-secondary">
				<tr>
					<th>이름</th>
					<th>평균</th>
				</tr>
			</thead>
			<tbody>
<%
	//한글 인코딩
	request.setCharacterEncoding("utf-8");

	Connection con = null; //db 연결
	try {
	    Class.forName("oracle.jdbc.driver.OracleDriver");
	    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "system", "1234");
	    System.out.println("오라클DB 서버 연결 성공");
	    
	    String sql = new StringBuilder()
	    		.append("select sno, uname, aver ")
	    		.append("from sungjuk ")
	    		.append("order by wdate desc")
	    		.toString();

	    PreparedStatement pstmt = con.prepareStatement(sql);
	    ResultSet rs = pstmt.executeQuery();
	    
        while (rs.next()) {
%>
			<tr>
				<td><a href="sungjukRead.jsp?sno=<%=rs.getInt("sno") %>"><%=rs.getString("uname") %></a></td>
				<td><%=rs.getInt("aver") %></td>
			</tr>
<%
        }
	    		
	    
	    rs.close();
	    pstmt.close();
	    
	  } catch (ClassNotFoundException e) {
	      e.printStackTrace();
	  } catch (SQLException e) {
	      e.printStackTrace();
	  } finally {
	      if (con != null) try {con.close();} catch (SQLException e) {}
	      System.out.println("오라클DB 서버 연결 종료");
	  }


%>
			</tbody>
		</table>
	</div>
</body>
</html>