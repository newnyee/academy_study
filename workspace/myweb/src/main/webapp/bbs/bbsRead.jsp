<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="ssi.jsp"%>
<%@include file="../header.jsp"%>

    <!--게시판 글 상세보기-->
    <div style="margin-bottom: 10px">
        <h5> 자유게시판 > 상세보기 </h5>
        <a href="bbsList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>" class='btn btn-default'>글목록</a>
    </div>
<%
    int bbsno = Integer.parseInt(request.getParameter("bbsno"));
    dto = dao.read(bbsno);
    if(dto == null) {
        out.println("해당 글 없음");
    } else {
        dao.incrementCnt(bbsno);
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
                <td><%=dto.getRegdt()%></td>
            </tr>
            <tr>
                <th class="active" style="text-align: center">IP 주소</th>
                <td><%=dto.getIp()%></td>
                <th class="active" style="text-align: center">조회수</th>
                <td><%=dto.getReadcnt()%></td>
            </tr>
            <tr>
                <th class="active" style="text-align: center">내용</th>
                <td colspan="3">
                    <%-- 특수문자 및 엔터를 <br> 태그로 치환하기 --%>
<%                  String content = net.utility.Utility.convertChar(dto.getContent());
                    out.print(content);
%>              </td>
            </tr>
            <tr>
                <td colspan="4" align="center">
                    <a href="bbsReply.jsp?bbsno=<%=bbsno%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>" class="btn btn-info">답글쓰기</a>
                    <a href="bbsUpdatePwCheck.jsp?bbsno=<%=bbsno%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>" class="btn btn-default">수정</a>
                    <a href="bbsDel.jsp?bbsno=<%=bbsno%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>" class="btn btn-danger">삭제</a>
                </td>
            </tr>
        </table>
    </div>
<%
    }
%>
<%@include file="../footer.jsp"%>


