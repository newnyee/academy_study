<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-01
  Time: 오후 12:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>elTest4.jsp</title>
</head>
<body>
    <h3> JSP와 EL의 값 공유 </h3>
<%
    //JSP와 EL은 현재 페이지에서는 서로 값을 공유할 수 없다
    String uname = "아이티윌";
%>
    이름(JSP) : <%=uname%> <%--아이티윌 출력--%>
    이름(EL) : ${uname} <%--빈문자열 출력--%>
    <hr>
<%
    // 현재 페이지에서 JSP와 EL이 서로 값을 공유하기 위해서는 pageScope를 활용한다.
    pageContext.setAttribute("uid", "KOREA");
%>
    아이디(JSP) : <%=pageContext.getAttribute("uid")%><br> <%--KOREA--%>
    아이디(EL) : ${pageScope.uid}<br> <%--KOREA--%>
    아이디(EL) : ${uid} <%--KOREA--%>


</body>
</html>
