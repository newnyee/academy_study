<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>09_다양한컨트롤.jsp</title>
</head>
<body>
    <h3>* 다양한 컨트롤 요소들 연습 *</h3>
    
    <form method="post" action="09_ok.jsp">
        <hr>
        아이디 : <input type="text" name="uid">
        <hr>
        비번 : <input type="password" name="upw">
        <hr>
        이름 : <input type="text" name="uname">
        <hr>
        
        <!-- 요청값에 엔터가 있을 때 응답값에서 엔터를 발생시켜야하는경우  -->
        내용 : <textarea rows="5" cols="20" name="content"></textarea>
        <hr>
        
        <!-- name이 동일할 때 -->
        숫자1 : <input type="text" name="num"> <br>
        숫자2 : <input type="text" name="num"> <br>
        숫자3 : <input type="text" name="num"> <br>
        <hr>
        
        <!-- 라디오박스 -->
        성별 :
        <input type="radio" name="gender" value="M">남
        <input type="radio" name="gender" value="F">여
        <hr>
        
        <!-- 체크박스 -->
        약관동의 : <input type="checkbox" name="agree" value="Y">
        <hr>
        SMS : <input type="checkbox" name="sms">
        <hr>
        
        <!-- select -->
        통신회사 : 
        <select name="telecom">
            <option value="sk">SK</option>
            <option value="lg">LG U+</option>
            <option value="ktf">KTF</option>
        </select>
        <hr>

		<!-- 폼 컨트롤 요소이지만 본문에 출력은 안되는 요소 -->
        <input type="hidden" name="page" value="5">
        <hr>
        
        <!-- 첨부파일 -->
        <!-- 
        파일을 첨부해서 서버에 전송하려면 <form enctype="multipart/form-data"> 속성을 추가해야 함
        -->
        첨부파일 : 
        <input type="file" name="attach" id="">
        <hr>
        
        <input type="submit" value="전송">
        
    </form>
</body>
</html>