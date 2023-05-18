<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-10
  Time: 오후 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
      *{font-family: gulim; font-size: 24px}
    </style>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <title>readMP3.jsp</title>
</head>
<body>
    <div class="title">음원 듣기</div>

    <div class="content">
        <p><stron>${dto.title}</stron></p>
        <img src="../storage/${dto.poster}" width="400px"><br>
        <audio src="../storage/${dto.filename}" controls></audio>
    </div>

    <div class="bottom">
        <input type="button" value="음원목록" onclick="location.href='list.do?mediagroupno=${dto.mediagroupno}'">
        <input type="button" value="HOME" onclick="location.href='/home.do'">
    </div>
</body>
</html>
