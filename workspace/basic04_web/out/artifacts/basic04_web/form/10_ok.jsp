<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>10_ok.jsp</title>
</head>
<body>
	<h3>* request 내장객체의 다양한 메소드 결과 *</h3>
<%
	// 한글 인코딩
	request.setCharacterEncoding("utf-8");

	// 사용자가 입력한 정보를 가져오기
	out.print(request.getParameter("uid"));
	out.print("<hr>");
	
	// 요청한 사용자의 다양한 정보
	out.print(request.getRemoteAddr()); //사용자PC의 IP주소
	out.print("<hr>");
	out.print(request.getRemoteHost());
	out.print("<hr>");
	out.print(request.getRemotePort());
	out.print("<hr>");
	
	
	out.print(request.getContextPath()); //요청 Context root (해당 프로젝트 이름)
	out.print("<hr>");
	out.print(request.getRequestURL()); //요청 URL
	out.print("<hr>");
	out.print(request.getRequestURI()); //요청 URI
	out.print("<hr>");
	
	// 내부변수
	// request.setAttribute("변수명", 값);
	// request.getAttribute("변수명");
	request.setAttribute("user", "KOREA");
	out.print(request.getAttribute("user"));
	
	Object obj = request.getAttribute("user");
	String str = obj.toString();
	//String str = (String)obj; //다형성
	out.print(str);
	out.print("<hr>");
	
	//Context root가 아닌 실제 경로가 출력됨
	// 아래 경로는 이클립스에서 톰캣서버를 실행 한 경우
	/*
		D:\java202301\workspace\.metadata\.plugins\org.eclipse.wst.server.core
		  \tmp0\wtpwebapps\basic04_web\images
	*/
	out.print(application.getRealPath("/images"));
	out.print("<hr>");
	
%>
    
</body>
</html>