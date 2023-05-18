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
    <title>My web - ID 중복 확인</title>
</head>
<body>
    <%--회원가입 아이디 중복확인 프로세스--%>
    <div style="text-align: center">
        <h4>아이디 중복 확인</h4>
<%
        String id = request.getParameter("id").trim();
        int cnt = dao.duplecateID(id);
        out.println("입력 ID : <strong>" + id + "</strong>");

        if(cnt == 0) {
            out.println("<p>사용 가능한 아이디 입니다</p>");
%>
        <%--사용 가능한 id를 부모창(opener)에 전달하기--%>
        <a href="javascript:apply('<%=id%>')">[ID적용]</a>
<%
        } else {
            out.println("<p style='color:red'>해당 아이디는 사용할 수 없습니다</p>");
%>
        <hr>
        <a href="javascript:history.back()">[ID재입력]</a>
        <a href="javascript:window.close()">[창닫기]</a>
<%      } %>

        <script>
            const apply = (id) => {
                opener.document.memfrm.id.value = id;
                window.close();
            }
        </script>
    </div>
</body>
</html>
