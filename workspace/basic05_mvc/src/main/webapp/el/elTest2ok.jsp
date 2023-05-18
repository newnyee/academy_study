<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-01
  Time: 오전 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>elTest2ok.jsp</title>
</head>
<body>
    <h3> EL 파라미터 결과 </h3>

    1) JSP 방식 <br>
    아이디 : <%=request.getParameter("id")%> <br>
    비밀번호 : <%=request.getParameter("pw")%> <br>

    2) EL 방식 <br>
    아이디 : ${param.id} <br>
    비밀번호 : ${param.pw} <br>
</body>
</html>
