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
	<title>sungjukUpdate.jsp</title>
</head>
<body>
    <div class="container mt-3">
        <h3>성적 수정</h3>
        <p>
            <a href="sungjukForm.jsp"><button class="btn btn-secondary">성적입력</button></a>
            <a href="sungjukList.jsp"><button class="btn btn-primary">성적목록</button></a>
        </p>
    <%
        // 수정하고자 하는 글 번호 sungjukUpdate.jsp?sno=
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
            if (rs.next()) {
                
                String uname = rs.getString("uname");
                int kor = rs.getInt("kor");
                int eng = rs.getInt("kor");
                int mat = rs.getInt("mat");
                String addr = rs.getString("addr");
    %>
    <div class="form-group">
        <form class="form-horizontal" name="sungjukfrm" id="sungjukfrm" method="post" action="sungjukUpdateProc.jsp" >
        <!-- 사용자에게는 필요한 값이 아니지만, 프로그램 흐름상 필요한 값은 hidden속성으로 담아서 넘긴다 -->
        <input type="hidden" name="sno" value="<%=sno %>">
            <table class="table">
                <tr>
                    <th class="table-secondary">이름</th>
                    <td><input type="text" class="form-control" name="uname" id="uname" value="<%=uname%>" maxlength="50" required autofocus></td>
                </tr>
                <tr>
                    <th class="table-secondary">국어</th>
                    <td><input type="number" class="form-control" name="kor" id="kor" value="<%=kor%>" size="6" min="0" max="100" placeholder="국어점수" required></td>
                </tr>
                <tr>
                    <th class="table-secondary">영어</th>
                    <td><input type="number" class="form-control" name="eng" id="eng" value="<%=eng%>" size="6" min="0" max="100" placeholder="영어점수" required></td>
                </tr>
                <tr>
                    <th class="table-secondary">수학</th>
                    <td><input type="number" class="form-control" name="mat" id="mat" value="<%=mat%>" size="6" min="0" max="100" placeholder="수학점수" required></td>
                </tr>
                <tr>
                    <th class="table-secondary">주소</th>
                    <td>
                        <select name="addr" id="addr" class="form-select">
                            <option value="Seoul" <% if(addr.equals("Seoul")) {out.print("selected");} %>>서울</option>
                            <option value="Jeju" <% if(addr.equals("Jeju")) {out.print("selected");} %>>제주</option>
                            <option value="Suwon" <% if(addr.equals("Suwon")) {out.print("selected");} %>>수원</option>
                            <option value="Busan" <% if(addr.equals("Busan")) {out.print("selected");} %>>부산</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button type="submit" class="btn btn-secondary">수정</button>
	                    <button type="reset" class="btn btn-primary">취소</button>
                    </td>
                </tr>
            </table>
        </form>
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
        </div>
    </div>
</body>
</html>