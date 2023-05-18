<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html lang=ko>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>My web - email 중복 확인</title>
</head>
<body>
<div style="text-align: center">
    <%--회원가입 이메일 중복확인 폼--%>
    <h4>이메일 중복 확인</h4>
    <form action="emailCheckProc.jsp" onsubmit="return blankCheck()">
        이메일 : <input type="text" name="email" id="email" maxlength="50" autofocus>
        <input type="submit" value="중복확인">
    </form>
</div>

<script>
    blankCheck = () => {
        let email = document.getElementById("email").value
        email = email.trim()
        let regex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}')
        if(email.length<5) {
            alert("이메일을 5자 이상 입력해주세요")
            return false;
        }
        if(regex.test(email) === false) {
            alert("이메일 형식에 맞게 입력해주세요")
            return false;
        }
        return true;
    }
</script>
</body>
</html>
