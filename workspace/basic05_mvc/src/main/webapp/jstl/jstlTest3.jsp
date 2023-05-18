<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>jstlTest3.jsp</title>
</head>
<body>

    <h3> JSTL 함수 </h3>
    <c:set var="txt" value="   White   Space   "></c:set>
    글자갯수 : ${fn:length(txt)}
    <hr>
    공백제거 : ${fn:trim(txt)} <%--공백하나는 문자로 취급함--%>
    <hr>

    <c:set var="str" value="Hi My name is waldo"/>
    문자열 자르기 : ${fn:substring(str, 3, 10)} <%--인덱스번호 3~9까지--%>
    <hr>
    ${fn:toLowerCase(str)} <br>
    ${fn:toUpperCase(str)}
    <hr>
<%
    //엔터를 <br>로 바꾸기

    // 1) JSP
    String content = "";
    content = content.replace("\n", "<br>");

    // 2) EL+JSTL
    pageContext.setAttribute("cn", "\n");
%>
    <c:set var="content" value="Hi
                                My name is
                                Waldo"/>
    ${content}
    <hr>
    ${fn:replace(content, cn, "<br>")}
    <hr>

    <%-- 3) <,>,&,'," 등 특수문자 변환 --%>
    <c:set var="text" value="Hi
	                         My <name> is
	                         'W   a   l   d     o'"></c:set>

    ${fn:escapeXml(text)}
    <hr>
    ${fn:replace(fn:escapeXml(text), cn, "<br>")}
    <hr>
    ${fn:replace(fn:replace(fn:escapeXml(text), cn, "<br>"), ' ' , '&nbsp;')}

</body>
</html>
