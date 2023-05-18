<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%-- ssi.jsp 공통 페이지 --%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="net.sungjuk.*"%>

<jsp:useBean id="dao" class="net.sungjuk.SungjukDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="net.sungjuk.SungjukDTO" scope="page"></jsp:useBean>

<%request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <title>sungjukUpdateProc.jsp</title>
</head>
<body>
<div class="container mt-3">
    <h3>성적 수정 결과</h3>
<%
        int sno = Integer.parseInt(request.getParameter("sno"));
        String uname = request.getParameter("uname").trim();
        int kor = Integer.parseInt(request.getParameter("kor").trim());
        int eng = Integer.parseInt(request.getParameter("eng").trim());
        int mat = Integer.parseInt(request.getParameter("mat").trim());
        int aver = (kor + eng +mat)/3;
        String addr = request.getParameter("addr");

        dto.setSno(sno);
        dto.setUname(uname);
        dto.setKor(kor);
        dto.setEng(eng);
        dto.setMat(mat);
        dto.setAver(aver);
        dto.setAddr(addr);

        int cnt = dao.update(dto);

            if(cnt==0) {
                out.println("성적 수정에 실패했습니다");
                out.println("<p><a href='javascript:history.back.jsp'>[다시시도]</a></p>");
            } else {
%>

    <div class="alert alert-dismissible alert-secondary">
        <a href='sungjukRead.jsp?sno=<%=sno%>'><button type="button" class="btn-close"></button></a>
        성적이 수정되었습니다
    </div>
<%
    }
%>
</div>
</body>
</html>