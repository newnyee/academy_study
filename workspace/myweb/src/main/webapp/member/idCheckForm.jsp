<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<!doctype html>
<html lang=ko>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>My web - ID 중복 확인</title>
</head>
<body>
    <%--회원가입 아이디 중복확인 폼--%>
    <div style="text-align: center">
        <h4>아이디 중복 확인</h4>
        <form action="idCheckProc.jsp" onsubmit="return blankCheck()">
            아이디 : <input type="text" name="id" id="id" maxlength="10" autofocus>
            <input type="submit" value="중복확인">
        </form>
    </div>

    <script>
        blankCheck = () => {
            let id = document.getElementById("id").value
            id = id.trim()
            let regex = /[^a-z0-9\_\-]/g
            // let regex = new RegExp('[a-z|0-9|\_|\-]+/g')
            if(regex.test(id) || id.length<5 || id.length>10) {
                alert("5~10자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다")
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
