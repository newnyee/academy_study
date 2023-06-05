<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-17
  Time: 오전 11:11
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
    <title>product_list</title>
</head>
<body>
    <div class="container">
        <div style="text-align: right">아이디 : ${sessionScope.get("s_id")}</div>
        <h3 align="center">상품 목록</h3>
        <p style="margin-left: 16px">
            <button class="btn btn-success" type="button" onclick="location.href='write'">상품등록</button>
            <button class="btn btn-success" type="button" onclick="location.href='list'">상품전체목록</button>
            <c:if test='${sessionScope.get("s_id")!=null}'>
            <input type="button" class="btn" value="주문목록보기" onclick="location.href='/order/orderdetail'">
            <input type="button" class="btn" value="장바구니" onclick="location.href='/cart/list'">
            </c:if>
        </p>
        <form action="search">
            <div class="col-xs-10">
                <input class="form-control" type="text" name="product_name" placeholder="상품명">
            </div>
            <input class="btn btn-success" type="submit" value="검색">
        </form>
        <hr>
        상품갯수: ${fn:length(list)}
        <br><br>
        <table class="table">
            <tr>
                <%-- varStatus="상태용 변수" --%>
                <c:forEach items="${list}" var="row" varStatus="vs">
                    <td>
                        <c:choose>
                            <c:when test="${row.FILENAME != '-'}">
                            <a href="detail/${row.PRODUCT_CODE}"><img src="/storage/${row.FILENAME}" width="100px"></a>
                            </c:when>
                            <c:otherwise>
                                등록된 사진 없음<br>
                            </c:otherwise>
                        </c:choose>
                        <br>
                            <%--상품명 : <a href="detail?produtc_code=${row.PRODUCT_CODE}">${row.PRODUCT_NAME}</a>--%>
                            <a style="color: black; font-size: large; font-weight: bold" href="detail/${row.PRODUCT_CODE}">${row.PRODUCT_NAME}</a>
                        <br>
                        <fmt:formatNumber value="${row.PRICE}" pattern="#,###"/>원
                    </td>
                    <%-- 테이블 한줄에 4칸씩 출력 --%>
                    <c:if test="${vs.count mod 4==0}"> <%-- vs.count%5 ==0 --%>
                        </tr><tr>
                    </c:if>
                </c:forEach>
            </tr>
        </table>
    </div>
</body>
</html>
