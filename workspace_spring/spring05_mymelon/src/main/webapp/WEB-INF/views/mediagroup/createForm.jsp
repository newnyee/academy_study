<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-08
  Time: 오전 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        *{font-family: gulim; font-size: 24px}
    </style>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <title>createForm.jsp</title>
</head>
<body>
    <div class="title">미디어 그룹 등록</div>
    <form name="frm" method="post" action="create.do">
        <table class='table'>
            <tr>
                <th>미디어 그룹 제목</th>
                <td><input type='text' name='title' size='50' value='2023년 댄스 음악'></td>
            </tr>
        </table>

        <div class="bottom">
            <input type="submit" value="등록">
            <input type="button" value="목록" onclick="location.href='list.do'">
        </div>
    </form>

</body>
</html>
