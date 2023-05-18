<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>

    <!--게시판 답글쓰기 프로세스-->
<%
    int bbsno = Integer.parseInt(request.getParameter("bbsno"));
    String wname = request.getParameter("wname").trim();
    String subject = request.getParameter("subject");
    String content = request.getParameter("content");
    String passwd = request.getParameter("passwd").trim();
    String ip = request.getRemoteAddr();

    dto.setBbsno(bbsno);
    dto.setWname(wname);
    dto.setSubject(subject);
    dto.setContent(content);
    dto.setPasswd(passwd);
    dto.setIp(ip);

    int cnt = dao.reply(dto);
    if (cnt == 0) {
%>
    <script>
        alert('답글쓰기에 실패했습니다')
        location.href='bbsRead.jsp?bbsno=<%=bbsno%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'
    </script>
<%
    } else {
%>
    <script>
        alert('답글이 추가되었습니다')
        location.href='bbsList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'
    </script>
<%
    }
%>
<%@include file="../footer.jsp"%>