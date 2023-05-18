<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.testbean.*" %>
<jsp:useBean id="calc" class="net.testbean.CalcBean" scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>* Java Bean을 이용한 계산 결과 *</h3>

<%
	int num = Integer.parseInt(request.getParameter("num").trim());
	long fnum = calc.fact(num);
	if(fnum<0) {
		out.print("절대값: " + calc.abs(num));
	} else {
		out.print("팩토리얼값: " + fnum);
	}
%>

</body>
</html>