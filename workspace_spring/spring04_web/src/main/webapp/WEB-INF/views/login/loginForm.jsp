<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-04
  Time: 오후 4:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>loginForm.jsp</title>
</head>
<body>
    <h3>로그인</h3>
    <form method="post" action="login.do">
        <table border="1">
            <tr>
                <td colspan="2" align="center">* 로그인 *</td>
            </tr>
            <tr>
                <td>아이디</td>
                <td><input type="text" name="id" size="20"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="pw" size="20"></td>
            </tr>
            <tr>
                <td colspan=2 align=center>
                    <input type="submit" value="확인">
                    <input type="reset"  value="취소">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
