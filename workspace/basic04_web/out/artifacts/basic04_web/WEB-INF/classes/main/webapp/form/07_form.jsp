<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>07_form.jsp</title>
    <script>
        function validate() {
            // 이름 2~20 글자 이내에서 입력해야만 서버로 전송
            let uname = document.getElementById('uname').value
            uname = uname.trim()
            if(uname.length<2 || uname.length>20) {
                alert("이름 2~20글자 이내에서 입력해 주세요")
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <h3>* 성적 입력 *</h3>
    <form name="sungjukfrm" id="sungjukfrm" method="post" action="07_ok.jsp" onsubmit="return validate()">
        이름 : <input class="form-control" type="text" name="uname" id="uname" maxlength="20" placeholder="이름" required>
        <hr>
    <!--
        type = "number" -> 숫자만 입력 가능 
        size -> 보여지는 텍스트 상자의 크기
    -->
        국어 : <input class="form-control" type="number" name="kor" id="kor" size="5" min="0" max="100" required>
        <hr>
        영어 : <input class="form-control" type="number" name="eng" id="eng" size="5" min="0" max="100" required>
        <hr>
        수학 : <input class="form-control" type="number" name="mat" id="mat" size="5" min="0" max="100" required>
        <hr>
        <input type="submit" class="btn btn-default" value="전송">
        <input type="reset" class="btn btn-danger" value="취소">
    </form>
    <!-- 
        [form 태그 관련 다양한 속성들]
        - form : 사용자가 입력한 정보를 서버로 전송하기 위한 양식
        - name : 폼 이름, 서버에서 식별하기 위한 식별자
        - id : 폼 아이디, Frontend단에서 식별자로 사용
        - method : 폼 전송 방식 (get, post, put, delete 등 방식이 많지만 html에서는 post와 get만 가능), 생략시 기본은 get 방식으로 자동 지정됨
        - action : 사용자가 요청한 정보를 서버가 받아서 처리할 결과 페이지
        - enctype : 폼에서 파일을 첨부해서 서버로 전송하고 할 때 “multipart/form-data” 추가
        
        [폼 전송 방식]
        **get 방식**
		- 생략시 기본값
		- 사용자가 입력 요청한 정보가 URL 그대로 노출
		- 한글 안깨짐
		- 사용 예 : 검색
		- 형식 : 요청페이지 또는 명령어?변수=값&변수=값&변수=값…

		**post방식**
		- 사용자가 요청한 정보가 URL에 노출되지 않고 패키지화 되어서 서버로 전송
		- Tomcat 9 이하 버전에서는 한글 깨짐
		- 사용 예 : 비번, 주민번호, 카드번호 등
     -->
</body>
</html>