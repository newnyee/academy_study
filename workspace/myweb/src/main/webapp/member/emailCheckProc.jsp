<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="ssi.jsp"%>
<!doctype html>
<html lang=ko>
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>My web - email 중복 확인</title>
</head>
<body>
  <%--회원가입 이메일 중복확인 프로세스--%>
  <div style="text-align: center">
    <h4>이메일 중복 확인</h4>
    <%
      String email = request.getParameter("email").trim();
      int cnt = dao.duplicateEmail(email);
      out.println("입력 e-mail : <strong>" + email + "</strong>");

      if(cnt == 0) {
        out.println("<p>사용 가능한 이메일 입니다</p>");
    %>
    <%--사용 가능한 email를 부모창(opener)에 전달하기--%>
    <a href="javascript:apply('<%=email%>')">[e-mail적용]</a>
    <%
    } else {
      out.println("<p style='color:red'>해당 이메일은 사용할 수 없습니다</p>");
    %>
    <hr>
    <a href="javascript:history.back()">[e-mail재입력]</a>
    <a href="javascript:window.close()">[창닫기]</a>
    <% } %>

    <script>
      const apply = (email) => {
        opener.document.memfrm.email.value = email;
        window.close();
      }
    </script>
  </div>
</body>
</html>
