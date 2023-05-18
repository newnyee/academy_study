<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="ssi.jsp"%>
<%@include file="../header.jsp"%>

    <%--게시판 글 수정 전 패스워드 확인--%>
    <div style="margin-bottom: 10px">
        <h5> 자유게시판 > 글 수정 </h5>
        <a href="bbsList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>" class="btn btn-default">글목록</a>
    </div>
<%
    int bbsno = Integer.parseInt(request.getParameter("bbsno"));

%>
    <form method="post" action="bbsUpdate.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>" onsubmit="return pwCheckUpdate()">
        <input type="hidden" name="bbsno" value="<%=bbsno%>">
        <table class="table">
            <tr>
                <th class="active">비밀번호</th>
                <td>
                    <input type="password" name="passwd" id="passwd" required>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit" class="btn btn-info">확인</button>
                </td>
            </tr>
        </table>
    </form>
<%@include file="../footer.jsp"%>