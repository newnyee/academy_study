<%--
  Created by IntelliJ IDEA.
  User: itwill
  Date: 2023-04-24
  Time: 오전 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../member/auth.jsp"%>
<%@include file="../header.jsp"%>

    <!--메일 작성 폼-->
    <h3 style="text-align: center; padding-bottom: 10px">메일 보내기</h3>
    <form method="post" action="mailProc.jsp" onsubmit="return emailValidate()">
        <table class="table">
            <tr>
                <th class="active">받는사람</th>
                <td><input type="email" name="to" id="to" class="form-control"></td>
            </tr>
            <tr>
                <th class="active">보내는사람</th>
                <td><input type="email" name="from" id="from" class="form-control"></td>
            </tr>
            <tr>
                <th class="active">제목</th>
                <td><input type="text" name="subject" id="subject" class="form-control"></td>
            </tr>
            <tr>
                <th class="active">내용</th>
                <td><textarea name="content" id="content" class="form-control" style="resize: none; height: 300px;"></textarea></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="메일보내기" class="btn btn-info">
                    <input type="reset" value="취소" class="btn btn-default">
                </td>
            </tr>
        </table>
    </form>
    <script>
        $(document).ready(()=>{ // 글 작성 취소 버튼 눌렀을 때 취소 여부 확인 alert
            $('.btn-default').on('click', ()=>{
                if(confirm("메일 작성을 취소하시겠습니까?")) { // 취소 ok
                    location.href = 'mailForm.jsp'
                } else {
                    return false; // 취소버튼을 눌렀을 때 작성했던 글 삭제되지 않게 false로 리턴함
                }
            })
        })
    </script>
<%@include file="../footer.jsp"%>