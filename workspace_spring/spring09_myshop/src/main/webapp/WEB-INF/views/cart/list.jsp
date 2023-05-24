<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-23
  Time: 오전 11:43
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
    <title>cart_list</title>
    <script>
        const ordercheck = () => {
            if(${list.size()<1}) {
                alert("장바구니에 상품을 추가해주세요.")
            } else {
                if (confirm("주문/결제 페이지로 이동합니다.")) {
                    location.href = '/order/orderform'
                }
            }
        }
    </script>

</head>
<body>
    <div class="container">
        <div style="text-align: right">아이디 : ${sessionScope.get("s_id")}</div>
        <h3 style="text-align: center">장바구니</h3>
        <table class="table table-hover">
            <tr class="success" >
                <th>아이디</th>
                <th>번호</th>
                <th>상품이름</th>
                <th>상품사진</th>
                <th>상품가격</th>
                <th>상품수량</th>
                <th>삭제</th>
            </tr>
        <c:choose>
        <c:when test="${list.size()>0}">
        <c:forEach var="map" items="${list}">
            <tr>
                <td>${map.get("id")}</td>
                <td>${map.get("cartno")}</td>
                <td><a href="/product/detail/${map.get("product_code")}">${map.get("product_name")}</a></td>
                <td><a href="/product/detail/${map.get("product_code")}"><img src="/storage/${map.get("filename")}" width="50px"></a></td>
                <td><fmt:formatNumber value='${map.get("price")}' pattern="#,###"/>원</td>
                <td>${map.get("qty")}</td>
                <td>
                    <input type="button" class="btn btn-sm" value="삭제" onclick="location.href='/cart/delete?cartno=${map.get("cartno")}'">
                </td>
            </tr>
        </c:forEach>
        </c:when>

        <c:otherwise>
            <tr>
               <td colspan="7">장바구니에 담긴 상품이 없습니다</td>
            </tr>
        </c:otherwise>
        </c:choose>
        </table>
        <div align="center">
            <input class="btn btn-success" type="button" value="계속쇼핑하기" onclick="location.href='/product/list'">
            <input class="btn btn-success" type="button" value="전체주문/결제" onclick="ordercheck()">
        </div>
    </div>
</body>
</html>