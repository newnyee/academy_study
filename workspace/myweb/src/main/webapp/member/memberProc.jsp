<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="ssi.jsp"%>
<%@include file="../header.jsp"%>

    <!--회원가입 프로세스-->
<%
    dto.setId(request.getParameter("id"));
    dto.setPasswd(request.getParameter("passwd"));
    dto.setMname(request.getParameter("mname"));
    dto.setTel(request.getParameter("tel"));
    dto.setEmail(request.getParameter("email"));
    dto.setZipcode(request.getParameter("zipcode"));
    dto.setAddress1(request.getParameter("address1"));
    dto.setAddress2(request.getParameter("address2"));
    dto.setJob(request.getParameter("job"));

    int cnt = dao.create(dto);

    if (cnt == 0) {
%>
    <script>
        alert('회원가입에 실패했습니다')
        location.href='index.jsp'
    </script>
<%
    } else {
%>
    <script>
        alert('회원가입 되었습니다')
        location.href='loginForm.jsp'
    </script>
<%
    }
%>
<%@include file="../footer.jsp"%>
