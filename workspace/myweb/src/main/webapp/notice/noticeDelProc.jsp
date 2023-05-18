<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="ssi.jsp"%>
<%@include file="../header.jsp"%>

    <!--공지사항 글 삭제 프로세스-->
    <%--관리자일 경우에만 접근 가능--%>
<%
    if(s_mlevel.equals("A1") || s_mlevel.equals("B1")) { //관리자일 경우에만 접근 가능
        int ntc_no = Integer.parseInt(request.getParameter("ntc_no"));
        int cnt = dao.delete(ntc_no);
        if (cnt == 0) {
%>
        <script>
            alert("글 삭제에 실패했습니다")
            location.href='noticeRead.jsp?ntc_no=<%=ntc_no%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'
        </script>
<%
        } else {
%>
        <script>
            alert('글 삭제가 완료되었습니다')
            location.href='noticeList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'
        </script>
<%
        }
    } else { //관리자가 아닐 경우 (url 통해 접근 했을 때)
        out.println("<h5 style='text-align:center'>접근할 수 없는 페이지 입니다</h5>");
    }
%>

<%@include file="../footer.jsp"%>