<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-08
  Time: 오후 3:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <style>
        *{font-family: gulim; font-size: 24px}
    </style>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <title>list.jsp</title>
</head>
<body>

    <div class="title">미디어 그룹 목록</div>
    <div class="content">
        <input type="button" value="그룹등록" onclick="location.href='create.do'">
    </div>

    <c:if test="${requestScope.count==0}">
        <table><tr><td>해당 글이 존재하지 않습니다</td></tr></table>
    </c:if>

    <c:if test="${requestScope.count>0}">
        <table>
            <tr>
                <th>글번호</th>
                <th>그룹번호</th>
                <th>그룹제목</th>
                <th>수정/삭제</th>
            </tr>
            <c:forEach var="dto" items="${list}">
                <tr>
                    <td>${dto.rnum}</td>
                    <td>${dto.mediagroupno}</td>
                    <td><a href="../media/list.do?mediagroupno=${dto.mediagroupno}">${dto.title}</a></td>
                    <td>
                        <input type="button" value="수정" onclick="location.href='update.do?mediagroupno=${dto.mediagroupno}'">
                        <input type="button" value="삭제" onclick="location.href='delete.do?mediagroupno=${dto.mediagroupno}'">
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <%--페이징--%>
    <c:if test="${count>0}"> <%-- 리스팅 할 글이 존재할 때 --%>
        <c:set var="pageCount" value="${totalPage}"></c:set> <%--전체 페이지 수--%>
        <c:set var="startPage" value="${startPage}"></c:set> <%--시작 페이지 번호-1--%>
        <c:set var="endPage" value="${endPage}"></c:set> <%--끝 페이지 번호+1--%>

        <div class="content">
            <c:if test="${endPage>pageCount}"> <%--페이징의 끝 번호가 전체 페이지 수 보다 클때--%>
                <c:set var="endPage" value="${pageCount+1}"/> <%--끝페이지번호 = 전체페이지수+1--%>
            </c:if>

            <c:if test="${startPage>0}"> <%--첫번째 페이징이 아닐 때--%>
                <a href="./list.do?pageNum=${startPage}">[<<]</a> <%--시작 페이지 번호-1 을 [이전]으로 출력 --%>
            </c:if>

            <c:forEach var="i" begin="${startPage+1}" end="${endPage-1}"> <%--시작페이지~끝페이지 순환--%>
                <c:choose>
                    <c:when test="${pageNum==i}"><span style="font-weight: bold;">${i}</span></c:when> <%--페이지넘버일 때 클릭X, 글씨체 강조--%>
                    <c:when test="${pageNum!=i}"><a href="./list.do?pageNum=${i}">[${i}]</a></c:when> <%--해당 페이지가 아닐때, 태그설정--%>
                </c:choose>
            </c:forEach>

            <c:if test="${endPage<=pageCount}"> <%--페이징의 끝번호가 전체 페이지 보다 작거나 같을 때--%>
                <a href="./list.do?pageNum=${startPage + pagePerBlock + 1}">[>>]</a> <%--페이징의 처음 번호+6 의 번호를 [다음]에 태그로 설정--%>
            </c:if>
        </div>
    </c:if>
</body>
</html>
