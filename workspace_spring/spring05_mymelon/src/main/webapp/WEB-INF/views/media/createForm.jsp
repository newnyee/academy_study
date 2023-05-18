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
    <script src="../js/myScript.js"></script>
    <title>createForm.jsp</title>
</head>
<body>
    <div class="title">음원 등록</div>
    <form name="frm" id="create" method="post" action="create.do" enctype="multipart/form-data" onsubmit="return mediaFormCheck()">
        <input type="hidden" name="mediagroupno" value="${mediagroupno}">
        <table class='table'>
            <tr>
                <th>제목</th>
                <td><input type='text' name='title' id="title" size='50'></td>
            </tr>
            <tr>
                <th>포스터</th>
                <td><input type='file' name='posterMF' id="posterMF" size='50'></td>
            </tr>
            <tr>
                <th>미디어 파일</th>
                <td><input type='file' name='filenameMF' id="filenameMF" size='50'></td>
            </tr>
        </table>

        <div class="bottom">
            <input type="submit" value="음원등록">
            <input type="button" value="음원목록" onclick="location.href='list.do?mediagroupno=${mediagroupno}'">
            <input type="button" value="HOME" onclick="location.href='/home.do'">
        </div>
    </form>
</body>
</html>
