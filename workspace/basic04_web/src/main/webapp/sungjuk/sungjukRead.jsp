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
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <title>sungjukRead.jsp</title>
</head>
<body>
	<div class="container mt-3">
	    <h3>성적 상세보기</h3>
	    <p>
	        <a href="sungjukForm.jsp"><button class="btn btn-secondary">성적입력</button></a>
	        <a href="sungjukList.jsp"><button class="btn btn-primary">성적목록</button></a>
	    </p>
<%
		request.setCharacterEncoding("utf-8");
		int sno = Integer.parseInt(request.getParameter("sno"));
		
		Connection con = null; //db 연결
		try {
		    Class.forName("oracle.jdbc.driver.OracleDriver");
		    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "system", "1234");
		    System.out.println("오라클DB 서버 연결 성공");
		    
		    String sql = new StringBuilder()
		    		.append("SELECT sno, uname, kor, eng, mat, aver, addr, wdate ")
		    		.append("FROM sungjuk ")
		    		.append("WHERE sno=?")
		    		.toString();
		
		    PreparedStatement pstmt = con.prepareStatement(sql);
		    pstmt.setInt(1, sno);
		    
		    ResultSet rs = pstmt.executeQuery();
		    
		    while (rs.next()) {
%>
        <div class="form-group">
	        <table class="table">
	            <tr>
	                <th class="table-secondary">이름</th>
	                <td><%=rs.getString("uname") %></td>
	            </tr>
	            <tr>
	                <th class="table-secondary">국어</th>
	                <td><%=rs.getInt("kor") %></td>
	            </tr>
	            <tr>
	                <th class="table-secondary">영어</th>
	                <td><%=rs.getInt("eng") %></td>
	            </tr>
	            <tr>
	                <th class="table-secondary">수학</th>
	                <td><%=rs.getInt("mat") %></td>
	            </tr>
	            <tr>
	                <th class="table-secondary">평균</th>
	                <td><%=rs.getInt("aver") %></td>
	            </tr>
	            <tr>
	                <th class="table-secondary">주소</th>
<%					String addr = rs.getString("addr");
					
					if(addr.equals("Seoul")){
						addr = "서울";
					} else if (addr.equals("Jeju")) {
						addr = "제주";
					} else if (addr.equals("Suwon")) {
						addr = "수원";
					} else {
						addr = "부산";
					}
%>
	                <td><%=addr %></td>
	            </tr>
	            <tr>
	                <th class="table-secondary">작성일</th>
	                <td><%=rs.getString("wdate").substring(0, 10) %></td>
	            </tr>
	        </table>
	        <a href="sungjukUpdate.jsp?sno=<%=sno%>"><button class="btn btn-secondary">수정</button></a>
            <button class="btn btn-primary" id="delete">삭제</button>
        </div>
    </div>
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
    <script>
        document.addEventListener("DOMContentLoaded", ()=>{
            const button = document.getElementById("delete")
            button.addEventListener('click', ()=>{
                if(confirm('성적을 삭제하시겠습니까?')) {
                    location.href='sungjukDel.jsp?sno=<%=sno%>'
                }
            })
        })
    </script>
</body>
</html>