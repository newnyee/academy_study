<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
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
    <link rel="stylesheet" href="../css/bootstrap_Morph.min.css">
   	<title>travleList.jsp</title>
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
		body{margin:50px}
		nav{padding-bottom: 30px;}
		.headerdiv{margin:10px}
		h3{text-align:center; padding-bottom :15px;}
	</style>
</head>
<body>
	<!-- header -->
	<header>
		<div class="headerdiv">
			<h3>여행 예약 프로그램</h3>
		</div>
	</header>
	
	<!-- nav -->
	<nav>
		<div class="container-fluid">
			<ul class="nav nav-tabs" role="tablist">
			   <li class="nav-item" role="presentation">
			      <a class="nav-link" data-bs-toggle="tab" href="home.jsp" aria-selected="false" role="tab" tabindex="-1">홈으로</a>
			   </li>
			   <li class="nav-item" role="presentation">
			      <a class="nav-link" data-bs-toggle="tab" href="travelBook.jsp" aria-selected="false" role="tab" tabindex="-1">예약등록</a>
			   </li>
			   <li class="nav-item" role="presentation">
			      <a class="nav-link  active" data-bs-toggle="tab" href="travelList.jsp" aria-selected="false" role="tab" tabindex="-1">예약조회</a>
			   </li>
			</ul>
		</div>
	</nav>
	
	<!-- main -->
	<section>
		<div class="container-fluid">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">예약번호</th>
						<th scope="col">주민번호</th>
						<th scope="col">성명</th>
						<th scope="col">성별</th>
						<th scope="col">전화번호</th>
						<th scope="col">여행상품</th>
						<th scope="col">상태</th>
						<th scope="col">금액</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
<%
	Connection conn = null;
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
		String sql = new StringBuilder()
				.append("select rno, rjumin, rname, rphone1, rphone2, rphone3, a.tcode, ")
				.append("tarea, tdate, ttime, thotel, tair, rstat, tmoney ")
				.append("from tbl_reserve_01 a ")
				.append("join tbl_tourcode_02 b ")
				.append("on a.tcode = b.tcode ")
				.append("order by rno")
				.toString();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			String rno = rs.getString("rno");
			String rjumin = rs.getString("rjumin").substring(0,6) + "-" + rs.getString("rjumin").substring(6);
			String rname = rs.getString("rname");
			String sex = "";
			String sexNum = rjumin.substring(6, 7);
			if(sexNum.equals("1")) {
				sex = "남";
			} else {
				sex = "여";
			}
			String phone = new StringBuilder()
					.append(rs.getString("rphone1"))
					.append("-")
					.append(rs.getString("rphone2"))
					.append("-")
					.append(rs.getString("rphone3"))
					.toString();
			String travelProduct = new StringBuilder()
					.append(rs.getString("tcode"))
					.append("-")
					.append(rs.getString("tarea"))
					.append("-")
					.append(rs.getString("tdate"))
					.append("-")
					.append(rs.getString("tarea"))
					.append("/")
					.append(rs.getString("ttime"))
					.append("/")
					.append(rs.getString("thotel"))
					.append("/")
					.append(rs.getString("tair"))
					.toString();					
			String rstat = rs.getString("rstat");
			if(rstat.equals("1")) {
				 rstat = "미납";
			} else {
				rstat = "완납";
			}
			String tmoney = String.format("￦ %,d", rs.getInt("tmoney"));
			/* String tmoney = rs.getString("tmoney");
			int size = tmoney.length();
			if(size%3 == 1) {
				for(int i=0; i<size/3; i++){
					tmoney = new StringBuilder()
							.append(tmoney)
							.insert(1 + i*4, ",")
							.toString();
				}
			} else if(size%2==2) {
				for(int i=0; i<size/3; i++){
					tmoney = new StringBuilder()
							.append(tmoney)
							.insert(2 + i*4, ",")
							.toString();
				}
			} else {
				for(int i=0; i<size/3-1; i++){
					tmoney = new StringBuilder()
							.append(tmoney)
							.insert(3 + i*4, ",")
							.toString();
				}
			}
			tmoney = "￦" + tmoney; */

			%>
			<tr>
				<td><%=rno%></td>
				<td><%=rjumin%></td>
				<td><%=rname%></td>
				<td><%=sex%></td>
				<td><%=phone%></td>
				<td><%=travelProduct%></td>
				<td><%=rstat%></td>
				<td><%=tmoney%></td>
				<td>
					<input class="btn btn-primary btn-sm" type="button" value="수정" onclick="location.href='travelUpdate.jsp?rno=<%=rno%>'">
					<input class="btn btn-primary btn-sm" type="button" value="삭제" onclick="location.href='travelDel.jsp?rno=<%=rno%>'">
				</td>
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
		try { if(conn != null) conn.close(); } catch(SQLException e){}
	}

%>
				</tbody>
			</table>
		</div>
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









