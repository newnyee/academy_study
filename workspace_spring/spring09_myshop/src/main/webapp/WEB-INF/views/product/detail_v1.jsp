<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-17
  Time: 오후 3:43
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
    <title>detail.jsp</title>

    <script>
        const product_delete = () => {
            if(confirm("정말 삭제하시겠습니까?\n(삭제된 파일은 복구되지 않습니다)")) {
                document.productfrm.action="/product/delete"
                document.productfrm.submit()
            }
        }
    </script>
</head>
<body>
    <h3>상품 상세 / 상품 수정 / 상품 삭제</h3>
    <p><button type="button" onclick="location.href='/product/list'">상품전체목록</button></p>

    <form name="productfrm" id="productfrm" method="post" action="/product/update" enctype="multipart/form-data">
        <input type="hidden" name="product_code" value="${product_code}">
        <table border="1">
            <tr>
                <td>상품명</td>
                <td><input type="text" name="product_name" value="${product.PRODUCT_NAME}"></td>
            </tr>
            <tr>
                <td>상품가격</td>
                <td><input type="number" name="price" value="${product.PRICE}"></td>
            </tr>
            <tr>
                <td>상품설명</td>
                <td>
                    <textarea rows="5" cols="60" name="description">${product.DESCRIPTION}</textarea>
                </td>
            </tr>
            <tr>
                <td>상품사진</td>
                <td>
                    <c:if test="${product.FILENAME != '-'}">
                        <img src="/storage/${product.FILENAME}" width="100px">
                    </c:if>
                    <br>
                    <input type="file" name="img">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="상품수정">
                    <input type="button" onclick="product_delete()" value="상품삭제">
                </td>
            </tr>
        </table>
    </form>
    <hr>

    <%--댓글--%>
</body>
</html>
