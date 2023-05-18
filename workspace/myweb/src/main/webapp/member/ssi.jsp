<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ssi.jsp 공통 페이지 --%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<%@ page import="main.java.net.utility.*" %>
<%@ page import="main.java.net.member.*" %>

<jsp:useBean id="dao" class="main.java.net.member.MemberDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="main.java.net.member.MemberDTO" scope="page"></jsp:useBean>
<%@include file="auth.jsp"%>

<%request.setCharacterEncoding("UTF-8"); %>