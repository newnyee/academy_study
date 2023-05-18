<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="ssi.jsp"%>
<%@include file="../header.jsp"%>

    <%--공지사항 글 수정 폼--%>
    <%--관리자일 경우에만 접근 가능--%>
<% if(s_mlevel.equals("A1") || s_mlevel.equals("B1")) { //관리자일 경우에만 접근 가능
    int ntc_no = Integer.parseInt(request.getParameter("ntc_no"));
    dto = dao.read(ntc_no);
%>
    <h5> 공지사항 > 글수정 </h5>
    <form name="noticefrm" id="noticefrm" method="post" action="noticeUpdateProc.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>" onsubmit="return noticeCheck()"> <!-- myscript.js 함수 작성함 -->
        <div style="display: flex; justify-content: space-between; margin-bottom: 10px" >
        <a href="noticeList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>"><button type="button" class="btn btn-default">글목록</button></a>
            <label><input type="checkbox" name="ntc_fix" value="1" <%if(dto.getNtc_fix() == 1){out.print("checked");}%>> 상단 고정</label>
        </div>
        <input type="hidden" name="ntc_no" value="<%=ntc_no%>">
        <table class="table">
            <tr>
                <th class="active">제목</th>
                <td><input type="text" name="ntc_subject" id="ntc_subject" class="form-control" maxlength="100" value="<%=dto.getNtc_subject()%>"></td>
            </tr>
            <tr>
                <th class="active">내용</th>
                <td><textarea style="resize: none; height: 300px;" rows="5" class="form-control" name="ntc_content" id="ntc_content"><%=dto.getNtc_content()%></textarea></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="수정" class="btn btn-info">
                    <input type="reset" value="취소" class="btn btn-default">
                </td>
            </tr>
        </table>
    </form>
<%

    } else { //관리자가 아닐 경우 (url 통해 접근 했을 때)
        out.println("<h5 style='text-align:center'>접근할 수 없는 페이지 입니다</h5>");
    }

%>
    <script>
        $(document).ready(()=>{ // 글 수정 취소 버튼 눌렀을 때 취소 여부 확인 alert
            $('.btn-default').on('click', ()=>{
                if(confirm("글 수정을 취소하시겠습니까?")) { // 취소 ok
                    location.href = 'noticeList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'
                } else {
                    return false;
                }
            })
        })
    </script>
<%@include file="../footer.jsp"%>