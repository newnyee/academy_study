<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@include file="../header.jsp"%>

<!--비밀번호찾기 폼-->
<%--가입한 이름과 이메일을 입력하여 일치하면 새 비밀번호를 입력한 이메일로 전송--%>
<div style="height: 600px; display: flex; justify-content: center; align-items: center;">
    <div style="width: 400px; height: 300px; display: flex; flex-direction: column; justify-content: center; align-items: center;">
        <div>
            <h4>아이디/비밀번호 찾기</h4>
        </div>
        <div>
            <form name="findIDfrm" id="findIDfrm" method="post" action="findIDProc.jsp" onsubmit="return findCheck()">
                <div style="display: flex; justify-content: space-between; flex-direction: column;">
                    <div style="padding: 5px;">
                        <input class="form-control" type="text" name="mname" id="mname" placeholder="이름" maxlength="20" requirefd>
                    </div>
                    <div style="padding: 5px;">
                        <input class="form-control" type="email" name="email" id="email" placeholder="이메일" maxlength="50" required>
                    </div>
                    <div style="padding: 5px;">
                        <button type="submit" class="btn btn-info btn-block">임시 비밀번호 발급</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    const findCheck = () => {
        if(confirm("임시 비밀번호를 발급 받으시겠습니까?")) { // 발급ok
            return true
        } else {
            return false
        }
    }

</script>

<%@include file="../footer.jsp"%>