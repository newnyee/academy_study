<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>

    <!--공지사항 글쓰기 프로세스-->
    <%--관리자일 경우에만 접근 가능--%>
<%
    if(s_mlevel.equals("A1") || s_mlevel.equals("B1")) { //관리자일 경우에만 접근 가능

        dto.setNtc_subject(request.getParameter("ntc_subject"));
        dto.setNtc_content(request.getParameter("ntc_content"));
        String fix = net.utility.Utility.checkNull(request.getParameter("ntc_fix")); // null이면 빈문자열로 바꿔줌
        if(fix.equals("1")) {
            dto.setNtc_fix(1);
        } else {
            dto.setNtc_fix(2);
        }

        int cnt = dao.create(dto);
        if (cnt == 0) {
%>
    <script>
        alert('공지사항 추가에 실패했습니다')
        location.href='noticeRead.jsp?nowPage=<%=nowPage%>'
    </script>
<%
        } else {
%>
    <script>
        alert('공지사항 추가가 완료되었습니다')
        location.href='noticeList.jsp'
    </script>
<%
        }
    } else { //관리자가 아닐 경우 (url 통해 접근 했을 때)
        out.println("<h5 style='text-align:center'>접근할 수 없는 페이지 입니다</h5>");
    }
%>
%>
<%@include file="../footer.jsp"%>