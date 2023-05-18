<%--
  Created by IntelliJ IDEA.
  User: itwill
  Date: 2023-04-19
  Time: 오전 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>04_sessionTest.jsp</title>
</head>
<body>
    <h3>내장 객체</h3>
<%
    /*
    [session 내장객체]
    HttpSession session
    요청한 사용자에게 개별적으로 접근 (나만의 캐비넷)
    선언한 세션변수는 전역적 상태로 유지된다
    요청한 정보의 상태를 유지하기 위해서
    일정시간동안 이벤트가 발생되지 않으면 자동 삭제
    */
    // 세션 내장객체에서 발급해 주는 아이디
    out.print("세션 임시 아이디: ");
    out.print(session.getId());
    out.print("<hr>");

    // 세션 변수
    // 별도의 자료형이 없다
    // myweb 프로젝트의 모든 페이지에서 공유되는 전역변수 (메일/카페/블로그 등 상태 유지에 사용)

    session.setAttribute("s_id", "itwill");
    session.setAttribute("s_pw", "123456");

    // 세션변수값 가져오기
    // getAttribute -> Object 타입
    String s_id = (String)session.getAttribute("s_id");
    String s_pw = (String)session.getAttribute("s_pw");

    out.print("세션변수 s_id : " + s_id + "<hr>");
    out.print("세션변수 s_pw : " + s_pw + "<hr>");

    // 세션변수 강제 제거(로그아웃할때) -> null
    session.removeAttribute("s_id");
    session.removeAttribute("s_pw");

    out.print("세션변수 삭제 후<hr>");
    out.print("세션변수 s_id : " + session.getAttribute("s_id"));
    out.print("<hr>");
    out.print("세션변수 s_pw : " + session.getAttribute("s_pw"));
    out.print("<hr>");

    // 세션 영역에 있는 모든 값 강제 삭제
    session.invalidate();

    // 세션은 유효한 시간이 존재함
    // 기본적인 시간은 1800초(30분)
    out.print("기본 세션 유지 시간 : ");
    out.print(session.getMaxInactiveInterval() + "초(30분)" + "<hr>");

    // 세션 유효시간 10분으로 변경
    session.setMaxInactiveInterval(60*10);
    out.print("변경된 세션 유지 시간 : ");
    out.print(session.getMaxInactiveInterval() + "초(10분)" + "<hr>");

    /*
    ** 배치관리자에서 세션 시간 변경 (추천)
    <!-- 세션 유지 시간 설정 (분단위) -->
    <session-config>
    <session-timeout>20</session-timeout>
    </session-config>
    */

%>

</body>
</html>
