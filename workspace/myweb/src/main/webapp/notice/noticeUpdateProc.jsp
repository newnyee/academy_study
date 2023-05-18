<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>

    <!--공지사항 글 수정 프로세스-->
    <%--관리자일 경우에만 접근 가능--%>
<%
    if(s_mlevel.equals("A1") || s_mlevel.equals("B1")) { //관리자일 경우에만 접근 가능
        int ntc_no = Integer.parseInt(request.getParameter("ntc_no"));
        String ntc_subject = request.getParameter("ntc_subject");
        String ntc_content = request.getParameter("ntc_content");
        String fix = net.utility.Utility.checkNull(request.getParameter("ntc_fix"));
        if(fix.equals("1")) {
            dto.setNtc_fix(1);
        } else {
            dto.setNtc_fix(2);
        }
        dto.setNtc_no(ntc_no);
        dto.setNtc_subject(ntc_subject);
        dto.setNtc_content(ntc_content);

        int cnt = dao.update(dto);
        if (cnt == 0) {
%>
    <script>
        alert('글 수정에 실패했습니다')
        location.href='bbsRead.jsp?ntc_no=<%=ntc_no%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'
    </script>
<%
        } else {
%>
    <script>
        alert('글 수정이 완료되었습니다')
        location.href='noticeList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'
    </script>
<%
        }
    } else { //관리자가 아닐 경우 (url 통해 접근 했을 때)
        out.println("<h5 style='text-align:center'>접근할 수 없는 페이지 입니다</h5>");
    }
%>
<%@include file="../footer.jsp"%>