<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="ssi.jsp"%>
<%@include file="../header.jsp"%>

    <%-- 글번호(bbsno)와 비밀번호(passwd)가 일치하면 삭제 프로세스 --%>
<%
    int bbsno = Integer.parseInt(request.getParameter("bbsno"));
    String passwd = request.getParameter("passwd").trim();

    dto.setBbsno(bbsno);
    dto.setPasswd(passwd);

    int cnt = dao.delete(dto);
    if (cnt == 0) {
%>
        <script>
            alert("비밀번호가 일치하지 않습니다")
            location.href='bbsRead.jsp?bbsno=<%=bbsno%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'
        </script>
<%
    } else {
%>
        <script>
            alert('글 삭제가 완료되었습니다')
            location.href='bbsList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'
        </script>
<%
    }
%>

<%@include file="../footer.jsp"%>