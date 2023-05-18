<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>jstlTest2ok2.jsp</title>
</head>
<body>

    <h3> 결과페이지(JSTL) </h3>
    <c:set var="name" value="${param.name}"/>
    <c:set var="age" value="${param.age}"/>
    이름 : ${name} / <c:out value="${name}"></c:out> <br>
    나이 : ${age} / <c:out value="${age}"></c:out> <br>
    <hr>

    <%-- if 문 --%>
    <c:if test="${name=='itwill'}">무궁화</c:if>

    <%-- else-if 문 --%>
    <c:choose>
        <c:when test="${age<10}">어린이</c:when>
        <c:when test="${age<20}">청소년</c:when>
        <c:otherwise>성인</c:otherwise>
    </c:choose>
    <hr>

    <%-- for문 --%>
    <c:forEach var="a" begin="1" end="${age}" step="1">
        <c:out value="#"></c:out>
    </c:forEach>
    <hr>

    <%-- for문 + if문 --%>
    <c:forEach var="a" begin="1" end="${age}" step="1">
        <c:choose>
            <c:when test="${a%2 == 0}">
                <span style='color:blue'>${a}</span>
            </c:when>
            <c:otherwise>
                <span style='color:red'>${a}</span>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <hr>

    <%-- <c:forEach var="a" items=""> for in문 --%>

    <c:forEach var="b" begin="10" end="30" step="10" varStatus="vs"> <%--step은 생략하면 1로 자동 설정됨--%>
        <%-- varStatus="상태용 변수" --%>
        ${vs.current} 현재 for문의 해당하는 값 <br> <%--현재 for문의 해당하는 값--%>
        ${vs.index} 0부터의 순서 <br> <%--0부터의 순서--%>
        ${vs.count} 반복횟수 <br> <%--반복횟수--%>
        ${vs.first} 반복문 첫 번째인지 여부 <br> <%--반복문 첫 번째인지 여부--%>
        ${vs.last} 마지막 반복문인지 여부 <br> <%--마지막 반복문인지 여부--%>
        ${vs.begin} for문의 시작값 <br> <%--for문의 시작값--%>
        ${vs.end} for문의 마지막값 <br> <%--for문의 마지막값--%>
        ${vs.step} for문의 증가값 <%--for문의 증가값--%>
        <hr>
    </c:forEach>

</body>
</html>
