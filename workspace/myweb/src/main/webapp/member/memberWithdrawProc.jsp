<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="ssi.jsp"%>
<%@include file="../header.jsp"%>

    <!--회원 탈퇴 프로세스-->
    <%--세션 아이디와 사용자가 입력한 비밀번호가 DB상에서 일치하면 회원 탈퇴 처리(회원레벨 탈퇴(F1)로 수정)--%>
    <%--일치하는 세션과 쿠키 삭제--%>
<%
    String passwd = request.getParameter("passwd").trim();

    int cnt = dao.delete(s_id, passwd);

    if (cnt<1) {
%>
    <script>
        alert("비밀번호가 일치하지 않습니다")
        location.href='javascript:history.back()'
    </script>
<% } else {
        // 생성되어있던 쿠키 삭제
        Cookie[] cookies = request.getCookies();
        for(int i=0; i<cookies.length; i++) {
            Cookie cookie = cookies[i];
            if(cookie.getName().equals("c_id") && cookie.getValue().equals(s_id)) {
                cookies[i].setMaxAge(0); // 유효시간을 0초 설정 -> 삭제하는 효과
                response.addCookie(cookies[i]);
            }
        }
        // 세션 삭제
        session.removeAttribute("s_id");
        session.removeAttribute("s_passwd");
        session.removeAttribute("s_mlevel");
%>
    <script>
        alert("회원 탈퇴가 정상 처리 되었습니다")
        location.href='../index.jsp'
    </script>
<% } %>
<%@include file="../footer.jsp"%>
