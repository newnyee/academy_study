<%--
  Created by IntelliJ IDEA.
  User: itwill
  Date: 2023-04-25
  Time: 오후 12:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>uploadeTest.jsp</title>
</head>
<body>
    <h3>파일 첨부 테스트</h3>
    <form method="post" action="uploadTestProc.jsp" enctype="multipart/form-data"> <%--문자열 정보와 파일 정보를 동시에 전송--%>
        이름: <input type="text" name="uname"> <br>
        제목: <input type="text" name="subject"> <br>
        내용: <textarea rows="5" cols="20" name="content"></textarea> <br>
        첨부: <input type="file" name="filenm">
        <input type="submit" value="전송">
    </form>

</body>
</html>
