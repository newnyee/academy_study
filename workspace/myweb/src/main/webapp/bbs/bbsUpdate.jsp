<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="ssi.jsp"%>
<%@include file="../header.jsp"%>

    <%--게시판 글 수정 패스워드 프로세스, 게시판 글 수정 폼--%>
    <div style="margin-bottom: 10px">
        <h5> 자유게시판 > 글 수정 </h5>
        <a href="bbsList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>"><button class="btn btn-default">글목록</button></a>
    </div>

<%
    int bbsno = Integer.parseInt(request.getParameter("bbsno"));
    String passwd = request.getParameter("passwd").trim();

    dto.setBbsno(bbsno);
    dto.setPasswd(passwd);

    int cnt = dao.updatePwCheck(dto);
    if (cnt == 0) {
%>
    <script>
        alert("비밀번호가 일치하지 않습니다")
        window.history.back()
    </script>
<%
    } else {
        dto = dao.read(bbsno);
    }

    if(dto==null) {
        out.println("해당 글 없음");
    } else {
%>
    <form name="bbsfrm" id="bbsfrm" method="post" action="bbsUpdateProc.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>" onsubmit="return bbsCheck()">
        <input type="hidden" name="bbsno" value="<%=bbsno%>">
        <table class="table">
            <tr>
                <th class="active">작성자</th>
                <td><input type="text" name="wname" id="wname" class="form-control" maxlength="20" value="<%=dto.getWname()%>"></td>
            </tr>
            <tr>
                <th class="active">제목</th>
                <td><input type="text" name="subject" id="subject" class="form-control" maxlength="100" value="<%=dto.getSubject()%>"></td>
            </tr>
            <tr>
                <th class="active">내용</th>
                <td><textarea style="resize: none; height: 300px;" rows="5" class="form-control" name="content" id="content"><%=dto.getContent()%></textarea></td>
            </tr>
            <tr>
                <th class="active">비밀번호</th>
                <td><input type="password" name="passwd" id="passwd" class="form-control" maxlength="10" placeholder="비밀번호 수정"></td>
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
    }

%>
    <script>
        $(document).ready(()=>{ // 글 수정 취소 버튼 눌렀을 때 취소 여부 확인 alert
            $('.btn-default').on('click', ()=>{
                if(confirm("글 수정을 취소하시겠습니까?")) { // 취소 ok
                    location.href = 'bbsList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'
                } else {
                    return false;
                }
            })
        })
    </script>
<%@include file="../footer.jsp"%>