<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-15
  Time: 오전 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="../js/jquery-3.6.4.min.js"></script>
    <script src="../js/jquery.cookie.js"></script>
    <title>idCheck.jsp</title>
</head>
<body>
    <h3>회원등록 폼</h3>
    <form method="post" >
        <table border="1" width="400px">
            <tr>
                <th>아이디</th>
                <td>
                    <input type="text" id="userid">
                    <input type="button" value="아이디중복확인" id="btn_userid">
                    <br>
                    <div id="panel" style="display:none"></div>
                </td>
            </tr>
        </table>
    </form>

    <script>
        $("#btn_userid").on('click', () => {
            //$.post("요청명령어",전달값(요청값) , callback함수(응답값))
            $.post("idcheckproc.do", "userid=" + $('#userid').val().trim(), responseProc = (result) => {
                $("#panel").empty()
                $("#panel").html(result)
                $("#panel").show()
            })
        });
    </script>
</body>
</html>
