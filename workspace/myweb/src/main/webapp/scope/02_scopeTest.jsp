<%--
  Created by IntelliJ IDEA.
  User: itwill
  Date: 2023-04-18
  Time: 오후 3:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>02_scopeTest.jsp</title>
</head>
<body>

    <h3>웹 페이지 내부 변수의 SCOPE(유효범위)</h3>
<%--
    페이지 이동 방법
    1) <a href=""></a>
    2) <form action=""></form>
    3) <script>location.href=""<script>
    4) <jsp:forward page=""></jsp:forward>
    5) response.sendRedirect("");
--%>
<%
    pageContext.setAttribute("one", 100);
    request.setAttribute("two", 200);
    session.setAttribute("three", 300);
    application.setAttribute("uid", "uid");
%>
<%-- 1) 앵커태그 : <a href=""></a>
        request scope 적용안됨
    <a href="02_scopeResult.jsp">[SCOPE 결과 페이지 이동]</a>
--%>

<%-- 2) 폼태그 : <form action=""></form>
        request scope 적용안됨
    <form action="02_scopeResult.jsp">
        <input type="submit" value="[SCOPE 결과 페이지 이동]">
    </form>
--%>

<%-- 3) 자바스크립트 : <script>location.href=""<script>
        request scope 적용안됨
    <script>
        alert("[SCOPE 결과 페이지 이동]")
        location.href="02_scopeResult.jsp"
    </script>
--%>

<%-- 4) 액션태그 : <jsp:forward page=""></jsp:forward>
        request scope 적용됨
<jsp:forward page="02_scopeResult.jsp"></jsp:forward>
--%>

<%-- 5) response.sendRedirect("");
        request scope 적용안됨
    response.sendRedirect("02_scopeResult.jsp");
--%>

<%
    String view = "02_scopeResult.jsp";
    RequestDispatcher rd = request.getRequestDispatcher(view);
    rd.forward(request, response);
%>
<%--
    내부변수        02_scopeTest.jsp(부모)        02_scopeResult.jsp(자식)
    ------------------------------------------------------------------------
    pageContext                O                               X
    request                    O                 페이지 이동방식에 따라 다름
    session                    O                               O
    application                O                               O
--%>
</body>
</html>