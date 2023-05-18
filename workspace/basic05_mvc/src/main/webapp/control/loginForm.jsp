<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>loginForm.jsp</title>
</head>
<body>

    <h3> 회원 로그인 </h3>
    <form method="post" action="loginproc.do">
        아이디 : <input type="text" name="uid"><br>
        비번  : <input type="password" name="upw"><br>
        <input type="submit" value="확인">
    </form>
    <%--
        1) JSP 페이지 호출
        http://localhost:9090/basic05_mvc/control/loginForm.jsp

        2) 서블릿을 이용해서 JSP 페이지 호출
        http://localhost:9090/basic05_mvc/login.do
    --%>

</body>
</html>
