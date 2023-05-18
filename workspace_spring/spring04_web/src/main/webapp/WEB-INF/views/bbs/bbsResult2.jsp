<%@ page import="ko.co.itwill.bbs.BbsDTO" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-04
  Time: 오전 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>calcResult.jsp</title>
</head>
<body>

    <h2>글쓰기 결과</h2>

    <strong>1) JSP</strong><br>
<%
    BbsDTO bdto = (BbsDTO) request.getAttribute("dto");
    out.println("작성자 : " + bdto.getWname() + "<br>");
    out.println("제목 : " + bdto.getSubject() + "<br>");
    out.println("내용 : " + bdto.getContent() + "<br>");
    out.println("비번 : " + bdto.getPasswd() + "<br>");
%>  <hr>

    <strong>2) EL</strong><br>
    <%-- BbsDTO 클래스에 반드시 getter, setter함수가 있어야 함 --%>
    작성자 : ${dto.wname}<br>
    제목 : ${dto.subject}<br>
    내용 : ${dto.content}<br>
    비번 : ${dto.passwd}<br>

</body>
</html>
