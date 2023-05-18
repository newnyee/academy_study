<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-04
  Time: 오후 5:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>msgView.jsp</title>
</head>
<body>

    <h3>로그인 결과</h3>
    ${requestScope.message}
    <p>${requestScope.link}</p>
    <hr>

    ${message}
    <p>${link}</p>

</body>
</html>
