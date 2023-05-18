<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="ssi.jsp"%>
<%@include file="../header.jsp"%>

    <%-- 글번호(pdsno)와 비밀번호(passwd)가 일치하면 삭제 프로세스 --%>
<%
    int pdsno = Integer.parseInt(request.getParameter("pdsno"));
    String passwd = request.getParameter("passwd").trim();
    String saveDir = application.getRealPath("/storage"); //파일이 저장된 실제 경로

    int cnt = dao.delete(pdsno, passwd, saveDir);
    if (cnt == 0) {
%>
        <script>
            alert("비밀번호가 일치하지 않습니다")
            location.href='javascript:history.back()'
        </script>
<%
    } else {
%>
        <script>
            alert('글 삭제가 완료되었습니다')
            location.href='pdsList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'
        </script>
<%
    }
%>

<%@include file="../footer.jsp"%>