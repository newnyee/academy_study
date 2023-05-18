<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ssi.jsp 공통 페이지 --%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<%@ page import="main.java.net.bbs.*"%>
<%@ page import="main.java.net.utility.*" %>

<jsp:useBean id="dao" class="main.java.net.bbs.BbsDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="main.java.net.bbs.BbsDTO" scope="page"></jsp:useBean>
<%@include file="../member/auth.jsp"%>

<%request.setCharacterEncoding("UTF-8"); %>

<%
    // 검색
    String word = request.getParameter("word"); //검색어
    String col = request.getParameter("col"); //검색 칼럼
    word = net.utility.Utility.checkNull(word); //문자열 값이 null이면 빈 문자열로 치환
    col = net.utility.Utility.checkNull(col);

    // 현재 페이지
    int nowPage = 1;
    if(request.getParameter("nowPage")!=null) {
        nowPage = Integer.parseInt(request.getParameter("nowPage"));
    }
%>
