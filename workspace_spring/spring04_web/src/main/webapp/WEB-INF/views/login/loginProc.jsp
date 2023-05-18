<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-04
  Time: 오후 5:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>loginProc.jsp</title>
</head>
<body>

    <h3>로그인 결과</h3>
    <strong>1) JSP</strong><br>
    <%=request.getAttribute("message")%><br>
    아이디(세션) : <%=session.getAttribute("s_id")%><br>
    비번(세션) : <%=session.getAttribute("s_pw")%><br>
    <hr>

    <strong>2) EL</strong><br>
    ${requestScope.message}<br>
    아이디(세션) : ${sessionScope.s_id}<br>
    비번(세션) : ${sessionScope.s_pw}<br><br>

    ${message}<br>
    아이디(세션) : ${s_id}<br>
    비번(세션) : ${s_pw}<br><br>


</body>
</html>
