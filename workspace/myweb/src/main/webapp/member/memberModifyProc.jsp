<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="ssi.jsp"%>
<%@include file="../header.jsp"%>

    <!--회원 정보 수정 프로세스-->
<%
    dto.setId(s_id);
    dto.setPasswd(request.getParameter("passwd"));
    dto.setMname(request.getParameter("mname"));
    dto.setEmail(request.getParameter("email"));
    dto.setTel(request.getParameter("tel"));
    dto.setZipcode(request.getParameter("zipcode"));
    dto.setAddress1(request.getParameter("address1"));
    dto.setAddress2(request.getParameter("address2"));
    dto.setJob(request.getParameter("job"));

    int cnt = dao.update(dto);

    if(cnt<1) {
%>
    <script>
        alert('회원정보 수정에 실패했습니다')
        location.href='loginForm.jsp'
    </script>
<%
    } else {
%>
    <script>
        alert('회원정보 수정을 완료했습니다. 다시 로그인 해주세요.')
        location.href='logout.jsp'
    </script>
<%
    }
%>

<%@include file="../footer.jsp"%>
