<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-08
  Time: 오후 5:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        *{font-family: gulim; font-size: 24px}
    </style>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <title>msgView.jsp</title>
</head>
<body>

    <div class="title">알림</div>
    <div class="content">
        <dl>
            <dd>${msg1 != null ? img : ""} ${msg1}</dd>
            <dd>${msg2 != null ? img : ""} ${msg2}</dd>
            <dd>${msg3 != null ? img : ""} ${msg3}</dd>
        </dl>
        <p>
            ${link1} ${link2} ${link3}
        </p>
    </div>

</body>
</html>
