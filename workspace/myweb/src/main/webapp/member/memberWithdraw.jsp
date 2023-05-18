<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="ssi.jsp"%>
<%@include file="../header.jsp"%>

  <!--회원 탈퇴 폼-->
  <%--세션 아이디와 비밀번호가 DB상에서 일치하면 회원 탈퇴 처리(회원레벨 탈퇴(F1)로 수정)--%>
  <div style="height: 600px; display: flex; justify-content: center; align-items: center;">
    <div style="width: 400px; height: 300px; display: flex; flex-direction: column; justify-content: center; align-items: center;">
      <div>
        <h4>탈퇴를 원하시면 비밀번호를 입력하세요</h4>
      </div>
      <div>
        <form name="withdrawfrm" id="withdrawfrm" method="post" action="memberWithdrawProc.jsp" onsubmit="return withdrawCheck()">
          <div style="display: flex; justify-content: space-between; flex-direction: column;">
            <div style="padding: 5px;">
              <input class="form-control" type="password" name="passwd" id="passwd" placeholder="비밀번호를 입력해주세요" maxlength="20" required>
            </div>
            <div style="padding: 5px;">
              <button type="submit" class="btn btn-block">회원탈퇴</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>


<%@include file="../footer.jsp"%>