<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@include file="../header.jsp"%>

    <%--로그인 폼--%>
<%  // 로그인 여부 확인
    if(s_id.equals("guest") || s_passwd.equals("guest") || s_mlevel.equals("guest")) { //guest 상태일 때

        // ID 저장 쿠키 확인
        Cookie[] cookies = request.getCookies(); //사용자 PC에 저장된 모든 쿠키값 가져오기
        String c_id = ""; //쿠키에 저장된 아이디를 저장할 변수
        if (cookies != null) { //쿠키값들이 존재한다면
            for(int i=0; i<cookies.length; i++) { //모든 쿠키값을 검색
                Cookie cookie = cookies[i];
                if(cookie.getName().equals("c_id")) { //쿠키변수에 c_id가 있다면
                    c_id = cookie.getValue(); // 쿠키변수 c_id의 값을 저장함
                }
            }
        }
%>
        <!-- guest 상태 일 때 보이는 로그인 화면 -->
        <div style="height: 600px; display: flex; justify-content: center; align-items: center;">
        <div style="width: 400px; height: 300px; display: flex; flex-direction: column; justify-content: center; align-items: center;">
            <div>
                <h3>로그인</h3>
            </div>
            <div>
                <form name="loginfrm" id="loginfrm" method="post" action="loginProc.jsp" onsubmit="return loginCheck()">
                    <div style="display: flex; justify-content: space-between; flex-direction: column;">
                        <div style="padding: 5px;">
                            <input class="form-control" type="text" name="id" id="id" placeholder="아이디" maxlength="10" required value="<%=c_id%>">
                        </div>
                        <div style="padding: 5px;">
                            <input class="form-control" type="password" name="passwd" id="passwd" placeholder="비밀번호" maxlength="10" required>
                        </div>
                        <div style="padding: 5px;">
                            <button type="submit" class="btn btn-info btn-block">login</button>
                        </div>
                        <div style="padding: 5px;">
                            <label><input type="checkbox" name="c_id" value="SAVE" checked> ID 저장</label> <%--label: 인덱스를 눌러도 체크박스에 체크가 됨--%>
                            &nbsp;|&nbsp;
                            <a href="agreement.jsp" style="color: black;">회원가입</a>
                            &nbsp;|&nbsp;
                            <a href="findID.jsp" style="color: black;">아이디/비밀번호찾기</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        </div>
<%
    } else { //로그인 상태일 때
%>
        <div style="height: 500px; display: flex; justify-content: center; align-items: center;">
            <div style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
                <div style="width: 300px; height: 300px; display: flex; justify-content: center; flex-direction: column;">

                    <h4 align="center"><strong><%=s_id%></strong> 님 반갑습니다!</h4>
                    <div align="center">
                        <a href="memberModify.jsp" style="color: black">회원정보수정</a>
                        |
                        <a href="memberWithdraw.jsp" style="color: black">회원탈퇴</a>
                    </div>
                    <div style="padding: 5px;">
                        <input class="btn btn-info btn-block" type="button" value="logout" onclick="location='logout.jsp'">
                    </div>
                </div>
            </div>
        </div>
<%  } %>
<%@include file="../footer.jsp"%>
