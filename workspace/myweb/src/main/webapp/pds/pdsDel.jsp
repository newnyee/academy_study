<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="ssi.jsp"%>
<%@include file="../header.jsp"%>

    <%-- 글번호(pdsno)와 비밀번호(passwd)가 일치하면 삭제 --%>
    <div style="margin-bottom: 10px">
        <h5> 포토갤러리 > 글삭제 </h5>
        <a href="pdsList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>"><button class="btn btn-default">글목록</button></a>
    </div>
<%
    int pdsno = Integer.parseInt(request.getParameter("pdsno"));

%>
    <form method="post" action="pdsDelProc.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>" onsubmit="return pwCheck()">
        <input type="hidden" name="pdsno" value="<%=pdsno%>">
        <table class="table">
            <tr>
                <th class="active">비밀번호</th>
                <td>
                    <input type="password" name="passwd" id="passwd" required>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit" class="btn btn-danger">삭제</button>
                </td>
            </tr>
        </table>
    </form>
<%@include file="../footer.jsp"%>