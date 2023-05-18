<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>errorTest.jsp</title>
</head>
<body>
    <h3>에러 메세지 확인</h3>
<%
    // 1) HTTP 상태 404 - 찾을 수 없음 (존재하지 않는 페이지 요청)
    // http://localhost:9090/basic05_mvc/error/list.jsp

    // 2) HTTP 상태 500 - 내부 서버 오류 (쿼리값을 넣지 않았을 경우)
    // http://localhost:9090/basic05_mvc/error/errorTest.jsp
    int num = Integer.parseInt(request.getParameter("kor"));
    out.print("num: " + num);

    // 에러가 발생하는 경우, 여러 메세지를 직접 출력하지 않고, 다른 페이지로 이동할 필요가 있음
    // /WEB-INF/main.webapp.xml 배치 관리자에서 지정
%>

</body>
</html>