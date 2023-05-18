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
    <title>updateForm.jsp</title>
</head>
<body>
    <div class="title">음원 수정</div>
    <form name="frm" id="update" method="post" action="update.do" enctype="multipart/form-data" onsubmit="return mediaFormCheck()">
        <input type="hidden" name="mediagroupno" value="${dto.mediagroupno}">
        <input type="hidden" name="mediano" value="${dto.mediano}">
        <table class='table'>
            <tr>
                <th>제목</th>
                <td><input type='text' name='title' id="title" size='50' value="${dto.title}"></td>
            </tr>
            <tr>
                <th>포스터</th>
                <td>
                    <img src="../storage/${dto.poster}" width="100px"><br>
                    <input type='file' name='posterMF' id="posterMF" size='50'>
                </td>
            </tr>
            <tr>
                <th>미디어 파일</th>
                <td>
                    등록된 파일명 : ${dto.filename}<br>
                    <input type='file' name='filenameMF' id="filenameMF" size='50'>
                </td>
            </tr>
        </table>

        <div class="bottom">
            <input type="submit" value="음원수정">
            <input type="button" value="취소" onclick="location.href='list.do?mediagroupno=${dto.mediagroupno}'">
            <input type="button" value="HOME" onclick="location.href='/home.do'">
        </div>
    </form>
</body>
</html>
