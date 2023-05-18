<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>08_ok.jsp</title>
</head>
<body>
	<h3>계산결과</h3>
	
<%
	//한글 인코딩
	request.setCharacterEncoding("utf-8");

	// 사용자가 입력한 정보 가져오기
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String op = request.getParameter("op");
	
	int resultInt = 0; //계산결과 : 정수일 경우
	double resultDouble = 0; //계산결과 : 실수일 경우
	
	if(op.equals("+")) {
		resultInt = num1 + num2;
	} else if (op.equals("-")) {
		resultInt = num1 - num2;
	} else if (op.equals("*")) {
		resultInt = num1 * num2;
	} else if (op.equals("/")) {
		resultDouble = (double)num1 / num2;
	} else if (op.equals("%")) {
		resultInt = num1 % num2;
	}
	
	
%>

	<!-- 출력 -->
	<table>
		<tr>
			<td><%=num1%></td>
			<td><%=op%></td>
			<td><%=num2%></td>
			<td>=</td>
			<td>
<%
				if(op.equals("/")){
					if(resultDouble%1 == 0) {
						resultInt = (int)resultDouble;
					} else {
						out.print(String.format("%.1f", resultDouble));
						return;
					}
				}
				out.print(resultInt);
%>
			</td>
		</tr>
	</table>
</body>
</html>