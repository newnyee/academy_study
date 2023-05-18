<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="ssi.jsp"%>
<%@include file="../header.jsp"%>

    <!--공지사항 상세보기-->
    <div style="margin-bottom: 10px">
        <h5> 공지사항 > 상세보기 </h5>
        <a href="noticeList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>" class='btn btn-default'>글목록</a>
    </div>
<%
    int ntc_no = Integer.parseInt(request.getParameter("ntc_no"));
    dto = dao.read(ntc_no);
    if(dto == null) {
        out.println("해당 글 없음");
    } else {
        dao.incrementCnt(ntc_no);
%>
    <div>
        <table class="table">
            <tr>
                <th class="active" id="subject" style="text-align: center">제목</th>
                <td><%=dto.getNtc_subject()%></td>
                <th class="active" style="text-align: center">작성일</th>
                <td><%=dto.getNtc_regdt()%></td>
                <th class="active" style="text-align: center">조회수</th>
                <td><%=dto.getNtc_readcnt()%></td>
            </tr>
            <tr>
                <th class="active" style="text-align: center">내용</th>
                <td colspan="5">
                    <%-- 특수문자 및 엔터를 <br> 태그로 치환하기 --%>
<%                  String cnt_content = net.utility.Utility.convertChar(dto.getNtc_content());
                    out.print(cnt_content);
%>              </td>
            </tr>
<%          if(s_mlevel.equals("A1") || s_mlevel.equals("B1")) { %>
            <tr>
                <td colspan="6" align="center">
                    <a href="noticeUpdate.jsp?ntc_no=<%=ntc_no%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>" class="btn btn-default">수정</a>
                    <a href="noticeDelProc.jsp?ntc_no=<%=ntc_no%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>" class="btn btn-danger">삭제</a>
                </td>
            </tr>
<%          }%>
        </table>
    </div>
<%
    }
%>
<%@include file="../footer.jsp"%>


