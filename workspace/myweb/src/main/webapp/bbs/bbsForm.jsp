<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="ssi.jsp"%>
<%@include file="../header.jsp"%>

    <!--게시판 글쓰기 폼-->
    <div style="margin-bottom: 10px">
        <h5> 자유게시판 > 글쓰기 </h5>
        <a href="bbsList.jsp?nowPage=<%=nowPage%>"><button class="btn btn-default">글목록</button></a>
    </div>
    <form name="bbsfrm" id="bbsfrm" method="post" action="bbsIns.jsp" onsubmit="return bbsCheck()"> <!-- myscript.js 함수 작성함 -->
        <table class="table">
            <tr>
                <th class="active">제목</th>
                <td><input type="text" name="subject" id="subject" class="form-control" maxlength="100"></td>
            </tr>
            <tr>
                <th class="active">내용</th>
                <td><textarea style="resize: none; height: 300px;" rows="5" class="form-control" name="content" id="content" ></textarea></td>
            </tr>
            <tr>
                <th class="active">작성자</th>
                <td><input type="text" name="wname" id="wname" class="form-control" maxlength="20"></td>
            </tr>
            <tr>
                <th class="active">비밀번호</th>
                <td><input type="password" name="passwd" id="passwd" class="form-control" maxlength="10"></td>
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
                if(confirm("글 작성을 취소하시겠습니까?")) { // 취소 ok
                    location.href = 'bbsList.jsp?nowPage=<%=nowPage%>'
                } else {
                    return false; // 취소버튼을 눌렀을 때 작성했던 글 삭제되지 않게 false로 리턴함
                }
            })
        })
    </script>
<%@include file="../footer.jsp"%>