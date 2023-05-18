<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-17
  Time: 오전 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="../../css/main.css" rel="stylesheet" type="text/css">
    <title>write.jsp</title>
</head>
<body>
    <div class="container">
        <h3 align="center">상품 등록</h3>
        <p><button class="btn btn-success" type="button" onclick="location.href='list'">상품전체목록</button></p>
        <form name="productfrm" id="productfrm" method="post" action="insert" enctype="multipart/form-data">
            <table class="table">
                <tr>
                    <td class="success">상품명</td>
                    <td><input class="form-control" type="text" name="product_name"></td>
                </tr>
                <tr>
                    <td class="success">상품가격</td>
                    <td><input class="form-control" type="number" name="price"></td>
                </tr>
                <tr>
                    <td class="success">상품설명</td>
                    <td>
                        <textarea class="form-control" rows="5" cols="60" name="description" style="resize: none"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="success">상품사진</td>
                    <td><input class="form-control" type="file" name="img"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" class="btn btn-success" value="상품등록">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
