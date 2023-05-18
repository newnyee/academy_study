<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-04
  Time: 오전 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>calcResult.jsp</title>
</head>
<body>

    <h2>계산 결과</h2>

    <h3>1) JSP</h3>
    <%=request.getAttribute("message")%><br>
    숫자1 : <%=request.getAttribute("no1")%><br>
    숫자2 : <%=request.getAttribute("no2")%><br>
    결과 : <%=request.getAttribute("result")%><br>
    <%=request.getAttribute("img")%>
    <hr>

    <h3>2) EL</h3>
    ${message}<br>
    숫자1 : ${no1}<br>
    숫자2 : ${no2}<br>
    결과 : ${result}<br>
    ${img==null ? "" : img}
    <hr>

    <h3>3) EL</h3>
    ${requestScope.message}<br>
    숫자1 : ${requestScope.no1}<br>
    숫자2 : ${requestScope.no2}<br>
    결과 : ${requestScope.result}<br>
    ${requestScope.img}
    <hr>

</body>
</html>
