<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>

    <!--게시판 글쓰기 프로세스-->
<%
    String wname = request.getParameter("wname").trim();
    String subject = request.getParameter("subject");
    String content = request.getParameter("content");
    String passwd = request.getParameter("passwd").trim();
    String ip = request.getRemoteAddr();

    dto.setWname(wname);
    dto.setSubject(subject);
    dto.setContent(content);
    dto.setPasswd(passwd);
    dto.setIp(ip);

    int cnt = dao.create(dto);
    if (cnt == 0) {
%>
    <script>
        alert('게시글 추가에 실패했습니다')
        location.href='bbsList.jsp?nowPage=<%=nowPage%>'
    </script>
<%
    } else {
%>
    <script>
        alert('게시글 추가가 완료되었습니다')
        location.href='bbsList.jsp'
    </script>
<%
    }
%>
<%@include file="../footer.jsp"%>