<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-24
  Time: 오후 3:20
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
    <title>order_result</title>
</head>
<body>
    <div class="container">
        <h3 align="center">주문 결과</h3>
    <c:choose>
    <%--주문 성공--%>
    <c:when test='${orderResult.equals("1")}'>
        <div>주문이 완료되었습니다!</div>
        <div><span>주문번호 : <strong>${orderno}</strong></span></div>
        <div>
            <input type="button" class="btn" value="쇼핑하러가기" onclick="location.href='/product/list'">
            <input type="button" class="btn" value="주문상세보기" onclick="location.href='/order/orderdetail'">
        </div>
    </c:when>

    <%--주문 실패--%>
    <c:when test='${orderResult.equals("0")}'>
        <div>주문에 실패하였습니다</div>
        <div>
            <input type="button" class="btn" value="주문재시도" onclick="javascript:history.back()">
            <input type="button" class="btn" value="장바구니" onclick="location.href='/cart/list'">
        </div>
    </c:when>
    </c:choose>
    </div>
</body>
</html>
