<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="ssi.jsp"%>
<%@include file="../header.jsp"%>

    <!--공지사항 글쓰기 폼-->
    <%--관리자일 경우에만 접근 가능--%>
<%  if(s_mlevel.equals("A1") || s_mlevel.equals("B1")) { //관리자일 경우에만 접근 가능 %>
    <h5> 공지사항 > 글쓰기 </h5>
    <form name="noticefrm" id="noticefrm" method="post" action="noticeIns.jsp" onsubmit="return noticeCheck()"> <!-- myscript.js 함수 작성함 -->
    <div style="display: flex; justify-content: space-between; margin-bottom: 10px">
        <a href="noticeList.jsp?nowPage=<%=nowPage%>"><button type="button" class="btn btn-default">글목록</button></a>
        <label><input type="checkbox" name="ntc_fix" value="1"> 상단 고정</label>
    </div>
        <table class="table">
            <tr>
                <th class="active">제목</th>
                <td><input type="text" name="ntc_subject" id="ntc_subject" class="form-control" maxlength="100"></td>
            </tr>
            <tr>
                <th class="active">내용</th>
                <td><textarea style="resize: none; height: 300px;" rows="5" class="form-control" name="ntc_content" id="ntc_content" ></textarea></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="쓰기" class="btn btn-info">
                    <input type="reset" value="취소" class="btn btn-default">
                </td>
            </tr>
        </table>
    </form>
    <script>
        $(document).ready(()=>{ // 글 작성 취소 버튼 눌렀을 때 취소 여부 확인 alert
            $('.btn-default').on('click', ()=>{
                if(confirm("공지사항 작성을 취소하시겠습니까?")) { // 취소 ok
                    location.href = 'noticeList.jsp?nowPage=<%=nowPage%>'
                } else {
                    return false; // 취소버튼을 눌렀을 때 작성했던 글 삭제되지 않게 false로 리턴함
                }
            })
        })
    </script>
<%  } else { //관리자가 아닐 경우 (url 통해 접근 했을 때)
        out.println("<h5 style='text-align:center'>접근할 수 없는 페이지 입니다</h5>");
    }
%>
<%@include file="../footer.jsp"%>