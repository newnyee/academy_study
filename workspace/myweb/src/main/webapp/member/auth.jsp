<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--페이지 공통 session정보--%>
<%-- 로그인 상태 정보 확인 (authorize) --%>
<%
    String s_id = "";
    String s_passwd = "";
    String s_mlevel = "";

    if(session.getAttribute("s_id") == null || session.getAttribute("s_passwd") == null || session.getAttribute("s_mlevel") == null) {
        s_id = "guest";
        s_passwd = "guest";
        s_mlevel = "guest";
    } else {
        // 로그인 성공 했다면, 세션 변수값 가져오기
        s_id = (String) session.getAttribute("s_id");
        s_passwd = (String) session.getAttribute("s_passwd");
        s_mlevel = (String) session.getAttribute("s_mlevel");
    }
%>

