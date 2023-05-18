<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>loginResult.jsp</title>
</head>
<body>
    <h3> 로그인 결과 </h3>

    1) JSP<br><br>

    아이디 : <strong><%=request.getAttribute("r_uid")%></strong><br>
    비밀번호 : <strong><%=request.getAttribute("r_upw")%></strong><br>
    <br>
    아이디 : <strong><%=session.getAttribute("s_uid")%></strong><br>
    비밀번호 : <strong><%=session.getAttribute("s_upw")%></strong><br>
    <br>
    아이디 : <strong><%=application.getAttribute("a_uid")%></strong><br>
    비밀번호 : <strong><%=application.getAttribute("a_upw")%></strong><br>
    <br>
    <%=request.getAttribute("msg")%>
    <%=request.getAttribute("img")%>
    <hr><hr>

    2) EL(표현언어)<br><br>

    <%-- Scope는 생략 가능하다 --%>
    <%-- ServletContext 순환 순서 : pageContext → request → session → appication --%>
    아이디 : ${requestScope.r_uid}<br>
    비번 : ${r_upw}<br>
    <br>
    아이디 : ${sessionScope.s_uid}<br>
    비번 : ${s_upw}<br>
    <br>
    아이디 : ${applicationScope.a_uid}<br>
    비번 : ${a_upw}<br>
    <br>
    ${msg}
    ${img}<br>

</body>
</html>