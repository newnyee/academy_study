<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>06_내장객체.jsp</title>
</head>
<body>
	<%
	/*
		[JSP 페이지 실행 과정]
		톰캣 WAS에 의해서 .java와 .class가 자동으로 생성된다

		예) hello.jsp
		컴파일 언어(Java) -> 목적코드(.class) 필요
		.jsp -> hello_jsp.java (톰캣) -> hello_jsp.class (컴파일)
		
		예) hello_jsp.java 소스 저장 경로
		D:\java202301\workspace\.metadata\.plugins
		  \org.eclipse.wst.server.core\tmp0\work
		  \Catalina\localhost\basic04_web\org\apache\jsp\form
		
		  
	  	[JSP 내장객체]
	  	톰캣 서버에 의해 자동으로 생성된 객체
	  	개발자는 별도의 객체를 선언하지않고 가져다 사용한다
	  	
	  	1. out : 출력 객체
	  	2. request : 사용자가 요청한 정보를 관리하는 객체 (JspWriter)
	  	3. response : 요청한 사용자에게 응답을 관리하는 객체 (HttpServletRequest)
	  	4. session :  요청한 사용자에게 개별적으로 구분하기 위한 객체 (HttpServletResponse)
	  	5. application : 모든 사용자가 공유하는 값 또는 서버에 대한 정보를 관리하는 객체 (HttpSession)
	  	6. pageContext : JSP, JSTL, EL 등 현재 페이지 내에서 서로 다른 문법과의 값을 교류 (ServletContext)
	*/
	%>
</body>
</html>