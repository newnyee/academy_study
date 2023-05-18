<%@page import="javax.accessibility.AccessibleExtendedText"%>
<%@page import="net.sungjuk.SungjukDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.sungjuk.*" %>
<jsp:useBean id="dao" class="net.sungjuk.SungjukDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="net.sungjuk.SungjukDTO" scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
<title>sungjukIns.jsp</title>
</head>
<body>
	<div class="container mt-3">
    	<h3>성적 결과 페이지</h3>
<%
	request.setCharacterEncoding("utf-8");
	
	String uname = request.getParameter("uname");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	int aver = (kor + eng +mat)/3;
	String addr = request.getParameter("addr");
	
	// 1) dto 객체 미사용
	// int cnt = dao.insert(uname, kor, eng, mat, aver, addr);
	
	// 2) dto 객체 사용
	// 전달값을 모두 dto 객체에 담기
	dto.setUname(uname);
	dto.setKor(kor);
	dto.setEng(eng);
	dto.setMat(mat);
	dto.setAver(aver);
	dto.setAddr(addr);
	
	int cnt = dao.create(dto);
	
	if(cnt==0) {
    	out.println("성적 입력에 실패했습니다");
    	out.println("<p><a href='javascript:history.back.jsp'>[다시시도]</a></p>");
    } else {
%>
   	    <div class="alert alert-dismissible alert-secondary">
			<a href='sungjukList.jsp'><button type="button" class="btn-close"></button></a>
			성적입력이 완료되었습니다
		</div>
<% 
    }

%>		
		
    </div>
</body>
</html>