<%@ page import="net.sungjuk.SungjukDAO" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Nooni
  Date: 2023-04-12
  Time: 오전 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="net.sungjuk.*" %>
<jsp:useBean id="dao" class="net.sungjuk.SungjukDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="net.sungjuk.SungjukDTO" scope="page"></jsp:useBean>
<jsp:include page="ssi.jsp"></jsp:include>
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
        <th>등수</th>
      </tr>
      </thead>
      <tbody>
<%
  ArrayList<SungjukDTO> list = dao.list();
  if(list== null) {
    out.println("<tr>");
    out.println(" <td colspan='5'>글없음</td>");
    out.println("</tr>");
  } else {
    for(int i=0; i<list.size(); i++) {
      dto=list.get(i);
%>
      <tr>
        <td><a href="sungjukRead.jsp?sno=<%=dto.getSno()%>"><%=dto.getUname()%></a></td>
        <td><%=dto.getAver()%></td>
        <td><%=dto.getRnum()%></td>
      </tr>
<%
    }
  }
%>
      </tbody>
    </table>
  </div>
  </body>
</html>
