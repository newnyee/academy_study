<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
    [Directive(지시자)의 종류]
    <%@ page %>
    <%@ include file="" %> 공통펭이지 삽입할 때
    <%@ taglib prefix="" %> Custom tag (사용자 정의 태그) 사용할 때
--%>

<%-- JSTL을 사용하려면 Directive를 지정한다 --%>
<%--prefix : 커스텀 태그는 접두어로 c를 붙여 쓰겠다는 의미--%>
<%--uri : 커스텀 태그 라이브러리 위치 지정--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>jstlTest1.jsp</title>
</head>
<body>

    <h3> JSTL (JSP Standard Tag Library, JSP 전용 태그) </h3>

    1) JSP 변수 선언<br>
    <% int a = 3; %>
    a = <%=a%>
    <hr>

    2) JSTL 변수 선언<br>
    <c:set var="b" value="5"></c:set> <%-- b=5 --%>
    <c:set var="c" value="7"/> <%-- c=7 --%>
    b = ${b} <br>
    c = ${c} <br>
    b+c = ${b+c}
    <hr>

    3) 출력<br>
    <c:out value="2"/><br> <%--out.println와 같음--%>
    <c:out value="${b}"/><br>
    <c:out value="${c}"/><br>
    <c:out value="${b+c}"/>
    <hr>

    4) b, c 변수 제거<br>
    <c:remove var="b"/><br>
    <c:remove var="c"/><br>
    <c:out value="${b}"/><br> <%--빈문자열--%>
    <c:out value="${c}"/><br> <%--빈문자열--%>
    <c:out value="${b+c}"/> <%--0--%>
    <hr>

    5) 자바 객체 선언도 가능<br>
    <c:set var="dt" value="<%=new Date()%>"></c:set>
    오늘 날짜 : ${dt} <br>
    오늘 날짜 : <c:out value="${dt}"></c:out> <br>


</body>
</html>