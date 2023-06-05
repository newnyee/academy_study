<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-24
  Time: 오후 5:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="../../css/main.css" rel="stylesheet" type="text/css">
    <script src="../../js/jquery-3.6.4.min.js"></script>
    <title>order_detail</title>
</head>
<body>
    <div class="container">
        <div style="text-align: right">아이디 : ${sessionScope.get("s_id")}</div>
        <h3 align="center">주문 목록 보기</h3>
        <table class="table table-hover">
            <tr class="success" >
                <th>주문번호</th>
                <th>상품이름</th>
                <th>상품사진</th>
                <th>상품가격</th>
                <th>주문수량</th>
                <th>주문 날짜</th>
            </tr>
            <c:choose>
            <c:when test="${list.size()>0}">
            <c:forEach var="map" items="${list}">
            <tr>
                <td>${map.get("orderno")}</td>
                <td>${map.get("product_name")}</td>
                <td>${map.get("filename")}</td>
                <td>${map.get("price")}</td>
                <td>${map.get("qty")}</td>
                <td>${map.get("orderdate")}</td>
            </tr>
            </c:forEach>
            </c:when>
            <c:otherwise>
            <tr>
                <td colspan="6">주문하신 상품이 없습니다</td>
            </tr>
            </c:otherwise>
            </c:choose>
        </table>
        <div align="center">
            <input type="button" class="btn btn-success" value="쇼핑하러가기" onclick="location.href='/product/list'">
        </div>
    </div>
</body>
</html>
