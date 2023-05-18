<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Theme Made By www.w3schools.com - No Copyright -->
    <title>My web</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
    <link rel="stylesheet" href="../css/layout.css">
    <link rel="icon" type="image/png" href="images/20230426_200831-removebg-preview.png">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="../js/jquery-3.6.4.min.js"></script>
    <script src="../js/moment.min.js"></script>
    <script src="../js/myscript.js"></script>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-default">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<%=request.getContextPath()%>">My Universe</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="../bbs/bbsList.jsp">자유게시판</a></li>
                    <li><a href="../notice/noticeList.jsp">공지사항</a></li>
                    <li><a href="../pds/pdsList.jsp">포토갤러리</a></li>
                    <li><a href="../mail/mailForm.jsp">메일보내기</a></li>
<%
    if(s_id.equals("guest") || s_passwd.equals("guest") || s_mlevel.equals("guest")) {
        out.println("<li><a href='../member/loginForm.jsp'>로그인</a></li>");
    } else {
        out.println("<li><a href='../member/loginForm.jsp'>로그아웃</a></li>");
    }
%>
                </ul>
            </div>
        </div>
    </nav>

    <!-- content -->
    <div class="container-fluid">
        <div class="col-xs-12">