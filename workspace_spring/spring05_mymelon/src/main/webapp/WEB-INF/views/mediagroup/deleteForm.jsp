<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-08
  Time: 오후 5:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        *{font-family: gulim; font-size: 24px}
    </style>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <title>deleteForm.jsp</title>
</head>
<body>

    <div class="title">미디어 그룹 삭제</div>
    <form name="frm" method="post" action="delete.do">
        <input type="hidden" name="mediagroupno" value="${requestScope.mediagroupno}">
        <div class="content">
            <strong><p style="font-size: large">미디어 그룹을 삭제하시겠습니까?</p></strong>
            <p style="color: red">※ 관련 미디어 파일(mp3, mp4)도 전부 삭제됩니다</p>
        </div>
        <div class="bottom">
            <input type="submit" value="삭제">
            <input type="button" value="목록" onclick="location.href='list.do?mediagroupno=${mediagroupno}'">
        </div>
    </form>

</body>
</html>
