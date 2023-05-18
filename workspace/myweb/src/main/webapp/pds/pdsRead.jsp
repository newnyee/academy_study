<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="ssi.jsp"%>
<%@include file="../header.jsp"%>

    <!--포토 갤러리 상세보기-->
    <div style="margin-bottom: 10px">
        <h5> 포토갤러리 > 상세보기 </h5>
        <a href="pdsList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>" class='btn btn-default'>글목록</a>
    </div>
<%
    int pdsno = Integer.parseInt(request.getParameter("pdsno"));
    dto = dao.read(pdsno);
    if(dto == null) {
        out.println("해당 글 없음");
    } else {
        dao.incrementCnt(pdsno);
%>
    <div>
        <table class="table">
            <tr>
                <th class="active" id="subject" style="text-align: center">제목</th>
                <td colspan="3"><%=dto.getSubject()%></td>
            </tr>
            <tr>
                <th class="active" style="text-align: center">작성자</th>
                <td><%=dto.getWname()%></td>
                <th class="active" style="text-align: center">작성일</th>
                <td><%=dto.getRegdate()%></td>
            </tr>
            <tr>
                <th class="active" style="text-align: center">파일 크기</th>
                <td>
                    <% String filesize = net.utility.Utility.comma(dto.getFilesize()); %>
                    <%=filesize%> byte
                </td>
                <th class="active" style="text-align: center">조회수</th>
                <td><%=dto.getReadcnt()%></td>
            </tr>
            <tr>
                <td colspan="4" align="center"><img src="../storage/<%=dto.getFilename()%>" style="max-width: 100%"></td>
            </tr>
            <tr>
                <td colspan="4" align="center">
                    <a href="pdsUpdate.jsp?pdsno=<%=pdsno%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>" class="btn btn-default">수정</a>
                    <a href="pdsDel.jsp?pdsno=<%=pdsno%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>" class="btn btn-danger">삭제</a>
                </td>
            </tr>
        </table>
    </div>
<%
    }
%>
<%@include file="../footer.jsp"%>


