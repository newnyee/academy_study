<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>09_ok.jsp</title>
</head>
<body>
    <h3>* 다양한 폼 컨트롤 요소 결과 *</h3>
<%
	request.setCharacterEncoding("utf-8");

	String uid = request.getParameter("uid").trim();
	String upw = request.getParameter("upw").trim();
	String uname = request.getParameter("uname").trim();
	String content = request.getParameter("content");
	
	out.print(uid + "<hr>");
	out.print(upw + "<hr>");
	out.print(uname + "<hr>");
	
	// <textarea>값은 엔터를 <br> 치환해서 출력
	content = content.replace("\n", "<br>");
	out.print(content + "<hr>");
	
	// name이 동일한 값을 request객체에서 가져오기
	// <input type="text" name="num">이 3개인 경우
	String[] numbers = request.getParameterValues("num");
	for(String a : numbers) {
		out.println(a + "<br>");
	}
	
	// 라디오박스
	out.print("<hr>");
	out.print("성별 : " + request.getParameter("gender"));
	
	// 체크박스 - value값이 있는경우
	// 체크를 하면 Y, 체크하지 않으면 null 반환
	out.print("<hr>");
	out.print("약관동의 : " + request.getParameter("agree"));
	if(request.getParameter("agree") == null) {
		%>
		<script>alert("약관에 동의하지 않음")</script>
		<%
	} else {
		%>
		<script>alert("약관에 동의함")</script>
		<%
	}
	out.print("<hr>");
	
	// 체크박스 - value값이 없는경우
	// 체크를 하면 on, 체크하지 않으면 null 반환
	out.print("SMS : " + request.getParameter("sms"));
	out.print("<hr>");
	
	// select값 가져오기
	out.print("통신회사 : " + request.getParameter("telecom"));
	out.print("<hr>");
	
	// hidden 속성
	out.print("페이지 : " + request.getParameter("page"));
	out.print("<hr>");
	
	// 첨부파일
	//request.getParameter()메소드 -> String 타입 리턴 -> 파일명 출력됨
	out.print("첨부파일 : " + request.getParameter("attach"));
	
%>

</body>
</html>