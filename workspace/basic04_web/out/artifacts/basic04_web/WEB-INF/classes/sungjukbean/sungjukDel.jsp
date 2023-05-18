<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="net.sungjuk.*"%>
<jsp:useBean id="dao" class="net.sungjuk.SungjukDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="net.sungjuk.SungjukDTO" scope="page"></jsp:useBean>
<%request.setCharacterEncoding("UTF-8"); %>
<html>
  <head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <title>Insert title here</title>
  </head>
  <body>
  <div class="container mt-3">
    <h3>성적 삭제</h3>

    <%
      int sno = Integer.parseInt(request.getParameter("sno"));
      int cnt = dao.delete(sno);

      if(cnt == 0) {
        out.println("<p>성적 삭제에 실패했습니다</p>");
        out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
      } else {
%>
    <div class="alert alert-dismissible alert-secondary">
      <a href='sungjukList.jsp'><button type="button" class="btn-close"></button></a>
      성적이 삭제되었습니다
    </div>
<%
      }
    %>

  </div>
  </body>
</html>
