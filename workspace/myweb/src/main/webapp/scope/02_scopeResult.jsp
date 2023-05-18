<%--
  Created by IntelliJ IDEA.
  User: itwill
  Date: 2023-04-18
  Time: 오후 4:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>02_scopeResult.jsp</title>
</head>
<body>
    <h3>웹 페이지 내부 변수의 SCOPE(유효범위) 결과</h3>
<%
  out.print("1) pageContext 영역: " + pageContext.getAttribute("one") + "<hr>");
  out.print("2) request 영역: " + request.getAttribute("two") + "<hr>");
  out.print("3) session 영역: " + session.getAttribute("three") + "<hr>");
  out.print("4) application 영역: " + application.getAttribute("uid") + "<hr>");
%>
</body>
</html>
