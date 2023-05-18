<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/bootstrap_Morph.min.css">
   	<title>travelBookProc.jsp</title>
	<style>
		section{
			height: auto;
			min-height: 100%;
			padding-bottom: 30px;
		}
		footer{
			height: 30px;
			position: relative;
			transform: translateY(-100%);
			text-align:center;
		}
		.headerdiv{margin:10px}
		h3{text-align:center;}
	</style>
</head>
<body>
	<!-- header -->
	<header>
		<div class="headerdiv">
			<h3>여행 예약 프로그램</h3>
		</div>
	</header>
	
	<!-- main -->
	<section>
<%
	String rno = request.getParameter("rno");
	String tcode = request.getParameter("tcode");
	String rjumin = request.getParameter("rjumin1") + request.getParameter("rjumin2");
	String rname = request.getParameter("rname");
	String rphone1 = request.getParameter("rphone1");
	String rphone2 = request.getParameter("rphone2");
	String rphone3 = request.getParameter("rphone3");
	String remail = request.getParameter("remail");
	String rstat = request.getParameter("rstat");
	
	Connection conn = null;
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
		
		String sql = new StringBuilder()
				.append("INSERT INTO tbl_reserve_01(rno, tcode, rjumin, rname, rphone1, rphone2, rphone3, remail, rstat) ")
				.append("VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)")
				.toString();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, rno);
		pstmt.setString(2, tcode);
		pstmt.setString(3, rjumin);
		pstmt.setString(4, rname);
		pstmt.setString(5, rphone1);
		pstmt.setString(6, rphone2);
		pstmt.setString(7, rphone3);
		pstmt.setString(8, remail);
		pstmt.setString(9, rstat);
		
		int cnt = pstmt.executeUpdate();
		
		if(cnt > 0){
%>
			<script>
			alert("예약에 성공했습니다");
			location.href = "home.jsp";
			</script>
<%
		}
		
		pstmt.close();

	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
%>			<script>
		alert("예약에 실패했습니다");
		window.history.back();
		</script>
<%
		e.printStackTrace();
	} finally {
		try{ if(conn!=null) conn.close(); } catch(SQLException e) {}
	}




%>
	
	</section>
	
	<!-- footer -->
	<footer>
		<p>
			KOREA Copyright&copy;2018 All rights reserved.<br>
			Human Resources Development Service of Korea.
		</p>
	</footer>
	</body>
</html>









