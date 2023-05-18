<%@page import="java.awt.print.Printable"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <title>sungjukIns.jsp</title>
</head>
<body>
	<div class="container mt-3">
    <h3>성적 결과 페이지</h3>
<%
	// 한글 인코딩
	request.setCharacterEncoding("utf-8");
	
	// 사용자가 입력한 정보를 가져와서 변수에 담기
	String uname = request.getParameter("uname");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	String addr = request.getParameter("addr");
	
	// 평균 구하기
	int aver = (kor + eng +mat)/3;
	
	// Oracle DB 연결 및 행 추가 ----------------------------------------
	// sungjuk 테이블 전체 행 조회

    Connection con = null; //db 연결
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "system", "1234");
        System.out.println("오라클DB 서버 연결 성공");
 	    
        String sql = new StringBuilder()
        		.append("INSERT INTO sungjuk(sno, uname, kor, eng, mat, aver, addr, wdate) ")
        		.append("VALUES(sungjuk_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate)")
        		.toString();
        
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, uname);
        pstmt.setInt(2, kor);
        pstmt.setInt(3, eng);
        pstmt.setInt(4, mat);
        pstmt.setInt(5, aver);
        pstmt.setString(6, addr);
 	    
        int cnt = pstmt.executeUpdate();
        if(cnt==0) {
        	out.println("성적 입력에 실패했습니다");
        	out.println("<p><a href='javascript:history.back.jsp'>[다시시도]</a></p>");
        } else {
%>
        	
        	    <div class="alert alert-dismissible alert-secondary">
      				<a href='sungjukList.jsp'><button type="button" class="btn-close"></button></a>
      				성적입력이 완료되었습니다
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