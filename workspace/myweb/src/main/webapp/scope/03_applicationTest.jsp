<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: itwill
  Date: 2023-04-18
  Time: 오후 5:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>03_applicationTest.jsp</title>
</head>
<body>
        <h3>내장 객체</h3>
<%--
        application 내장객체
        - ServletContext application
        - 사용자 모두가 공유하는 전역적 의미의 객체
        - 서버에 대한 정보를 관리하는 객체
--%>
<%
    // bbs폴더의 실제 물리적인 경로
    // D:\java202301\workspace\myweb\out\artifacts\myweb\bbs
    out.print(application.getRealPath("/bbs"));
    out.print("<hr>");

    // 톰캣 10 이상에서는 지원하지 않음
    //out.print(request.getRealPath("/bbs");

    // application 내부 변수
    application.setAttribute("uid", "WILL");
    out.print(application.getAttribute("uid"));
    out.print("<hr>");

    // response 내장객체 - 요청한 사용자에게 응답할 때
    // responst.sendRedirect("") 페이지 이동

    // 요청한 사용자에게 응답메세지 전송 (AJAX에서 많이 사용)
    PrintWriter print = response.getWriter();


%>

</body>
</html>
