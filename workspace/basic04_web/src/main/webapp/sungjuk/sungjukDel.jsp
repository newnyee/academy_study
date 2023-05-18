<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <title>Insert title here</title>
</head>
<body>

	<div class="container mt-3">
	<h3>성적 삭제하기</h3>
<%
	// 한글 인코딩
	request.setCharacterEncoding("utf-8");
	
	int sno = Integer.parseInt(request.getParameter("sno"));
	
	Connection con = null; //db 연결
	try {
	    Class.forName("oracle.jdbc.driver.OracleDriver");
	    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "system", "1234");
	    System.out.println("오라클DB 서버 연결 성공");
		    
	    String sql = new StringBuilder()
	    		.append("DELETE FROM sungjuk WHERE sno=?")
	    		.toString();
	    
	    PreparedStatement pstmt = con.prepareStatement(sql);
	    pstmt.setInt(1, sno);
		    
	    int cnt = pstmt.executeUpdate();
	    if(cnt==0) {
	    	out.println("성적 삭제 실패");
	    	out.println("<p><a href='javascript:history.back.jsp'>[다시시도]</a></p>");
	    } else {
%>
        	
    	    <div class="alert alert-dismissible alert-secondary">
  				<a href='sungjukList.jsp'><button type="button" class="btn-close"></button></a>
  				성적이 삭제되었습니다
			</div>
    	
<%
	    }
	    
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
	</div>
</body>
</html>