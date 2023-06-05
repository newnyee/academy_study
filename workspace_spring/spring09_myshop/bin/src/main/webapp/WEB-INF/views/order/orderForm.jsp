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
    <script src="../../js/jquery-3.6.4.min.js"></script>
    <title>order_form</title>
    <script>
        const ordercheck = () => {

            //받는사람
            let deliverynm = $('#deliverynm').val()
            if (deliverynm.length < 1) {
                alert("받는사람 이름을 작성해주세요")
                return false
            }

            //받는주소
            let deliveryaddr = $('#deliveryaddr').val()
            if (deliveryaddr.length < 1) {
                alert("받는주소를 작성해주세요")
                return false
            }

            //결제 확인
            if (confirm("결제 하시겠습니까?")) {
                return true
            } else {
                return false
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <div style="text-align: right">아이디 : ${sessionScope.get("s_id")}</div>
        <h3 align="center">주문서 작성</h3>
        <form method="post" action="/order/insert" onsubmit="return ordercheck()">
            <table class="table">
                <tr>
                    <th class="success">받는사람</th>
                    <td><input class="form-control" type="text" id="deliverynm" name="deliverynm"></td>
                </tr>
                <tr>
                    <th class="success">받는주소</th>
                    <td><input class="form-control" type="text" id="deliveryaddr" name="deliveryaddr"></td>
                </tr>
                <tr>
                    <th class="success">배송메세지</th>
                    <td>
                       <textarea class="form-control" rows="4" name="deliverymsg" style="resize: none"></textarea>
                    </td>
                </tr>
                <tr>
                    <th class="success">결제구분</th>
                    <td>
                        <select style="width: 120px" class="form-control" name="payment">
                            <option value="cash">현금결제</option>
                            <option value="card">카드결제</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" class="btn btn-success" value="결제하기">
                    </td>
              </tr>
            </table>
        </form>
    </div>
</body>
</html>
