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
    <title>idCheck_cookie.jsp</title>
</head>
    <%--쿠키를 활용하여 아이디 중복 확인을 해야만 회원가입이 가능하다--%>
    <h3>회원등록 폼(cookie)</h3>
    <form method="post" name="memfrm" action="insert.do" onsubmit="return send()">
        <table border="1" width="400px">
            <tr>
                <th>아이디</th>
                <td>
                    <input type="text" name="userid" id="userid">
                    <input type="button" value="아이디중복확인" id="btn_userid">
                    <br>
                    <span id="idpanel"></span><!-- 아이디 중복 관련 메세지 -->
                </td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td>
                    <input type="password" name="passwd" id="passwd">
                    <span id="pwpanel"></span><!-- 아이디 중복 관련 메세지 -->
                </td>
            </tr>
            <tr>
                <th>이름</th>
                <td>
                    <input type="text" name="name" id="name">
                    <span id="namepanel"></span><!-- 아이디 중복 관련 메세지 -->
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    <input type="text" name="email" id="email">
                    <span id="mailpanel"></span><!-- 아이디 중복 관련 메세지 -->
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="회원가입">
                </td>
            </tr>
        </table>
    </form>

    <script>
        // 해당 페이지가 로딩되었을 때 아이디 중복확인과 관련된 쿠키변수 삭제
        $(()=>{
            $.removeCookie("checkID")
        })

        // 1) id="btn_userid" 아이디 중복확인 버튼을 클릭했을 때
        $('#btn_userid').click(()=>{
            // 2) 입력한 id="btn_userid" 값을 변수에 대입하기
            let params = "userid=" + $('#userid').val().trim()

            // 3) post방식으로 서버에 요청해서 응답받기
            // $.post("요청명령어", 전달값, 콜백함수, 응답받는 형식)
            $.post("idcheckcookieproc.do", params, checkID, "json")
        })

        const checkID = (result) => {
            // 1) text 응답 -> 0 또는 1
            // 2) json 응답 -> [object Object] 또는 {"count":1} -> result.count = 0 또는 1

            // 서버에서 응답받는 메세지(result)를 본문의 id=panel에 출력하고, 쿠키변수에 저장
            // $.cookie("쿠키변수명", 값)
            let count = eval(result.count) //숫자형으로 형변환
            if (count == 0) {
                $('#idpanel').css('color','blue')
                $('#idpanel').text('사용 가능한 아이디 입니다')
                $.cookie("checkID", "PASS");
            } else {
                $('#idpanel').css('color','red')
                $('#idpanel').text('중복된 아이디 입니다')
                $('#userid').focus()
            }
        }

        // id 중복 확인을 해야만 회원가입이 서버로 전송
        const send = () => {
            // 아이디 여부
            let userid = $('#userid').val().trim()
            if(userid.length<5 || userid.length>10) {
                $('#idpanel').css('color','red')
                $('#idpanel').text('아이디를 5~10자 사이로 입력해 주세요')
                $('#userid').focus()
                return false
            }

            // 아이디 중목확인을 했는지?
            let checkID = $.cookie("checkID");
            if (checkID !== "PASS") {
                $('#idpanel').css('color','green')
                $('#idpanel').text('아이디 중복확인을 해주세요')
                $('#userid').focus()
                return false
            }

            // 비밀번호 여부
            let passwd = $('#passwd').val().trim()
            if(passwd.length<5 || passwd.length>10) {
                $('#pwpanel').css('color','red')
                $('#pwpanel').text('비밀번호를 5~10자 사이로 입력해 주세요')
                $('#passwd').focus()
                return false
            }

            // 이름 입력 여부
            let name = $('#name').val().trim()
            if(name.length<1) {
                $('#namepanel').css('color','red')
                $('#namepanel').text('이름을 한글자 이상 입력해주세요')
                $('#name').focus()
                return false
            }

            // 이메일 입력 여부
            let email = $('#email').val().trim()
            // 숫자 (0~9) or 알파벳 (a~z, A~Z) 으로 시작하며 중간에 -_. 문자가 있을 수 있으며
            // 그 후 숫자 (0~9) or 알파벳 (a~z, A~Z)이 올 수도 있고 연달아 올 수도 있고 없을 수도 있다.
            // @ 는 반드시 존재하며 . 도 반드시 존재하고 a~z, A~Z 의 문자가 2,3개 존재하고 i = 대소문자 구분 안한다.
            let emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i
            if(!emailPattern.test(email)) {
                $('#mailpanel').css('color','red')
                $('#mailpanel').text('이메일 양식에 맞게 작성해주세요')
                $('#email').focus()
                return false
            }
            return true
        }
    </script>
</body>
</html>
